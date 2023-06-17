import '../../core/exceptions/repository_exception.dart';
import '../../core/global/constants.dart';
import '../../core/storage/storage.dart';
import '../../models/auth_model.dart';
import './auth_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthFirebaseServiceImpl implements AuthService {
  static User? _currentUser;

  @override
  Future<AuthModel?> login(
    String userId,
    String password,
    bool rememberMe,
  ) async {
    final users = FirebaseFirestore.instance.collection('login');
    final document = await users.doc(userId).get();
    if (document.data() != null) {
      final data = document.data();
      final user = AuthModel(
        displayName: data!['displayName'] as String,
        userId: data['user'] as String,
        profileType: data['profileType'] as int,
      );
      await Storage().setData(
        SharedStoreKeys.authAccess.key,
        user.toJson(),
      );
      await Storage().setData(SharedStoreKeys.keepLogged.key, rememberMe);
      return user;
    } else {
      throw RepositoryException(message: 'Erro ao Logar');
    }
  }

  @override
  User? get currentUser {
    _currentUser ??= FirebaseAuth.instance.currentUser;
    return _currentUser;
  }

  @override
  Future<void> deleteUser() async {
    Storage().clean();
    currentUser!.delete();
  }

  @override
  Future<void> logout() async {
    Storage().clean();
    await FirebaseAuth.instance.signOut();
  }

  // @override
  // Future<AuthModel?> signup({
  //   required String email,
  //   required String password,
  //   required UserModel user,
  // }) async {
  //   final auth = FirebaseAuth.instance;

  //   final UserCredential credential = await auth.createUserWithEmailAndPassword(
  //     email: user.email,
  //     password: password,
  //   );

  //   if (credential.user != null) {
  //     user.id = credential.user?.uid;
  //     await auth.currentUser?.updateDisplayName(user.name);

  //     final AuthModel? userModel = await login(email, password, false);
  //     await UserService().save(user);
  //     return userModel;
  //   }
  //   return null;
  // }
}
