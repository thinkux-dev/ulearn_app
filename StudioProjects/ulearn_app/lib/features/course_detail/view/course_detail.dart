import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearn_app/common/utils/constants.dart';
import 'package:ulearn_app/common/widgets/app_bar.dart';
import 'package:ulearn_app/common/widgets/app_box_decoration.dart';
import 'package:ulearn_app/features/course_detail/controller/course_detail_controller.dart';
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
    var stateData = ref.watch(courseDetailControllerProvider(index: args.toInt()));
    return Scaffold(
      appBar: buildGlobalAppbar(title: "Course detail"),
      body: stateData.when(
        data: (data){
          return data==null ? const SizedBox() : Column(
            children: [
              CourseDetailThumbnail(courseItem: data),
            ],
          );
        },
        error: (error, traceStack)=>const Text('Error loading the data'),
        loading: ()=>const Center(child: CircularProgressIndicator()),
      ),
    );
  }
}
