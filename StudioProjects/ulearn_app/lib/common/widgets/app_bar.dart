import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearn_app/common/widgets/text_widgets.dart';

import '../utils/app_colors.dart';

/*
  preferredSize widget gives you a height from the appbar downwards and we can
  put child in the given space
*/

AppBar buildAppbar({String title='Login'}){
  return AppBar(
    centerTitle: true,
    // backgroundColor: Colors.white,
    bottom: PreferredSize(
      preferredSize: const Size.fromHeight(2),
      child: Container(
        padding: EdgeInsets.only(top: 20.h),
        color: Colors.grey.withOpacity(0.3),
        height: 1,
      ),
    ),
    title: Text16Normal(text: title, color: AppColors.primaryText),
  );
}


AppBar buildGlobalAppbar({String title='Login'}){
  return AppBar(
    centerTitle: true,

    title: Text16Normal(text: title, color: AppColors.primaryText),
  );
}