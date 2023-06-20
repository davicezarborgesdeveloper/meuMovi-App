import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

import '../../models/service_taker_model.dart';
import '../../models/syndicate_model.dart';
import '../../models/user_model.dart';
import '../../models/worker_model.dart';
import './user_service.dart';

const String userCollection = 'users';

class UserServiceImpl implements UserService {
  @override
  Future<UserModel?> getUserById(String userId) async {
    final users = FirebaseFirestore.instance.collection(userCollection);
    final document = await users.doc(userId).get();
    switch (document.data()!['profileType']) {
      case 0:
        return WorkerModel.fromMap(document.data()!);
      case 1:
        return ServiceTakerModel.fromMap(document.data()!);
      case 2:
        return SyndicateModel.fromMap(document.data()!);
      default:
        return null;
    }
  }

  @override
  Future<void> deleteField(String userId, String field) async {
    final store = FirebaseFirestore.instance;
    final docRef = store.collection('users').doc(userId);
    await docRef.update({field: FieldValue.delete()});
  }

  @override
  Future<String> uploadImage(Uint8List image, String userId) async {
    final Reference ref =
        FirebaseStorage.instance.ref('/images/profile/$userId.jpg');
    final UploadTask uploadTask = ref.putData(image);
    final urlImage = await (await uploadTask).ref.getDownloadURL();

    return urlImage;
  }

  @override
  Future<void> saveWorker(WorkerModel user) async {
    final store = FirebaseFirestore.instance;
    final docRef = store.collection('users').doc(user.user);

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
    final docRef = store.collection('users').doc(data.user);
    docRef.update(data.toMap());
  }

  @override
  Future<void> saveServiceTaker(ServiceTakerModel user) async {
    final store = FirebaseFirestore.instance;
    final docRef = store.collection('users').doc(user.user);

    docRef.set(user.toMap());
    store.collection('login').doc(user.user).set({
      'user': user.user,
      'password': user.password,
      'profileType': user.profileType,
      'active': user.active,
      'displayName': user.companyName,
    });
  }

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
  Future<void> deleteDocument(String userId) async {
    final store = FirebaseFirestore.instance;
    store.collection('users').doc(userId).delete();
    store.collection('login').doc(userId).delete();
  }
}
