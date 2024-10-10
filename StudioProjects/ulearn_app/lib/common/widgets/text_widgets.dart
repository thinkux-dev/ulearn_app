import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearn_app/common/utils/app_colors.dart';

Widget text24Normal({
    String text = "",
    Color color = AppColors.primaryText,
    FontWeight fontWeight = FontWeight.normal,
}) {
  return Text(
    text,
    textAlign: TextAlign.center,
    style:
        TextStyle(
          color: color,
          fontSize: 24.sp,
          fontWeight: fontWeight,
        ),
  );
}

class Text16Normal extends StatelessWidget {
  final String? text;
  final Color color;
  final FontWeight fontWeight;
  final TextAlign? textAlign;

  const Text16Normal({
    super.key,
    this.text="",
    this.color=AppColors.primaryThreeElementText,
    this.fontWeight=FontWeight.normal,
    this.textAlign=TextAlign.center
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text!,
      textAlign: TextAlign.center,
      style:
      TextStyle(color: color, fontSize: 16.sp, fontWeight: fontWeight),
    );;
  }
}

class Text13Normal extends StatelessWidget {
  final String? text;
  final Color color;
  final FontWeight fontWeight;
  final TextAlign? textAlign;
  final int? maxLines;

  const Text13Normal({
    super.key,
    this.text="",
    this.color=AppColors.primaryText,
    this.fontWeight=FontWeight.bold,
    this.textAlign=TextAlign.start,
    this.maxLines,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      maxLines: maxLines,
      text!,
      textAlign: textAlign,
      style:
      TextStyle(color: color, fontSize: 13.sp, fontWeight: fontWeight),
    );
  }
}



class Text14Normal extends StatelessWidget {
  final String? text;
  final Color color;
  final TextAlign? textAlign;
  final FontWeight? fontWeight;

  const Text14Normal({
    super.key,
    this.text="",
    this.color=AppColors.primarySecondaryElementText,
    this.textAlign=TextAlign.start,
    this.fontWeight=FontWeight.normal,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text!,
      textAlign: textAlign,
      style:
      TextStyle(color: color, fontSize: 14.sp, fontWeight: fontWeight),
    );
  }
}

class Text11Normal extends StatelessWidget {
  final String? text;
  final Color color;
  final FontWeight fontWeight;

  const Text11Normal({
    super.key,
    this.text="",
    this.color = AppColors.primaryElementText,
    this.fontWeight = FontWeight.normal,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text!,
      textAlign: TextAlign.start,
      style: TextStyle(color: color, fontSize: 11.sp, fontWeight: fontWeight,),
    );
  }
}

class Text10Normal extends StatelessWidget {
  final String? text;
  final Color color;
  final FontWeight fontWeight;
  final TextAlign textAlign;

  const Text10Normal({
    super.key,
    this.text="",
    this.color=AppColors.primaryThreeElementText,
    this.fontWeight = FontWeight.normal,
    this.textAlign = TextAlign.start,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text!,
      overflow: TextOverflow.ellipsis,
      maxLines: 1,
      textAlign: textAlign,
      style:
      TextStyle(color: color, fontSize: 10.sp, fontWeight: fontWeight),
    );
  }
}

class Text9Normal extends StatelessWidget {
  final String? text;
  final Color color;
  final FontWeight fontWeight;
  final TextAlign textAlign;

  const Text9Normal({
    super.key,
    this.text="",
    this.color=AppColors.primaryThreeElementText,
    this.fontWeight = FontWeight.normal,
    this.textAlign = TextAlign.center,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text!,
      textAlign: textAlign,
      style:
      TextStyle(color: color, fontSize: 9.sp, fontWeight: fontWeight),
    );
  }
}


Widget textUnderline({String text = "Your text"}) {
  return GestureDetector(
    onTap: () {},
    child: Text(
      text,
      style: TextStyle(
          fontWeight: FontWeight.normal,
          fontSize: 12.sp,
          color: AppColors.primaryText,
          decoration: TextDecoration.underline,
          decorationColor: AppColors.primaryText),
    ),
  );
}


class FadeText extends StatelessWidget {
  final String? text;
  final Color color;
  final FontWeight fontWeight;
  final double fontSize;

  const FadeText({
    super.key,
    this.text="",
    this.color=AppColors.primaryElementText,
    this.fontWeight = FontWeight.bold,
    this.fontSize = 10,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text!,
      softWrap: false,
      maxLines: 1,
      textAlign: TextAlign.left,
      overflow: TextOverflow.fade,
      style:
      TextStyle(color: color, fontSize: fontSize.sp, fontWeight: fontWeight),
    );
  }
}
