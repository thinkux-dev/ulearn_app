import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearn_app/common/utils/app_colors.dart';
import 'package:ulearn_app/common/utils/constants.dart';
import 'package:ulearn_app/common/utils/image_res.dart';
import 'package:ulearn_app/common/widgets/app_bar.dart';
import 'package:ulearn_app/common/widgets/app_box_decoration.dart';
import 'package:ulearn_app/common/widgets/image_widgets.dart';
import 'package:ulearn_app/common/widgets/text_widgets.dart';
import 'package:ulearn_app/features/course_detail/controller/course_controller.dart';
import 'package:ulearn_app/features/course_detail/view/widget/course_detail_widget.dart';

class CourseDetail extends ConsumerStatefulWidget {
  const CourseDetail({super.key});

  @override
  ConsumerState<CourseDetail> createState() => _CourseDetailState();
}

class _CourseDetailState extends ConsumerState<CourseDetail> {
  late var args;

  @override
  void didChangeDependencies() {
    var id = ModalRoute.of(context)!.settings.arguments as Map;
    // print(args['id']);
    args = id['id'];
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    var courseData =
        ref.watch(courseDetailControllerProvider(index: args.toInt()));

    var lessonData =
        ref.watch(courseLessonListControllerProvider(index: args.toInt()));

    return Scaffold(
        appBar: buildGlobalAppbar(title: "Course detail"),
        body: Padding(
          padding: EdgeInsets.only(left: 25.w, right: 25.w),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                courseData.when(
                  data: (data) => data == null
                      ? const SizedBox()
                      : Column(
                          children: [
                            CourseDetailThumbnail(courseItem: data),
                            CourseDetailIconText(courseItem: data),
                            CourseDetailDescription(courseItem: data),
                            CourseDetailGoBuyButton(courseItem: data),
                            CourseDetailIncludes(courseItem: data),
                          ],
                        ),
                  error: (error, traceStack) =>
                      const Text('Error loading the course data'),
                  loading: () => SizedBox(
                      height: 500.h,
                      child: const Center(child: CircularProgressIndicator())),
                ),
                lessonData.when(
                  data: (data) => data == null
                      ? const SizedBox()
                      : LessonInfo(lessonData:data, ref:ref),
                  error: (error, traceStack) =>
                      const Text('Error loading the lesson data'),
                  loading: () => SizedBox(
                      height: 500.h,
                      child: const Center(child: CircularProgressIndicator())),
                )
              ],
            ),
          ),
        ));
  }
}
