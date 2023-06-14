// import '../../core/global/constants.dart';
// import '../../core/storage/storage.dart';
// import '../../models/auth_model.dart';
// import '../../models/user_model_mod.dart';
// import '../user/user_service.dart';
// import './auth_service.dart';
// import 'package:firebase_auth/firebase_auth.dart';

// class AuthFirebaseServiceImpl implements AuthService {
//   static User? _currentUser;

//   @override
//   Future<AuthModel?> login(
//     String email,
//     String password,
//     bool rememberMe,
//   ) async {
//     final UserCredential credential = await FirebaseAuth.instance
//         .signInWithEmailAndPassword(email: email, password: password);
//     final AuthModel user = AuthModel(
//       displayName: credential.user!.displayName!,
//       email: email,
//       uid: credential.user!.uid,
//     );
//     await Storage().setData(
//       SharedStoreKeys.authAccess.key,
//       user.toJson(),
//     );
//     await Storage().setData(SharedStoreKeys.keepLogged.key, rememberMe);
//     return user;
//   }

//   @override
//   User? get currentUser {
//     _currentUser ??= FirebaseAuth.instance.currentUser;
//     return _currentUser;
//   }

//   @override
//   Future<void> deleteUser() async {
//     Storage().clean();
//     currentUser!.delete();
//   }

//   @override
//   Future<void> logout() async {
//     Storage().clean();
//     await FirebaseAuth.instance.signOut();
//   }

//   @override
//   Future<AuthModel?> signup({
//     required String email,
//     required String password,
//     required UserModelMod user,
//   }) async {
//     final auth = FirebaseAuth.instance;

//     final UserCredential credential = await auth.createUserWithEmailAndPassword(
//       email: user.email,
//       password: password,
//     );

//     if (credential.user != null) {
//       user.id = credential.user?.uid;
//       await auth.currentUser?.updateDisplayName(user.name);

//       final AuthModel? userModel = await login(email, password, false);
//       await UserService().save(user);
//       return userModel;
//     }
//     return null;
//   }
// }
