import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearn_app/common/utils/app_colors.dart';
import 'package:ulearn_app/common/widgets/app_bar.dart';
import 'package:ulearn_app/common/widgets/app_box_decoration.dart';
import 'package:ulearn_app/features/dashboard/widgets/widgets.dart';
import 'notifier/dashboard_nav_notifier.dart';

class Dashboard extends ConsumerWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    int index = ref.watch(dashboardNavIndexProvider);
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          body: appScreens(index: index),
          bottomNavigationBar: Container(
            width: 375.w,
            height: 58.h,
            decoration: appBoxShadowWithRadius(),
            child: BottomNavigationBar(
              currentIndex: index,
              onTap: (value){
                ref.read(dashboardNavIndexProvider.notifier).changeIndex(value);
              },
              elevation: 0,
              items: bottomTabs,
              type: BottomNavigationBarType.fixed,
              showSelectedLabels: false, // This remove the label of selected tap
              showUnselectedLabels: false, // This remove the label of unselected tap
              selectedItemColor: AppColors.primaryElement,
              unselectedItemColor: AppColors.primaryFourElementText,
            ),
          ),
        ),
      ),
    );
  }
}

