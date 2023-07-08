import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learn_smart/common/values/colors.dart';
import 'package:learn_smart/pages/application/widgets/application_widgets.dart';

class ApplicationPage extends StatefulWidget {
  const ApplicationPage({super.key});

  @override
  State<ApplicationPage> createState() => _ApplicationPageState();
}

class _ApplicationPageState extends State<ApplicationPage> {
  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
          child: Scaffold(
              body: buildPage(_selectedIndex),
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
                  items: [
                    BottomNavigationBarItem(
                      label: 'home',
                      icon: SizedBox(
                        width: 15.w,
                        height: 15.h,
                        child: Image.asset('assets/icons/home.png'),
                      ),
                      activeIcon: SizedBox(
                        width: 15.w,
                        height: 15.h,
                        child: Image.asset(
                          'assets/icons/home.png',
                          color: AppColors.primaryElement,
                        ),
                      ),
                    ),
                    BottomNavigationBarItem(
                      label: 'search',
                      icon: SizedBox(
                        width: 15.w,
                        height: 15.h,
                        child: Image.asset('assets/icons/search2.png'),
                      ),
                      activeIcon: SizedBox(
                        width: 15.w,
                        height: 15.h,
                        child: Image.asset(
                          'assets/icons/search2.png',
                          color: AppColors.primaryElement,
                        ),
                      ),
                    ),
                    BottomNavigationBarItem(
                      label: 'course',
                      icon: SizedBox(
                        width: 15.w,
                        height: 15.h,
                        child: Image.asset('assets/icons/course.png'),
                      ),
                      activeIcon: SizedBox(
                        width: 15.w,
                        height: 15.h,
                        child: Image.asset(
                          'assets/icons/course.png',
                          color: AppColors.primaryElement,
                        ),
                      ),
                    ),
                    BottomNavigationBarItem(
                      label: 'chat',
                      icon: SizedBox(
                        width: 15.w,
                        height: 15.h,
                        child: Image.asset('assets/icons/chat.png'),
                      ),
                      activeIcon: SizedBox(
                        width: 15.w,
                        height: 15.h,
                        child: Image.asset(
                          'assets/icons/chat.png',
                          color: AppColors.primaryElement,
                        ),
                      ),
                    ),
                    BottomNavigationBarItem(
                      label: 'profile',
                      icon: SizedBox(
                        width: 15.w,
                        height: 15.h,
                        child: Image.asset('assets/icons/profile.png'),
                      ),
                      activeIcon: SizedBox(
                        width: 15.w,
                        height: 15.h,
                        child: Image.asset(
                          'assets/icons/profile.png',
                          color: AppColors.primaryElement,
                        ),
                      ),
                    )
                  ],
                  currentIndex: _selectedIndex,
                  onTap: _onItemTapped,
                ),
              ))),
    );
  }
}
