import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearn_app/common/models/course_entities.dart';
import 'package:ulearn_app/common/utils/constants.dart';
import 'package:ulearn_app/common/widgets/app_box_decoration.dart';

class CourseDetailThumbnail extends StatelessWidget {
  final CourseItem courseItem;
  const CourseDetailThumbnail({
    super.key,
    required this.courseItem
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 0.h),
      child: AppBoxDecorationImage(
        imagePath: "${AppConstants.IMAGE_UPLOADS_PATH}${courseItem.thumbnail}",
        width: 325.w,
        height: 200.h,
        fit: BoxFit.fitWidth,
      ),
    );
  }
}
