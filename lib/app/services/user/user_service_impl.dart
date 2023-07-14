import 'dart:convert';
import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

import '../../core/exceptions/repository_exception.dart';
import '../../core/global/constants.dart';
import '../../core/storage/storage.dart';
import '../../models/service_taker_model.dart';
import '../../models/syndicate_model.dart';
import '../../models/user_model.dart';
import '../../models/worker_model.dart';
import './user_service.dart';

const String userCollection = 'users';

class UserServiceImpl implements UserService {
  @override
  Future<Map<String, dynamic>> login(
    String login,
    String password,
    bool rememberMe,
  ) async {
    final users = FirebaseFirestore.instance.collection('users');
    late dynamic user;
    final document = await users.doc(login).get();
    if (document.data() != null) {
      final data = document.data();
      if (data!['profileType'] == 0) {
        user = ServiceTakerModel.fromMap(data);
      } else if (data['profileType'] == 1) {
        user = SyndicateModel.fromMap(data);
      } else {
        user = WorkerModel.fromMap(data);
      }

      await Storage().setData(
        SharedStoreKeys.authAccess.key,
        user.toJson(),
      );
      await Storage().setData(SharedStoreKeys.keepLogged.key, rememberMe);
      return data;
    } else {
      throw RepositoryException(message: 'Erro ao Logar');
    }
  }

  @override
  Future<UserModel?> getUserById(String userId) async {
    final users = FirebaseFirestore.instance.collection(userCollection);
    final document = await users.doc(userId).get();
    print(jsonEncode(document.data()!));
    switch (document.data()!['profileType']) {
      case 0:
        return ServiceTakerModel.fromMap(document.data()!);
      case 1:
        return SyndicateModel.fromMap(document.data()!);
      case 2:
        return WorkerModel.fromMap(document.data()!);
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
  Future<void> deleteDocument(String userId) async {
    final store = FirebaseFirestore.instance;
    store.collection('users').doc(userId).delete();
    store.collection('login').doc(userId).delete();
  }
}
