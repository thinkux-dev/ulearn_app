import 'package:ulearn_app/common/models/course_entities.dart';
import 'package:ulearn_app/common/services/http_util.dart';

class CoursesSearchRepos{
  static Future<CourseListResponseEntity> coursesRecommended() async {
    var response = await HttpUtil().post(
      // "api/courseList",
      "api/coursesRecommended",
    );
    return CourseListResponseEntity.fromJson(response);
  }

  static Future<CourseListResponseEntity> coursesSearch({SearchRequestEntity? params}) async {
    var response = await HttpUtil().post(
      "api/coursesSearch",
      queryParameters: params?.toJson()
    );
    return CourseListResponseEntity.fromJson(response);
  }
}