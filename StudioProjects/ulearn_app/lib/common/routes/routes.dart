import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:ulearn_app/common/routes/app_routes_names.dart';
import 'package:ulearn_app/features/buy_course/view/buy_course.dart';
import 'package:ulearn_app/features/course_detail/view/course_detail.dart';
import 'package:ulearn_app/features/home/view/home.dart';
import 'package:ulearn_app/features/lesson_detail/view/lesson_detail.dart';
import 'package:ulearn_app/features/profile/courses_bought/view/courses_bought.dart';
import 'package:ulearn_app/features/profile/settings/view/settings.dart';
import 'package:ulearn_app/global.dart';

import '../../features/dashboard/dashboard.dart';
import '../../features/sign_in/view/sign_in.dart';
import '../../features/sign_up/view/sign_up.dart';
import '../../features/welcome/view/welcome.dart';

class AppPages {
  static List<RouteEntity> routes() {
    return [
      RouteEntity(page: Welcome(), path: AppRoutesNames.WELCOME),
      RouteEntity(page: const SignIn(), path: AppRoutesNames.SIGN_IN),
      RouteEntity(page: const SignUp(), path: AppRoutesNames.REGISTER),
      RouteEntity(page: const Dashboard(), path: AppRoutesNames.DASHBOARD),
      RouteEntity(page: const Home(), path: AppRoutesNames.HOME),
      RouteEntity(page: const CourseDetail(), path: AppRoutesNames.COURSE_DETAIL),
      RouteEntity(page: const LessonDetail(), path: AppRoutesNames.LESSON_DETAIL),
      RouteEntity(page: const BuyCourse(), path: AppRoutesNames.BUY_COURSE),
      RouteEntity(page: const Settings(), path: AppRoutesNames.SETTINGS),
      RouteEntity(page: const CoursesBought(), path: AppRoutesNames.COURSES_BOUGHT),
    ];
  }

  static MaterialPageRoute generateRouteSettings(RouteSettings settings) {
    if (kDebugMode) {
      // print("Clicked route is ${settings.name}");
    }

    if(settings.name!=null){
      var result = routes().where((element) => element.path==settings.name);

      if(result.isNotEmpty){
        //if we used this first time or not
        bool deviceOpenFistTime = Global.storageService.getDeviceFirstOpen();

        if(result.first.path==AppRoutesNames.WELCOME&&deviceOpenFistTime){

          bool isLoggedIn = Global.storageService.isLoggedIn();
          if(isLoggedIn){
            return MaterialPageRoute(
                builder: (_) => const Dashboard(),
                settings: settings);
          }else{
            return MaterialPageRoute(
                builder: (_) => const SignIn(),
                settings: settings);
          }

        } else {
          if (kDebugMode) {
            // print("App ran first time");
          }
          return MaterialPageRoute(
              builder: (_) => result.first.page,
              settings: settings);
        }
      }
    }
    return MaterialPageRoute(
        builder: (_) => Welcome(),
        settings: settings);
  }
}

class RouteEntity{
  String path;
  Widget page;
  RouteEntity({required this.path, required this.page});
}
