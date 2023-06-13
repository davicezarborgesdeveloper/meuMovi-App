import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

import '../../models/user_model_mod.dart';
import './user_service.dart';

const String userCollection = 'users';

class UserServiceImpl implements UserService {
  @override
  Future<UserModelMod?> getUserById(String userId) async {
    final users = FirebaseFirestore.instance.collection(userCollection);
    final document = await users.doc(userId).get();
    return UserModelMod.fromMap(document.data()!);
  }

  @override
  Future<void> save(UserModelMod user) async {
    final store = FirebaseFirestore.instance;
    final docRef = store.collection('users').doc(user.id);
    docRef.set(user.toMap());
  }

  @override
  Future<void> update(UserModelMod user) async {
    final store = FirebaseFirestore.instance;
    final docRef = store.collection('users').doc(user.id);
    docRef.update(user.toMap());
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
}
