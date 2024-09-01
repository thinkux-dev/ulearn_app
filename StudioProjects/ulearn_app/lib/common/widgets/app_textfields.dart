import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearn_app/common/widgets/text_widgets.dart';

import 'app_box_decoration.dart';
import 'image_widgets.dart';

Widget appTextField({
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
        text14Normal(text: text),
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
              Container(
                width: 250.w,
                height: 50.h,
                child: Center(
                  child: TextField(
                    onChanged: (value)=>func!(value),
                    keyboardType: TextInputType.multiline,
                    decoration: InputDecoration(
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
              )
            ],
          ),
        )
      ],
    ),
  );
}