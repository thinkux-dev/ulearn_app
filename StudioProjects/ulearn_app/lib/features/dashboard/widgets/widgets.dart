import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearn_app/common/utils/app_colors.dart';
import 'package:ulearn_app/common/utils/image_res.dart';
import 'package:ulearn_app/common/widgets/image_widgets.dart';
import 'package:ulearn_app/features/home/view/home.dart';

var bottomTabs = <BottomNavigationBarItem>[
  BottomNavigationBarItem(
    icon: _bottomContainer(),
    activeIcon: _bottomContainer(
      color: AppColors.primaryElement,
    ),
    backgroundColor: AppColors.primaryBackground,
    label: "Home",
  ),

  BottomNavigationBarItem(
    icon: _bottomContainer(
      imagePath: ImageRes.search
    ),
    activeIcon: _bottomContainer(
      color: AppColors.primaryElement,
      imagePath: ImageRes.search,
    ),
    backgroundColor: AppColors.primaryBackground,
    label: "Search",
  ),

  BottomNavigationBarItem(
    icon: _bottomContainer(
        imagePath: ImageRes.play
    ),
    activeIcon: _bottomContainer(
      color: AppColors.primaryElement,
      imagePath: ImageRes.play,
    ),
    backgroundColor: AppColors.primaryBackground,
    label: "Play",
  ),

  BottomNavigationBarItem(
    icon: _bottomContainer(
        imagePath: ImageRes.message
    ),
    activeIcon: _bottomContainer(
      color: AppColors.primaryElement,
      imagePath: ImageRes.message,
    ),
    backgroundColor: AppColors.primaryBackground,
    label: "Message",
  ),

  BottomNavigationBarItem(
    icon: _bottomContainer(
        imagePath: ImageRes.profile
    ),
    activeIcon: _bottomContainer(
      color: AppColors.primaryElement,
      imagePath: ImageRes.profile,
    ),
    backgroundColor: AppColors.primaryBackground,
    label: "Profile",
  ),

];

Widget _bottomContainer({
  double width = 15,
  double height = 15,
  String imagePath = ImageRes.home,
  Color color = AppColors.primaryFourElementText,
}) {
  return SizedBox(
    width: width.w,
    height: height.w,
    child: appImageWithColor(imagePath: imagePath, color: color),
  );
}

Widget appScreens({int index=0}){
  List<Widget> _screens = [
    const Home(),
    Center(child: appImage(imagePath: ImageRes.search, width: 250, height: 250,),),
    Center(child: appImage(imagePath: ImageRes.play, width: 250, height: 250,),),
    Center(child: appImage(imagePath: ImageRes.message, width: 250, height: 250,),),
    Center(child: appImage(imagePath: ImageRes.profile, width: 250, height: 250,),),
  ];
  return _screens[index];
}