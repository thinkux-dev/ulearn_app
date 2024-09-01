import 'package:flutter/material.dart';
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
      preferredSize: const Size.fromHeight(1),
      child: Container(
        color: Colors.grey.withOpacity(0.3),
        height: 1,
      ),
    ),
    title: text16Normal(text: title, color: AppColors.primaryText),
  );
}