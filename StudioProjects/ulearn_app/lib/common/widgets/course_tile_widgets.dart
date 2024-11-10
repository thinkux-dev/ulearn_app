import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearn_app/common/models/course_entities.dart';
import 'package:ulearn_app/common/routes/app_routes_names.dart';
import 'package:ulearn_app/common/utils/app_colors.dart';

import 'package:ulearn_app/common/utils/constants.dart';
import 'package:ulearn_app/common/widgets/text_widgets.dart';

class CourseTileWidgets extends StatelessWidget {
  final List<CourseItem> value;

  const CourseTileWidgets({
    super.key,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        for(final val in value)
          Container(
            width: 325.w,
            height: 80.h,
            margin: EdgeInsets.only(bottom: 15.h),
            padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.w),
              color: Color.fromRGBO(255, 255, 255, 1),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.1),
                  spreadRadius: 2,
                  blurRadius: 3,
                  offset: Offset(0, 1),
                )
              ],
            ),
            child: InkWell(
              onTap: () => Navigator.of(context).pushNamed(
                AppRoutesNames.COURSE_DETAIL,
                arguments: {"id": val.id},
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        height: 60.h,
                        width: 60.w,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.w),
                          image: DecorationImage(
                            fit: BoxFit.fitHeight,
                            image: NetworkImage(
                                "${AppConstants.IMAGE_UPLOADS_PATH}${val.thumbnail}"),
                          ),
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: EdgeInsets.only(left: 6.w),
                            width: 180.w,
                            child: Text13Normal(
                              text: val.name.toString(),
                              color: AppColors.primaryText,
                              fontWeight: FontWeight.bold,
                              maxLines: 1,
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 6.w),
                            width: 180.w,
                            child: Text10Normal(
                              text: "${val.lesson_num} Lesson",
                              color: AppColors.primaryThreeElementText,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Container(
                    alignment: Alignment.center,
                    width: 55.w,
                    child: Text13Normal(
                      text: "\$${val.price}",
                    ),
                  )
                ],
              ),
            ),
          )
      ],
    );
  }
}

/*
  Container(
          width: 325.w,
          height: 80.h,
          margin: EdgeInsets.only(bottom: 15.h),
          padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.w),
            color: Color.fromRGBO(255, 255, 255, 1),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.1),
                spreadRadius: 2,
                blurRadius: 3,
                offset: Offset(0, 1),
              )
            ],
          ),
          child: InkWell(
            onTap: () => Navigator.of(context).pushNamed(
              AppRoutesNames.COURSE_DETAIL,
              arguments: {"id": value.elementAt(index).id},
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      height: 60.h,
                      width: 60.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.w),
                        image: DecorationImage(
                          fit: BoxFit.fitHeight,
                          image: NetworkImage(
                              "${AppConstants.IMAGE_UPLOADS_PATH}${value.elementAt(index).thumbnail}"),
                        ),
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.only(left: 6.w),
                          width: 180.w,
                          child: Text13Normal(
                            text: value.elementAt(index).name.toString(),
                            color: AppColors.primaryText,
                            fontWeight: FontWeight.bold,
                            maxLines: 1,
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 6.w),
                          width: 180.w,
                          child: Text10Normal(
                            text: "${value.elementAt(index).lesson_num} Lesson",
                            color: AppColors.primaryThreeElementText,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Container(
                  alignment: Alignment.center,
                  width: 55.w,
                  child: Text13Normal(
                    text: "\$${value.elementAt(index).price}",
                  ),
                )
              ],
            ),
          ),
        )
 */