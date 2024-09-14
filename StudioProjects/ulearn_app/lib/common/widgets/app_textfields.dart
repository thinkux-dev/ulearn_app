import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearn_app/common/widgets/text_widgets.dart';

import 'app_box_decoration.dart';
import 'image_widgets.dart';

Widget appTextField({
  TextEditingController? controller,
  String? text="",
  String iconName = '',
  String hintText = 'Type in your info',
  bool obscureText = false,
  void Function(String value)? func
}){
  return Container(
    padding: EdgeInsets.only(left: 25.w, right: 25.w),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text14Normal(text: text),
        SizedBox(height: 5.h),
        Container(
          width: 325.w,
          height: 50.h,
          // color: Colors.red,
          decoration: appBoxDecorationTextField(),
          //row contains icon and text
          child: Row(
            children: [
              //for showing icons
              Container(
                margin: EdgeInsets.only(left: 17.w),
                child: appImage(imagePath: iconName),
              ),
              //our text field
              appTextFieldOnly(
                controller: controller,
                hintText: hintText,
                func: func,
                obscureText: obscureText,
              ),
            ],
          ),
        )
      ],
    ),
  );
}


Widget appTextFieldOnly({
  TextEditingController? controller,
  String hintText = "Type in your info",
  double width = 250,
  double height = 50,
  void Function(String value)? func,
  bool obscureText = false,
}){
  return SizedBox(
    width: width.w,
    height: height.h,
    child: Center(
      child: TextField(
        controller: controller,
        onChanged: (value)=>func!(value),
        keyboardType: TextInputType.multiline,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.only(top: 7.h, left: 10.w),
          hintText: hintText,
          border: const OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.transparent,
            ),
          ),
          //default border without any input
          enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(
                  color: Colors.transparent
              )
          ),
          //focused border with input
          focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(
                  color: Colors.transparent
              )
          ),
          //disabled border
          disabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(
                  color: Colors.transparent
              )
          ),
        ),

        maxLines: 1,
        autocorrect: false,
        //by default it's false
        obscureText: obscureText,
      ),
    ),
  );
}