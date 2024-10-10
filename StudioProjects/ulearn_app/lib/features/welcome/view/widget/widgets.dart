import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ulearn_app/common/utils/app_colors.dart';
import 'package:ulearn_app/common/utils/constants.dart';
import 'package:ulearn_app/common/widgets/app_box_decoration.dart';
import 'package:ulearn_app/global.dart';

import '../../../../common/utils/image_res.dart';
import '../../../../common/widgets/text_widgets.dart';

Widget appOnboardingPage(
  PageController controller, {
  required BuildContext context,
  String imagePath = ImageRes.reading,
  String title = "",
  String subTitle = "",
  index = 0,
}) {
  return Column(
    children: [
      Image.asset(
        imagePath,
        fit: BoxFit.fitWidth,
      ),
      Container(
        margin: EdgeInsets.only(top: 15),
        child: text24Normal(text: title),
      ),
      Container(
        margin: EdgeInsets.only(top: 15),
        padding: EdgeInsets.only(left: 30, right: 30),
        child: Text16Normal(text: subTitle),
      ),
      _nextButton(index, controller, context),
    ],
  );
}

Widget _nextButton(int index, PageController controller, BuildContext context) {
  return GestureDetector(
    onTap: () {

      if (index < 3) {
        controller.animateToPage(
          index,
          duration: Duration(milliseconds: 300),
          curve: Curves.linear,
        );
      } else {
        //remember if it is our first time opening the welcome page or not
        Global.storageService.setBool(AppConstants.STORAGE_DEVICE_OPEN_FIRST_KEY, true);
        
        Navigator.pushNamed(
            context,
            "/sign_in",
        );
      }
    },
    child: Container(
      width: 325,
      height: 50,
      margin: const EdgeInsets.only(top: 100, left: 25, right: 25),
      decoration: appBoxShadow(),
      child: Center(
        child: Text16Normal(text: index<3 ? "Next":"Get started", color: Colors.white),
      ),
    ),
  );
}
