import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

import '../../models/dashboard/dashboard_task_model.dart';
import '../../models/task_model.dart';
import 'task_service.dart';

const String taskCollection = 'tasks';

class TaskServiceImpl implements TaskService {
  @override
  Future<void> save(TaskModel model) async {
    final taskRef = FirebaseFirestore.instance.collection(taskCollection);
    final QuerySnapshot querySnapshot = await taskRef.get();
    int idRef = 1;

    if (querySnapshot.docs.isNotEmpty) {
      if (model.code == null) {
        idRef = int.parse(
              querySnapshot.docs[querySnapshot.docs.length - 1]['code'],
            ) +
            1;
      } else {
        idRef = int.parse(model.code!);
      }
    }
    model = model.copyWith(code: idRef.toString());
    taskRef.doc(idRef.toString()).set(model.toMap());
  }

  Future<bool> checkIfDocExists(String docId) async {
    final doc = await FirebaseFirestore.instance
        .collection(taskCollection)
        .doc(docId)
        .get();
    return doc.exists;
  }

  @override
  Future<List<TaskModel>> getAllTasks([String? userId, int? status]) async {
    final collectionRef = FirebaseFirestore.instance.collection(taskCollection);
    final QuerySnapshot querySnapshot = await collectionRef.get();
    var list = <TaskModel>[];
    if (userId == null && status == null) {
      list = querySnapshot.docs
          .map((doc) => TaskModel.fromMap(doc.data() as Map<String, dynamic>))
          .toList();
    } else if (status == null) {
      for (var doc in querySnapshot.docs) {
        final map = doc.data() as Map<String, dynamic>;
        if (map['syndicate'] == userId) {
          list.add(TaskModel.fromMap(map));
        }
      }
    } else {
      for (var doc in querySnapshot.docs) {
        final map = doc.data() as Map<String, dynamic>;
        if (map['syndicate'] == userId && map['status'] == status) {
          list.add(TaskModel.fromMap(map));
        }
      }
    }
    return list;
  }

  @override
  Future<void> delete(String id) async {
    final taskRef = FirebaseFirestore.instance.collection(taskCollection);
    await taskRef.doc(id).delete();
  }

  @override
  Future<List<TaskModel>> getTasksbyServiceTaker(String? userId) async {
    final collectionRef = FirebaseFirestore.instance.collection(taskCollection);
    final QuerySnapshot querySnapshot = await collectionRef.get();
    final list = <TaskModel>[];
    for (var doc in querySnapshot.docs) {
      final map = doc.data() as Map<String, dynamic>;
      if (map['servTaker']['code'] == userId) {
        list.add(TaskModel.fromMap(map));
      }
    }
    return list;
  }

  @override
  Future<DashboardTaskModel> getTasksDashboardServiceTaker(
    String? userId,
  ) async {
    final collectionRef = FirebaseFirestore.instance.collection(taskCollection);
    final QuerySnapshot querySnapshot = await collectionRef.get();
    final DashboardTaskModel dash = DashboardTaskModel(
      opened: <TaskModel>[],
      confirmed: <TaskModel>[],
      inProgress: <TaskModel>[],
      finished: <TaskModel>[],
    );
    for (var doc in querySnapshot.docs) {
      final map = doc.data() as Map<String, dynamic>;
      if (map['servTaker']['code'] == userId) {
        switch (map['status']) {
          case 0:
          case 1:
            dash.opened!.add(TaskModel.fromMap(map));
            break;
          case 2:
            dash.confirmed!.add(TaskModel.fromMap(map));
            break;
          case 3:
            dash.inProgress.add(TaskModel.fromMap(map));
            break;
          case 4:
            dash.finished.add(TaskModel.fromMap(map));
        }
      }
    }
    return dash;
  }

