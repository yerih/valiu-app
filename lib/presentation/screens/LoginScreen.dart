import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:valiu_app/data/repositories/AuthRepository.dart';

import '../../data/datasources/auth_service.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<StatefulWidget> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final AuthRepository authRepo = AuthRepository();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.black,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ), // Corner radius
        ),
        child: const Text('Login'),
        onPressed: () {
          authRepo.signIn(email: 'a@a.com', password: 'password1.').then((value) {
            debugPrint('chekc this: ${value.message}. isSuccess = ${value.isSuccess}');
            // debugPrint('chekc this: ${value.message}');
          });
        },
      ),
    );
  }


}
