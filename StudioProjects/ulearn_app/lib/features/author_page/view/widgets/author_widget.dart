import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearn_app/common/models/course_entities.dart';
import 'package:ulearn_app/common/utils/app_colors.dart';
import 'package:ulearn_app/common/utils/constants.dart';
import 'package:ulearn_app/common/utils/image_res.dart';

import 'package:ulearn_app/common/widgets/app_box_decoration.dart';
import 'package:ulearn_app/common/widgets/image_widgets.dart';
import 'package:ulearn_app/common/widgets/text_widgets.dart';

class AuthorMenu extends StatelessWidget {
  final AuthorItem authorInfo;

  const AuthorMenu({super.key, required this.authorInfo});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 325.w,
      height: 220.h,
      child: Stack(
        children: [
          Container(
            width: 325.w,
            height: 160.h,
            decoration:  BoxDecoration(
                borderRadius: BorderRadius.circular(20.h),
                image: const DecorationImage(
                    fit: BoxFit.fitWidth,
                    image: AssetImage(
                      ImageRes.background,
                    )
                )
            ),
          ),
          Positioned(
              bottom: 0,
              left: 0,
              child: Container(
                width: 325.w,
                margin: EdgeInsets.only(left: 20.h),
                child: Row(
                  children: [
                    Container(
                      width: 80.w,
                      height: 80.h,
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(20.w),
                        image:
                        DecorationImage(
                          image: NetworkImage(
                            '${AppConstants.IMAGE_UPLOADS_PATH}${authorInfo.avatar}'
                          ),
                        ),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                            margin: EdgeInsets.only(left: 6.w),
                            child: Text13Normal(
                              text: authorInfo.name,
                            ),
                        ),
                        Container(
                            margin: EdgeInsets.only(left: 6.w),
                            child: Text9Normal(
                              text: authorInfo.job??"A freelancer",
                            ),
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            AuthorTextAndIcon(
                                text: "10", icon: ImageRes.people, first: true),
                            AuthorTextAndIcon(
                                text: "90", icon: ImageRes.star, first: false),
                            AuthorTextAndIcon(
                                text: "12", icon: ImageRes.downloadDetail, first: false)
                          ],
                        )
                      ],
                    )
                  ],
                ),
              ))
        ],
      ),
    );
  }
}

class AuthorTextAndIcon extends StatelessWidget {
  const AuthorTextAndIcon(
      {super.key, required this.text, required this.icon, required this.first});

  final String text;
  final String icon;
  final bool first;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: first == true ? 3.w : 20.w),
      child: Row(
        children: [
          AppImage(imagePath: icon),
          Text11Normal(
            text: text,
            color: AppColors.primaryThreeElementText,
          )
        ],
      ),
    );
  }
}

class AuthorDescription extends StatelessWidget {
  final AuthorItem authorInfo;
  const AuthorDescription({super.key, required this.authorInfo});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 325.w,
      margin: EdgeInsets.only(top: 10.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text16Normal(
            text: "About me",
            color: AppColors.primaryText,
            fontWeight: FontWeight.bold,
          ),
          Container(
            margin: EdgeInsets.only(top:8.h),
            child: Text11Normal(
              text: authorInfo.description??'I am a course creator. I love Flutter',
              color: AppColors.primaryThreeElementText,
            ),
          )
        ],
      ),
    );
  }
}

class AuthorCourses extends StatelessWidget {
  final List<CourseItem> authorCourses;

  const AuthorCourses({super.key, required this.authorCourses});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          authorCourses.isNotEmpty?const Text14Normal(
            text: 'Lesson list',
            color: AppColors.primaryText,
            fontWeight: FontWeight.bold,
          ):const Text14Normal(
            text: 'Lesson list is empty',
            color: AppColors.primaryText,
            fontWeight: FontWeight.bold,
          ),
          SizedBox(height: 20.h),
          ListView.builder(
            shrinkWrap: true,
            itemCount: authorCourses.length,
            itemBuilder: (_, index) {
              return Container(
                margin: EdgeInsets.only(bottom: 10.h),
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                width: 325.w,
                height: 80.h,
                decoration: appBoxShadow(
                    radius: 10,
                    sR: 2,
                    bR: 3,
                    color: const Color.fromRGBO(255, 255, 255, 1)
                ),
                child: InkWell(
                  onTap: (){
                    Navigator.of(context).pushNamed('/course_detail', arguments: {
                      'id': authorCourses[index].id!
                    });
                  },
                  child: Row(
                    // crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      AppBoxDecorationImage(
                        width: 60.w,
                        height: 60.w,
                        // imagePath: "${AppConstants.IMAGE_UPLOADS_PATH}${authorCourses[index].thumbnail}",
                        imagePath: '${AppConstants.IMAGE_UPLOADS_PATH}${authorCourses[index].thumbnail!}',
                        fit: BoxFit.fill,
                      ),
                      SizedBox(width: 8.w),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text13Normal(text: authorCourses[index].name),
                            Text10Normal(text: "There are ${authorCourses[index].lesson_num.toString()} lessons"),
                          ],
                        ),
                      ),
                      // Expanded(child: Container()),
                    ],
                  ),
                ),
              );
            },
          )
        ],
      ),
    );
  }
}