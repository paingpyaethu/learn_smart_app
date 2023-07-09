import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_smart/pages/register/bloc/register_blocs.dart';
import 'package:learn_smart/pages/sign-in/bloc/sign_in_blocs.dart';
import 'package:learn_smart/pages/welcome/bloc/welcome_blocs.dart';

class AppBlocProviders {
  static get allBlocProviders => [
        BlocProvider(
          create: (context) => WelcomeBloc(),
        ),
        BlocProvider(create: (context) => SignInBloc()),
        BlocProvider(create: ((context) => RegisterBloc())),
      ];
}
