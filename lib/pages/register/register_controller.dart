import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_smart/common/widgets/flutter_toast.dart';
import 'package:learn_smart/pages/register/bloc/register_blocs.dart';

class RegisterController {
  final BuildContext context;
  const RegisterController({required this.context});

  Future<void> handleRegister() async {
    final userInformation = context.read<RegisterBloc>().state;

    String userName = userInformation.userName;
    String emailAddress = userInformation.email;
    String password = userInformation.password;
    String confirmPassword = userInformation.confirm_password;

    if (userName.isEmpty) {
      toastInfo(msg: 'User name is Required!');
      return;
    }
    if (emailAddress.isEmpty) {
      toastInfo(msg: 'Email is Required!');
      return;
    }
    if (password.isEmpty) {
      toastInfo(msg: 'Password is Required!');
      return;
    }
    if (confirmPassword.isEmpty) {
      toastInfo(msg: 'Confirmation Password is Required!');
      return;
    }
    if (password != confirmPassword) {
      toastInfo(msg: 'You have to same both password!');
      return;
    }

    try {
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: emailAddress, password: password);
      if (credential.user != null) {
        await credential.user?.sendEmailVerification();
        await credential.user?.updateDisplayName(userName);
        toastInfo(msg: 'An email has benn sent to your registered email.');
        Navigator.of(context).pop();
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        toastInfo(msg: 'The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        toastInfo(msg: 'The email is already in use.');
      } else if (e.code == 'invalid-email') {
        toastInfo(msg: 'Your email format is wrong!');
      }
    }
  }
}
