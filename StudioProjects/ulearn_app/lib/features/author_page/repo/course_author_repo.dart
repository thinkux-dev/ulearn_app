import 'package:ulearn_app/common/models/course_entities.dart';
import 'package:ulearn_app/common/services/http_util.dart';

class CourseAuthorRepo {

  static Future<CourseListResponseEntity> authorCourseList(
      {AuthorRequestEntity? params}) async {
    var response = await HttpUtil().post(
        'api/authorCourseList',
        queryParameters: params?.toJson()
    );
    return CourseListResponseEntity.fromJson(response);
  }

  static Future<AuthorResponseEntity> courseAuthor(
      {AuthorRequestEntity? params}) async {
    var response = await HttpUtil().post(
        'api/courseAuthor',
        queryParameters: params?.toJson()
    );
    return AuthorResponseEntity.fromJson(response);
  }

}