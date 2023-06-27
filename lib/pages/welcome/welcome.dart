import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learn_smart/main.dart';
import 'package:learn_smart/pages/welcome/bloc/welcome_blocs.dart';
import 'package:learn_smart/pages/welcome/bloc/welcome_events.dart';
import 'package:learn_smart/pages/welcome/bloc/welcome_states.dart';

class Welcome extends StatefulWidget {
  const Welcome({super.key});

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  final PageController pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    // print(MediaQuery.of(context).size.width.toString());
    return Container(
      color: Colors.white,
      child: Scaffold(body: BlocBuilder<WelcomeBloc, WelcomeState>(
        builder: (context, state) {
          return Container(
            margin: EdgeInsets.only(top: 50.h),
            width: 375.w,
            child: Stack(
              alignment: Alignment.topCenter,
              children: [
                PageView(
                  controller: pageController,
                  onPageChanged: (index) {
                    state.page = index;
                    BlocProvider.of<WelcomeBloc>(context).add(WelcomeEvent());
                  },
                  children: [
                    _page(
                        1,
                        context,
                        "Next",
                        "Learn Anytime",
                        "Boost your knowledge with bite-sized lessons and interactive quizzes. Master new skills on the go!",
                        "assets/images/on_boarding-1.png",
                        pageController),
                    _page(
                        2,
                        context,
                        "Next",
                        "Smart Learning",
                        "Discover personalized courses and track your progress. Engage in interactive exercises for effective learning.",
                        "assets/images/on_boarding-2.png",
                        pageController),
                    _page(
                        3,
                        context,
                        "Get Started",
                        "Knowledge Hub",
                        "Unlock a world of learning resources. Explore diverse topics and gain expertise through engaging lessons and challenges.",
                        "assets/images/on_boarding-3.png",
                        pageController),
                  ],
                ),
                Positioned(
                  bottom: 120.h,
                  child: DotsIndicator(
                    position: state.page,
                    dotsCount: 3,
                    decorator: DotsDecorator(
                      color: Colors.black54,
                      activeColor: Colors.indigoAccent,
                      size: const Size.square(8.0),
                      activeSize: const Size(18.0, 8.0),
                      activeShape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0)),
                    ),
                  ),
                )
              ],
            ),
          );
        },
      )),
    );
  }
}

Widget _page(int index, BuildContext context, String buttonName, String title,
    String description, String imagePath, PageController pageController) {
  return Column(
    children: [
      SizedBox(
        width: 345.w,
        height: 345.h,
        child: Image.asset(
          imagePath,
          fit: BoxFit.contain,
        ),
      ),
      Container(
        width: 375.w,
        padding: EdgeInsets.symmetric(horizontal: 30.w),
        margin: EdgeInsets.only(bottom: 10.w, top: 10.w),
        alignment: Alignment.center,
        child: Text(
          title,
          style: TextStyle(
            color: Colors.black,
            fontSize: 20.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      Container(
        // color: Colors.red,
        width: 375.w,
        padding: EdgeInsets.symmetric(horizontal: 30.w),
        child: Text(
          description,
          style: TextStyle(
            // backgroundColor: Colors.blue,
            color: Colors.black.withOpacity(0.5),
            fontSize: 14.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      GestureDetector(
        onTap: () {
          //within 0-2 index
          if (index < 3) {
            //animation
            pageController.animateToPage(index,
                duration: const Duration(milliseconds: 500),
                curve: Curves.ease);
          } else {
            //jump to new page
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const MyHomePage()));
          }
        },
        child: Container(
          margin: EdgeInsets.only(top: 100.h, left: 25.w, right: 25.w),
          width: 325.w,
          height: 50.h,
          decoration: BoxDecoration(
              color: Colors.indigoAccent,
              borderRadius: BorderRadius.all(Radius.circular(15.w)),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 1,
                  blurRadius: 2,
                  offset: const Offset(0, 2),
                )
              ]),
          child: Center(
            child: Text(
              buttonName,
              style: TextStyle(
                // backgroundColor: Colors.blue,
                color: Colors.white,
                fontSize: 16.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ),
    ],
  );
}
