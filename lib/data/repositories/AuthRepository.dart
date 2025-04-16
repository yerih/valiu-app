


import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

import '../../core/Result.dart';
import '../datasources/auth_service.dart';

class AuthRepository{
  final AuthService authService = AuthService();

  Future<Result<bool>> signIn({
    required String email,
    required String password
  }) async {
    try{
      await authService.signIn(email: email, password: password);
      // debugPrint('firebase success');
      return Result(data: true);
    } on FirebaseAuthException catch(e){
      e.code;
      // debugPrint('firebase exception: ${e.message}');
      return Result(data: null, message: e.message);
    }
  }

  Future<Result<bool>> signUp({
    required String email,
    required String password
  }) async {
    try{
      await authService.signUp(email: email, password: password);
      // debugPrint('firebase success');
      return Result(data: true);
    } on FirebaseAuthException catch(e){
      e.code;
      // debugPrint('firebase exception: ${e.message}');
      return Result(data: null, message: e.message);
    }
  }

}


