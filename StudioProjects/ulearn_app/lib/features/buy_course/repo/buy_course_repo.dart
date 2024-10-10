import 'package:ulearn_app/common/models/base_entities.dart';
import 'package:ulearn_app/common/models/course_entities.dart';
import 'package:ulearn_app/common/services/http_util.dart';

class BuyCourseRepo{
  static Future<BaseResponseEntity> buyCourse({CourseRequestEntity? params}) async {
    var response = await HttpUtil().post(
        "api/checkOut",
        queryParameters: params?.toJson()
    );
    return BaseResponseEntity.fromJson(response);
  }
}