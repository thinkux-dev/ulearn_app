import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearn_app/common/utils/app_colors.dart';
import 'package:ulearn_app/common/widgets/app_box_decoration.dart';
import 'package:ulearn_app/common/widgets/image_widgets.dart';
import 'package:ulearn_app/common/widgets/text_widgets.dart';

Widget thirdPartyLogin(){
  return Container(
    margin: EdgeInsets.only(left: 80.w, right: 80.w, top: 40.h),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _loginButton(imagePath: "assets/icons/google.png"),
        _loginButton(imagePath: "assets/icons/apple.png"),
        _loginButton(imagePath: "assets/icons/facebook.png"),
      ],
    ),
  );
}

Widget _loginButton({String imagePath= "assets/icons/google.png"}){
  return GestureDetector(
    onTap: (){},
    child: SizedBox(
      width: 40.w,
      height: 40.h,
      child: Image.asset(
        imagePath
      ),
    ),
  );
}