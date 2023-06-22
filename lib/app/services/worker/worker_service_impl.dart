import 'package:cloud_firestore/cloud_firestore.dart';

import '../../models/worker_model.dart';
import 'worker_service.dart';

const String userCollection = 'users';

class WorkerServiceImpl implements WorkerService {
  @override
  Future<void> saveWorker(WorkerModel user) async {
    final store = FirebaseFirestore.instance;
    final docRef = store.collection(userCollection).doc(user.user);

    docRef.set(user.toMap());
    store.collection('login').doc(user.user).set({
      'user': user.user,
      'password': user.password,
      'profileType': user.profileType,
      'active': user.active,
      'displayName': '${user.name} ${user.lastname}',
    });
  }

  @override
  Future<void> workerUpdate(WorkerModel data) async {
    final store = FirebaseFirestore.instance;
    final docRef = store.collection(userCollection).doc(data.user);
    docRef.update(data.toMap());
  }

  @override
  Future<List<WorkerModel>> getAllWorkers() async {
    final collectionRef = FirebaseFirestore.instance.collection(userCollection);
    final QuerySnapshot querySnapshot = await collectionRef.get();
    final workerList = <WorkerModel>[];
    for (var doc in querySnapshot.docs) {
      final map = doc.data() as Map<String, dynamic>;
      if (map['profileType'] == 0) {
        workerList.add(WorkerModel.fromMap(map));
      }
    }
    return workerList;
  }

  @override
  Future<void> delete(String id) async {
    final userRef = FirebaseFirestore.instance.collection(userCollection);
    await userRef.doc(id).delete();
  }
}
