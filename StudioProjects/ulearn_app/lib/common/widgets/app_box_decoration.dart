import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearn_app/common/models/course_entities.dart';
import 'package:ulearn_app/common/utils/app_colors.dart';
import 'package:ulearn_app/common/widgets/text_widgets.dart';

import '../utils/image_res.dart';

BoxDecoration appBoxShadow({
  Color color = AppColors.primaryElement,
  double radius = 15,
  double sR = 1,
  double bR = 2,
  BoxBorder? boxBorder,
  BorderRadius? borderRadius,

}) {
  return BoxDecoration(
      color: color,
      borderRadius: BorderRadius.circular(radius),
      border: boxBorder,
      boxShadow: [
        BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: sR,
            blurRadius: bR,
            offset: const Offset(0, 1),
        )
      ]);
}


BoxDecoration appBoxShadowWithRadius({
  Color color = AppColors.primaryElement,
  double radius = 15,
  double sR = 1,
  double bR = 2,
  BoxBorder? border
}) {
  return BoxDecoration(
      color: color,
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(20.h),
        topRight: Radius.circular(20.h),
      ),
      border: border,
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.1),
          spreadRadius: sR,
          blurRadius: bR,
          offset: const Offset(0, 1),
        )
      ]);
}


BoxDecoration appBoxDecorationTextField({
  Color color = AppColors.primaryBackground,
  double radius = 15,
  Color borderColor = AppColors.primaryFourElementText,
}) {
  return BoxDecoration(
    color: color,
    borderRadius: BorderRadius.circular(radius),
    border: Border.all(color: borderColor)
  );
}



class AppBoxDecorationProfileImage extends StatelessWidget {
  final double width;
  final double height;
  final String imagePath;
  final BoxFit fit;
  final CourseItem? courseItem;

  const AppBoxDecorationProfileImage({
    super.key,
    this.width = 40,
    this.height = 40,
    this.imagePath = ImageRes.profile,
    this.fit = BoxFit.fitHeight,
    this.courseItem,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width.w,
      height: height.h,
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.fitHeight,
          image: NetworkImage(imagePath),
        ),
        borderRadius: BorderRadius.circular(20.w),
      ),
      child: courseItem==null ? Container() : Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(left: 20.w),
            child: FadeText(
              text: courseItem!.name,
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 20.w, bottom: 30.h),
            child: FadeText(
              text: '${courseItem!.lesson_num} Lessons',
              color: AppColors.primaryFourElementText,
              fontSize: 8,
            ),
          )
        ],
      ),
    );
  }
}

class AppBoxDecorationImage extends StatelessWidget {
  final double width;
  final double height;
  final String imagePath;
  final BoxFit fit;
  final CourseItem? courseItem;
  final Function()? func;

  const AppBoxDecorationImage({
    Key? key,
    this.width = 40,
    this.height = 40,
    this.imagePath = ImageRes.profile,
    this.fit = BoxFit.fitHeight,
    this.courseItem,
    this.func,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: func,
      child: Container(
        width: width,
        height: height,
        child: Stack(
          fit: StackFit.expand,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20.w),
              child: CachedNetworkImage(
                imageUrl: imagePath,
                fit: fit,
              ),
            ),
            if (courseItem != null)
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  padding: EdgeInsets.only(left: 20.w, right: 20.w, bottom: 20.h, top: 10.h),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      colors: [
                        Colors.black.withOpacity(0.5),
                        Colors.transparent,
                      ],
                    ),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20.w),
                      bottomRight: Radius.circular(20.w),
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      FadeText(
                        text: courseItem!.name ?? '',
                      ),
                      SizedBox(height: 2.h),
                      FadeText(
                        text: '${courseItem!.lesson_num} Lessons',
                        color: AppColors.primaryFourElementText,
                        fontSize: 8.sp,
                      ),
                    ],
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