  @override
  Future<DashboardTaskModel> getTasksDashboardSyndicate(String? userId) async {
    final collectionRef = FirebaseFirestore.instance.collection(taskCollection);
    final QuerySnapshot querySnapshot = await collectionRef.get();
    final DashboardTaskModel dash = DashboardTaskModel(
      inAnalysis: <TaskModel>[],
      opened: <TaskModel>[],
      waitStart: <TaskModel>[],
      inProgress: <TaskModel>[],
      finished: <TaskModel>[],
    );
    for (var doc in querySnapshot.docs) {
      final map = doc.data() as Map<String, dynamic>;
      if (map['syndicate'] == userId && map['access'] >= 1) {
        switch (map['status']) {
          case 0:
            dash.inAnalysis!.add(TaskModel.fromMap(map));
          case 1:
            dash.opened!.add(TaskModel.fromMap(map));
            break;
          case 2:
            dash.waitStart!.add(TaskModel.fromMap(map));
            break;
          case 3:
            dash.inProgress.add(TaskModel.fromMap(map));
            break;
          case 4:
            dash.finished.add(TaskModel.fromMap(map));
        }
      }
    }
    return dash;
  }

  @override
  Future<DashboardTaskModel> getTasksDashboardWorker(
    String? synId,
    String orderId,
  ) async {
    final taskRef = FirebaseFirestore.instance.collection(taskCollection);
    final QuerySnapshot querySnapshot = await taskRef.get();
    final docOrder = FirebaseFirestore.instance
        .collection('order')
        .doc(orderId)
        .collection('task');

    final DashboardTaskModel dash = DashboardTaskModel(
      available: <TaskModel>[],
      confirmed: <TaskModel>[],
      inProgress: <TaskModel>[],
      finished: <TaskModel>[],
    );
    for (var doc in querySnapshot.docs) {
      final map = doc.data() as Map<String, dynamic>;
      if (map['syndicate'] == synId && map['access'] == 2) {
        switch (map['status']) {
          case 1:
            final taskMap = await docOrder.doc(map['code']).get();
            if (taskMap.exists && taskMap['statusTask'] == 2) {
              dash.confirmed!.add(TaskModel.fromMap(map));
            } else {
              dash.available!.add(TaskModel.fromMap(map));
            }
            break;
          case 2:
            dash.confirmed!.add(TaskModel.fromMap(map));
            break;
          case 3:
            dash.inProgress.add(TaskModel.fromMap(map));
            break;
          case 4:
            dash.finished.add(TaskModel.fromMap(map));
        }
      }
    }
    return dash;
  }

  @override
  Future<void> sentToSyndicate(String taskCode, String syndicateCode) async {
    final taskRef = FirebaseFirestore.instance.collection(taskCollection);
    taskRef.doc(taskCode).update({'access': 1, 'syndicate': syndicateCode});
  }

  @override
  Future<void> returnServiceTaker(String taskCode) async {
    final taskRef = FirebaseFirestore.instance.collection(taskCollection);
    taskRef.doc(taskCode).update({'access': 0, 'syndicate': null});
  }

  @override
  Future<void> sendWorker(String taskCode) async {
    final taskRef = FirebaseFirestore.instance.collection(taskCollection);
    taskRef.doc(taskCode).update({'access': 2, 'status': 1});
  }

  @override
  Future<void> acceptTask(TaskModel task, String idUser) async {
    final now = DateFormat('dd/MM/yyyy HH:mm').format(DateTime.now());
    final orderRef = FirebaseFirestore.instance.collection('order');
    final QuerySnapshot querySnapshot = await orderRef.get();
    int idRef = 1;

    if (querySnapshot.docs.isNotEmpty) {
      idRef = querySnapshot.docs[querySnapshot.docs.length - 1]['id'] + 1;
    }

    orderRef.doc(idUser).collection('task').doc(task.code).set({
      'id': idRef,
      'task': task.descriptionService,
      'statusTask': 2,
      'statusPayment': 0,
      'amountReceivable': task.unitaryValue,
      'date': now,
    });
  }
}
