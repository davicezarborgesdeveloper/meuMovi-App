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
  Future<DashboardTaskModell> getTasksDashboardServiceTaker(
    String? userId,
  ) async {
    final collectionRef = FirebaseFirestore.instance.collection(taskCollection);
    final QuerySnapshot querySnapshot = await collectionRef.get();
    final DashboardTaskModell dash = DashboardTaskModell(
      opened: DashboardList(list: <TaskModel>[], amountValue: 0.0),
      confirmed: DashboardList(list: <TaskModel>[], amountValue: 0.0),
      inProgress: DashboardList(list: <TaskModel>[], amountValue: 0.0),
      finished: DashboardList(list: <TaskModel>[], amountValue: 0.0),
    );
    for (var doc in querySnapshot.docs) {
      final map = doc.data() as Map<String, dynamic>;
      if (map['servTaker']['code'] == userId) {
        switch (map['status']) {
          case 0:
          case 1:
            dash.opened!.list!.add(TaskModel.fromMap(map));
            break;
          case 2:
            dash.confirmed!.list!.add(TaskModel.fromMap(map));
            break;
          case 3:
            dash.inProgress.list!.add(TaskModel.fromMap(map));
            break;
          case 4:
            dash.finished.list!.add(TaskModel.fromMap(map));
        }
      }
    }
    dash.opened!.amountValue = dash.opened!.list!
        .fold(0.0, (previousValue, p) => previousValue! + p.totalValueTask!);
    dash.confirmed!.amountValue = dash.confirmed!.list!
        .fold(0.0, (previousValue, p) => previousValue! + p.totalValueTask!);
    dash.inProgress.amountValue = dash.inProgress.list!
        .fold(0.0, (previousValue, p) => previousValue! + p.totalValueTask!);
    dash.finished.amountValue = dash.finished.list!
        .fold(0.0, (previousValue, p) => previousValue! + p.totalValueTask!);
    return dash;
  }

  @override
  Future<DashboardTaskModell> getTasksDashboardSyndicate(String? userId) async {
    final collectionRef = FirebaseFirestore.instance.collection(taskCollection);
    final QuerySnapshot querySnapshot = await collectionRef.get();
    final DashboardTaskModell dash = DashboardTaskModell(
      inAnalysis: DashboardList(list: <TaskModel>[], amountValue: 0.0),
      opened: DashboardList(list: <TaskModel>[], amountValue: 0.0),
      waitStart: DashboardList(list: <TaskModel>[], amountValue: 0.0),
      inProgress: DashboardList(list: <TaskModel>[], amountValue: 0.0),
      finished: DashboardList(list: <TaskModel>[], amountValue: 0.0),
    );
    for (var doc in querySnapshot.docs) {
      final map = doc.data() as Map<String, dynamic>;
      if (map['syndicate'] == userId && map['access'] >= 1) {
        switch (map['status']) {
          case 0:
            dash.inAnalysis!.list!.add(TaskModel.fromMap(map));
          case 1:
            dash.opened!.list!.add(TaskModel.fromMap(map));
            break;
          case 2:
            dash.waitStart!.list!.add(TaskModel.fromMap(map));
            break;
          case 3:
            dash.inProgress.list!.add(TaskModel.fromMap(map));
            break;
          case 4:
            dash.finished.list!.add(TaskModel.fromMap(map));
        }
      }
    }
    dash.inAnalysis!.amountValue = dash.inAnalysis!.list!
        .fold(0.0, (previousValue, p) => previousValue! + p.totalValueTask!);
    dash.opened!.amountValue = dash.opened!.list!
        .fold(0.0, (previousValue, p) => previousValue! + p.totalValueTask!);
    dash.waitStart!.amountValue = dash.waitStart!.list!
        .fold(0.0, (previousValue, p) => previousValue! + p.totalValueTask!);
    dash.inProgress.amountValue = dash.inProgress.list!
        .fold(0.0, (previousValue, p) => previousValue! + p.totalValueTask!);
    dash.finished.amountValue = dash.finished.list!
        .fold(0.0, (previousValue, p) => previousValue! + p.totalValueTask!);
    return dash;
  }

  @override
  Future<DashboardTaskModell> getTasksDashboardWorker(
    String? synId,
    String orderId,
  ) async {
    final taskRef = FirebaseFirestore.instance.collection(taskCollection);
    final QuerySnapshot querySnapshot = await taskRef.get();
    final docOrder = FirebaseFirestore.instance
        .collection('order')
        .doc(orderId)
        .collection('task');

    final DashboardTaskModell dash = DashboardTaskModell(
      available: DashboardList(list: <TaskModel>[], amountValue: 0.0),
      confirmed: DashboardList(list: <TaskModel>[], amountValue: 0.0),
      inProgress: DashboardList(list: <TaskModel>[], amountValue: 0.0),
      finished: DashboardList(list: <TaskModel>[], amountValue: 0.0),
    );
    for (var doc in querySnapshot.docs) {
      final map = doc.data() as Map<String, dynamic>;
      if (map['syndicate'] == synId && map['access'] == 2) {
        switch (map['status']) {
          case 1:
            final taskMap = await docOrder.doc(map['code']).get();
            if (taskMap.exists && taskMap['statusTask'] == 2) {
              dash.confirmed!.list!.add(TaskModel.fromMap(map));
            } else {
              dash.available!.list!.add(TaskModel.fromMap(map));
            }
            break;
          case 2:
            dash.confirmed!.list!.add(TaskModel.fromMap(map));
            break;
          case 3:
            dash.inProgress.list!.add(TaskModel.fromMap(map));
            break;
          case 4:
            dash.finished.list!.add(TaskModel.fromMap(map));
        }
      }
    }
    dash.available!.amountValue = dash.available!.list!
        .fold(0.0, (previousValue, p) => previousValue! + p.totalValueTask!);
    dash.confirmed!.amountValue = dash.confirmed!.list!
        .fold(0.0, (previousValue, p) => previousValue! + p.totalValueTask!);
    dash.inProgress.amountValue = dash.inProgress.list!
        .fold(0.0, (previousValue, p) => previousValue! + p.totalValueTask!);
    dash.finished.amountValue = dash.finished.list!
        .fold(0.0, (previousValue, p) => previousValue! + p.totalValueTask!);
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
