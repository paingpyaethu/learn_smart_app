import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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

        if (emailAddress.isEmpty) {}
        if (password.isEmpty) {}
        try {
          final credential = await FirebaseAuth.instance
              .signInWithEmailAndPassword(
                  email: emailAddress, password: password);
          if (credential.user == null) {}
          if (!credential.user!.emailVerified) {}
          var user = credential.user;
          if (user != null) {
            //we got varified user from firebase
          } else {
            //we have error getting user from firebase
          }
        } catch (e) {}
      }
    } catch (e) {}
  }
}
