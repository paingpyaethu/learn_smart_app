import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learn_smart/common/routes/routes.dart';
import 'package:learn_smart/common/values/colors.dart';
import 'package:learn_smart/global.dart';

Future<void> main() async {
  await Global.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [...AppPages.allBlocProviders(context)],
      child: ScreenUtilInit(
        builder: (context, child) => MaterialApp(
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
          // To make App Bar Background color to white
          theme: ThemeData(
              appBarTheme: const AppBarTheme(
                  iconTheme: IconThemeData(
                    color: AppColors.primaryText,
                  ),
                  elevation: 0,
                  backgroundColor: Colors.white)),
          // To make App Bar Background color to white
          onGenerateRoute: AppPages.GenerateRouteSettings,
        ),
      ),
    );
  }
}
