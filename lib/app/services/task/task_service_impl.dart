import 'package:cloud_firestore/cloud_firestore.dart';

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
  Future<DashboardTaskModel> getTasksDashboard(String? userId) async {
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
            dash.opened.add(TaskModel.fromMap(map));
            break;
          case 2:
            dash.confirmed.add(TaskModel.fromMap(map));
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
}
