import 'package:cloud_firestore/cloud_firestore.dart';

import '../../models/syndicate_model.dart';
import 'syndicate_service.dart';

class SyndicateServiceImpl implements SyndicateService {
  @override
  Future<void> saveSyndicate(SyndicateModel user) async {
    final store = FirebaseFirestore.instance;
    final docRef = store.collection('users').doc(user.user);

    docRef.set(user.toMap());
    store.collection('login').doc(user.user).set({
      'user': user.user,
      'password': user.password,
      'profileType': user.profileType,
      'active': user.active,
      'displayName': user.companyData.fantasyName,
    });
  }

  @override
  Future<void> syndicateUpdate(SyndicateModel data) async {
    final store = FirebaseFirestore.instance;
    final docRef = store.collection('users').doc(data.user);
    docRef.update(data.toMap());
  }

  @override
  Future<List<SyndicateModel>> getSyndicates() async {
    final collectionRef = FirebaseFirestore.instance.collection('users');
    final QuerySnapshot querySnapshot = await collectionRef.get();
    final list = <SyndicateModel>[];
    for (var doc in querySnapshot.docs) {
      final map = doc.data() as Map<String, dynamic>;
      if (map['profileType'] == 1) {
        list.add(SyndicateModel.fromMap(map));
      }
    }
    return list;
  }
}
