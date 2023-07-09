import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_smart/common/routes/routes.dart';
import 'package:learn_smart/global.dart';
import 'package:learn_smart/pages/application/application_page.dart';
import 'package:learn_smart/pages/application/bloc/app_blocs.dart';
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
          route: AppRoutes.INITIAL,
          page: Welcome(),
          bloc: BlocProvider(create: (_) => WelcomeBloc())),
      PageEntity(
          route: AppRoutes.LOGIN,
          page: SignIn(),
          bloc: BlocProvider(create: (_) => SignInBloc())),
      PageEntity(
          route: AppRoutes.REGISTER,
          page: Register(),
          bloc: BlocProvider(create: (_) => RegisterBloc())),
      PageEntity(
          route: AppRoutes.APPLICATION,
          page: ApplicationPage(),
          bloc: BlocProvider(create: (_) => AppBlocs())),
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
      var result = routes().where((element) => element.route == settings.name);
      if (result.isNotEmpty) {
        bool deviceFirstOpen = Global.storageService.getDeviceFirstOpen();
        if (result.first.route == AppRoutes.INITIAL && deviceFirstOpen) {
          bool isLoggedIn = Global.storageService.getIsLoggedIn();
          if (isLoggedIn) {
            return MaterialPageRoute(
                builder: (_) => ApplicationPage(), settings: settings);
          }
          return MaterialPageRoute(
              builder: (_) => SignIn(), settings: settings);
        }
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
  String route;
  Widget page;
  dynamic bloc;

  PageEntity({required this.route, required this.page, required this.bloc});
}
