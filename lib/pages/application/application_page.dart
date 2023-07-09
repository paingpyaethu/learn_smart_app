import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learn_smart/pages/application/bloc/app_blocs.dart';
import 'package:learn_smart/pages/application/bloc/app_events.dart';
import 'package:learn_smart/pages/application/bloc/app_states.dart';
import 'package:learn_smart/pages/application/widgets/application_widgets.dart';

class ApplicationPage extends StatefulWidget {
  const ApplicationPage({super.key});

  @override
  State<ApplicationPage> createState() => _ApplicationPageState();
}

class _ApplicationPageState extends State<ApplicationPage> {
  void _onItemTapped(int index) {
    context.read<AppBlocs>().add(TriggerAppEvent(index));
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppBlocs, AppState>(builder: (context, state) {
      return Container(
        color: Colors.white,
        child: SafeArea(
            child: Scaffold(
                body: buildPage(state.index),
                bottomNavigationBar: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20.h),
                          topRight: Radius.circular(20.h)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.1),
                          spreadRadius: 1,
                          blurRadius: 1,
                        )
                      ]),
                  child: BottomNavigationBar(
                    elevation: 0,
                    type: BottomNavigationBarType.fixed,
                    showSelectedLabels: false,
                    showUnselectedLabels: false,
                    items: bottomTabs,
                    currentIndex: state.index,
                    onTap: _onItemTapped,
                  ),
                ))),
      );
    });
  }
}
