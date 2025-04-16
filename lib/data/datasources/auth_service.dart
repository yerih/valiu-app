


import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';


ValueNotifier<AuthService> authService = ValueNotifier<AuthService>(AuthService());

class AuthService {

  final FirebaseAuth  _firebaseAuth = FirebaseAuth.instance;
  // final FirebaseAuth  firebaseAuth = FirebaseAuth.instance;

  User? get currentUser => _firebaseAuth.currentUser;

  Stream<User?> get authStateChange => _firebaseAuth.authStateChanges();

  Future<UserCredential> signIn({
    required String email,
    required String password
  }) async {
    return await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
  }

  Future<UserCredential> signUp({
    required String email,
    required password
  }) async {
    return await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
  }

  Future<void> signOut() async => _firebaseAuth.signOut();

  Future<void> resetPassword({required String email}) async => _firebaseAuth.sendPasswordResetEmail(email: email);

  // Future<void> resetPasswordFromCurrentPassword({
  //   required String email,
  //   required String password,
  //   required String newPassword
  // }) async{
  //     AuthCredential credential = EmailAuthProvider.credential(email: email, password: password);
  //     await currentUser!.reauthenticateWithCredential(credential);
  //     await currentUser!.updatePassword(newPassword);
  // }
  //
  // Future<void> deleteAccount({
  //   required String email,
  //   required String password,
  // }) async {
  //   AuthCredential credential = EmailAuthProvider.credential(email: email, password: password);
  //   await firebaseAuth.currentUser?.reauthenticateWithCredential(credential);
  //   await firebaseAuth.currentUser?.delete();
  //   await signOut();
  // }
}

