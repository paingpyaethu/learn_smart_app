import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learn_smart/pages/sign-in/widgets/sign_in_widget.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
          child: Scaffold(
        backgroundColor: Colors.white,
        appBar: buildAppBar(),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildThirdPartyLogin(context),
              Center(child: reusableText('Or use your email account to login')),
              Container(
                margin: EdgeInsets.only(top: 40.h),
                width: double.maxFinite,
                // color: Colors.blue,
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    reusableText("Email"),
                    SizedBox(
                      height: 3.h,
                    ),
                    buildTextField("Enter your email address", "email", "user"),
                    reusableText("Password"),
                    SizedBox(
                      height: 3.h,
                    ),
                    buildTextField("Enter your password", "password", "lock")
                  ],
                ),
              ),
              forgotPassword(),
              buildLogInAndRegButton("Log In", "login"),
              buildLogInAndRegButton("Sign Up", "register"),
            ],
          ),
        ),
      )),
    );
  }
}
