import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearn_app/common/widgets/text_widgets.dart';
import 'package:ulearn_app/pages/welcome/widgets.dart';

import '../../common/utils/app_colors.dart';
import 'notifier/welcome_notifier.dart';

// final indexProvider = StateProvider<int>((ref)=>0);

class Welcome extends ConsumerWidget {
  Welcome({super.key});

  final PageController _controller = PageController();
  // int dotsIndex = 0;

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    // print('my dots value is $dotsIndex');
    final index = ref.watch(indexDotProviderProvider);

    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          body: Container(
            margin: EdgeInsets.only(top: 30.h),
            child: Stack(
              alignment: Alignment.topCenter,
              children: [
                //showing our three welcome pages
                PageView(
                  onPageChanged: (value){
                    // dotsIndex = value;
                    ref.read(indexDotProviderProvider.notifier).changeIndex(value);
                  },
                  controller: _controller,
                  scrollDirection: Axis.horizontal,
                  children: [
                    // First Page
                    appOnboardingPage(
                      _controller,
                      imagePath: "assets/images/reading.png",
                      title: "First See Learning",
                      subTitle: "Forget about the paper, now learning all in one place",
                      index: 1,
                      context
                    ),
                    // Second Page
                    appOnboardingPage(
                      _controller,
                      imagePath: "assets/images/man.png",
                      title: "Connect With Everyone",
                      subTitle: "Always keep in touch with your tutor and friends. let's get connected",
                      index: 2,
                      context
                    ),
                    // Third Page
                    appOnboardingPage(
                      _controller,
                      imagePath: "assets/images/boy.png",
                      title: "Always Fascinated Learning",
                      subTitle: "Anywhere, anytime. The time is at your discretion. So study wherever you can",
                      index: 3,
                      context
                    ),
                  ],
                ),
                //for showing dots
                Positioned(
                  bottom: 50,
                  child: DotsIndicator(
                    position: index,
                    dotsCount: 3,
                    mainAxisAlignment: MainAxisAlignment.center,
                    decorator: DotsDecorator(
                      size: Size.square(9.0),
                      activeSize: Size(24.0, 8.0),
                      activeShape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.w),
                      ),
                      activeColor: AppColors.primaryElement
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
