import 'package:cloud_firestore/cloud_firestore.dart';

import '../../models/service_taker_model.dart';
import './service_taker_service.dart';

const String userCollection = 'users';

class ServiceTakerServiceImpl implements ServiceTakerService {
  @override
  Future<void> saveServiceTaker(ServiceTakerModel data) async {
    final store = FirebaseFirestore.instance;
    final docRef = store.collection(userCollection).doc(data.user);

    docRef.set(data.toMap());
    store.collection('login').doc(data.user).set({
      'user': data.user,
      'password': data.password,
      'profileType': data.profileType,
      'active': data.active,
      'displayName': data.companyName,
    });
  }

  @override
  Future<void> serviceTakerUpdate(ServiceTakerModel data) async {
    final store = FirebaseFirestore.instance;
    final docRef = store.collection(userCollection).doc(data.user);
    docRef.update(data.toMap());
  }

  @override
  Future<List<ServiceTakerModel>> getAllServiceTaker([String? userId]) async {
    final collectionRef = FirebaseFirestore.instance.collection(userCollection);
    final QuerySnapshot querySnapshot = await collectionRef.get();
    final serviceTakerList = <ServiceTakerModel>[];
    for (var doc in querySnapshot.docs) {
      final map = doc.data() as Map<String, dynamic>;
      if (map['profileType'] == 0) {
        if (userId != null) {
          if (map['employeer'] != null && map['employeer']['code'] == userId) {
            serviceTakerList.add(ServiceTakerModel.fromMap(map));
          }
        } else {
          serviceTakerList.add(ServiceTakerModel.fromMap(map));
        }
      }
    }
    return serviceTakerList;
  }

  @override
  Future<void> delete(String id) async {
    final userRef = FirebaseFirestore.instance.collection(userCollection);
    await userRef.doc(id).delete();
  }
}
