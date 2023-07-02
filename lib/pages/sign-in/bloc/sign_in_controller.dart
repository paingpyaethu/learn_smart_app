import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_smart/common/widgets/flutter_toast.dart';
import 'package:learn_smart/pages/sign-in/bloc/sign_in_blocs.dart';

class SignInController {
  final BuildContext context;

  const SignInController({required this.context});

  Future<void> handleSignIn(String type) async {
    try {
      if (type == "email") {
        // BlocProvider.of<SignInBloc>(context).state;
        final userInformation = context.read<SignInBloc>().state;
        String emailAddress = userInformation.email;
        String password = userInformation.password;

        if (emailAddress.isEmpty) {
          toastInfo(msg: 'Required Email!');
          return;
        }
        if (password.isEmpty) {
          toastInfo(msg: 'Required Password!');
          return;
        }
        try {
          final credential = await FirebaseAuth.instance
              .signInWithEmailAndPassword(
                  email: emailAddress, password: password);
          if (credential.user == null) {
            toastInfo(msg: 'User does not exist!');
            return;
          }
          if (!credential.user!.emailVerified) {
            toastInfo(msg: 'You need to verify email address!');
            return;
          }
          var user = credential.user;
          if (user != null) {
            //we got varified user from firebase
            print('user exists');
            return;
          } else {
            //we have error getting user from firebase
            toastInfo(msg: 'Currently you are not a user of this app.');
            return;
          }
        } on FirebaseAuthException catch (e) {
          if (e.code == 'user-not-found') {
            toastInfo(msg: 'No user found for that email!');
          } else if (e.code == 'wrong-password') {
            toastInfo(msg: 'Wrong password provided for that user!');
          } else if (e.code == 'invalid-email') {
            toastInfo(msg: 'Your email format is wrong!');
          }
        }
      }
    } catch (e) {}
  }
}
