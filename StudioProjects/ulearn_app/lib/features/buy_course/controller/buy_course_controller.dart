import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:ulearn_app/common/models/course_entities.dart';
import 'package:ulearn_app/common/models/lesson_entities.dart';
import 'package:ulearn_app/features/buy_course/repo/buy_course_repo.dart';
import 'package:ulearn_app/features/course_detail/repo/course_repo.dart';
part 'buy_course_controller.g.dart';

@riverpod
Future<String?>buyCourseController(BuyCourseControllerRef ref, {required int index}) async {

  CourseRequestEntity courseRequestEntity = CourseRequestEntity();
  courseRequestEntity.id = index;
  final response = await BuyCourseRepo.buyCourse(params: courseRequestEntity);
  if(response.code==200){
    return response.data;
  } else {
    print('request failed due to ${response.msg}');
    print('request failed due to ${response.code}');
  }
  return null;
}
