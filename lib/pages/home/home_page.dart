import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learn_smart/common/values/colors.dart';
import 'package:learn_smart/pages/home/bloc/home_page_blocs.dart';
import 'package:learn_smart/pages/home/bloc/home_page_states.dart';
import 'package:learn_smart/pages/home/widgets/home_page_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: buildHomePageAppBar(),
        body: BlocBuilder<HomePageBlocs, HomePageStates>(
            builder: (context, state) {
          return Container(
            margin: EdgeInsets.symmetric(vertical: 0, horizontal: 25.w),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              homePageText('Hello,', color: AppColors.primaryThreeElementText),
              homePageText('Paing Pyae Thu', top: 8),
              SizedBox(height: 20.h),
              searchView(),
              slidersView(context, state),
            ]),
          );
        }));
  }
}
