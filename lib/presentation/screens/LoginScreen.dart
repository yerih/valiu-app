import 'package:flutter/material.dart';
import 'package:valiu_app/data/repositories/AuthRepository.dart';


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
        onPressed: () async {
          // final list = await FirebaseRealTimeDB.getNews();
          // debugPrint(list.toString());
          // final result = await authRepo.signUp(email: 'a@a.com', password: 'password1.');
          // final result = await authRepo.signIn(email: 'a@a.com', password: 'password1.');
          // switch(result){
          //   case Result(isSuccess: true): debugPrint('signIn success'); break;
          //   case Result(isError: true): debugPrint('signIn error: ${result.message}'); break;
          //   default: break;
          // }
        },
      ),
    );
  }


}
