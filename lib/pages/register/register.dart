import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learn_smart/pages/common_widgets.dart';
import 'package:learn_smart/pages/register/bloc/register_blocs.dart';
import 'package:learn_smart/pages/register/bloc/register_events.dart';
import 'package:learn_smart/pages/register/bloc/register_states.dart';
import 'package:learn_smart/pages/register/register_controller.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterBloc, RegisterStates>(builder: (context, state) {
      return Container(
        color: Colors.white,
        child: SafeArea(
            child: Scaffold(
          backgroundColor: Colors.white,
          appBar: buildAppBar('Register'),
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20.h),
                Center(
                    child: reusableText(
                        'Enter your details below & free sign up.')),
                Container(
                  margin: EdgeInsets.only(top: 40.h),
                  width: double.maxFinite,
                  // color: Colors.blue,
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      reusableText("Username"),
                      SizedBox(
                        height: 3.h,
                      ),
                      buildTextField("Enter your username", "user_name", "user",
                          (value) {
                        context.read<RegisterBloc>().add(UserNameEvent(value));
                      }),
                      reusableText("Email"),
                      SizedBox(
                        height: 3.h,
                      ),
                      buildTextField(
                          "Enter your email address", "email", "mail", (value) {
                        context.read<RegisterBloc>().add(EmailEvent(value));
                      }),
                      reusableText("Password"),
                      SizedBox(
                        height: 3.h,
                      ),
                      buildTextField("Enter your password", "password", "lock",
                          (value) {
                        context.read<RegisterBloc>().add(PasswordEvent(value));
                      }),
                      reusableText("Confirm Password"),
                      SizedBox(
                        height: 3.h,
                      ),
                      buildTextField("Enter your confirm password",
                          "confirm_password", "lock", (value) {
                        context
                            .read<RegisterBloc>()
                            .add(ConfirmPasswordEvent(value));
                      })
                    ],
                  ),
                ),
                Container(
                    margin: EdgeInsets.only(left: 20.w),
                    child: reusableText(
                        'By creating an account you have to agree with our terms and conditions.')),
                buildLogInAndRegButton("Sign Up", "primary", () {
                  RegisterController(context: context).handleRegister();
                }),
              ],
            ),
          ),
        )),
      );
    });
  }
}
