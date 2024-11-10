import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearn_app/common/widgets/text_widgets.dart';

import 'app_box_decoration.dart';
import 'image_widgets.dart';

class AppTextField extends StatelessWidget {
  final TextEditingController? controller;
  final String text;
  final String iconName;
  final String hintText;
  final bool obscureText;
  final void Function(String value)? func;

  const AppTextField({
    super.key,
    this.controller,
    this.text = '',
    this.hintText = 'Type in your info',
    this.iconName = '',
    this.obscureText = false,
    this.func,
  });

  @override
  Widget build(BuildContext context) {
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
                  child: AppImage(imagePath: iconName),
                ),
                //our text field
                AppTextFieldOnly(
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
}

class AppTextFieldOnly extends StatelessWidget {
  final TextEditingController? controller;
  final double width;
  final double height;
  final String hintText;
  final bool obscureText;
  final void Function(String value)? func;
  final bool? search;

  const AppTextFieldOnly({
    super.key,
    this.controller,
    this.width = 250,
    this.height = 250,
    this.hintText = "Type in your info",
    this.obscureText = false,
    this.func,
    this.search = false,
  });


  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width.w,
      height: height.h,
      child: Center(
        child: TextField(
          controller: controller,
          onChanged: search ==false?(value)=>func!(value):null,
          onSubmitted: search==true?(value)=>func!(value):null,
          textInputAction: TextInputAction.search,
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
}
