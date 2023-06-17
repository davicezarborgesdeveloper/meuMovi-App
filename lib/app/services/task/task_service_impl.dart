import 'package:cloud_firestore/cloud_firestore.dart';

import '../../models/task_model.dart';
import 'task_service.dart';

class TaskServiceImpl implements TaskService {
  @override
  Future<void> save(TaskModel model) async {
    final store = FirebaseFirestore.instance;
    final docRef = store.collection('tasks').doc();
    docRef.set(model.toMap());
  }
}
