import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_smart/common/routes/routes.dart';
import 'package:learn_smart/pages/register/bloc/register_blocs.dart';
import 'package:learn_smart/pages/register/register.dart';
import 'package:learn_smart/pages/sign-in/bloc/sign_in_blocs.dart';
import 'package:learn_smart/pages/sign-in/sign_in.dart';
import 'package:learn_smart/pages/welcome/bloc/welcome_blocs.dart';
import 'package:learn_smart/pages/welcome/welcome.dart';

class AppPages {
  static List<PageEntity> routes() {
    return [
      PageEntity(
          routes: AppRoutes.INITIAL,
          page: Welcome(),
          bloc: BlocProvider(create: (_) => WelcomeBloc())),
      PageEntity(
          routes: AppRoutes.LOGIN,
          page: SignIn(),
          bloc: BlocProvider(create: (_) => SignInBloc())),
      PageEntity(
          routes: AppRoutes.REGISTER,
          page: Register(),
          bloc: BlocProvider(create: (_) => RegisterBloc())),
      PageEntity(
          routes: AppRoutes.APPLICATION,
          page: Welcome(),
          bloc: BlocProvider(create: (_) => WelcomeBloc())),
    ];
  }

// Return all bloc providers
  static List<dynamic> allBlocProviders(BuildContext context) {
    List<dynamic> blocProviders = <dynamic>[];
    for (var blocs in routes()) {
      blocProviders.add(blocs.bloc);
    }
    return blocProviders;
  }

  static MaterialPageRoute GenerateRouteSettings(RouteSettings settings) {
    if (settings.name != null) {
      // Check for route name matching when navigator gets triggered.
      var result = routes().where((element) => element.routes == settings.name);
      if (result.isNotEmpty) {
        //
        return MaterialPageRoute(
            builder: (_) => result.first.page, settings: settings);
      }
    }
    // If invalid route name, go to Login Page automatically.
    return MaterialPageRoute(builder: (_) => SignIn(), settings: settings);
  }
}

// Unify BlocProvider and routes and pages
class PageEntity {
  String routes;
  Widget page;
  dynamic bloc;

  PageEntity({required this.routes, required this.page, required this.bloc});
}
