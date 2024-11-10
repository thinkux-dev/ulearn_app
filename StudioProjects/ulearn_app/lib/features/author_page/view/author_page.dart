import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearn_app/common/widgets/app_bar.dart';
import 'package:ulearn_app/common/widgets/button_widgets.dart';

import 'package:ulearn_app/features/author_page/controller/author_controller.dart';
import 'package:ulearn_app/features/author_page/view/widgets/author_widget.dart';

class AuthorPage extends ConsumerStatefulWidget {
  const AuthorPage({super.key});

  @override
  ConsumerState<AuthorPage> createState() => _AuthorPageState();
}

class _AuthorPageState extends ConsumerState<AuthorPage> {
  @override
  void didChangeDependencies() {
    final args = ModalRoute.of(context)!.settings.arguments as Map;
    print(args);
    //author data
    ref.watch(courseAuthorControllerProvider.notifier).init(args["token"]);
    //courses of the author
    ref.watch(authorCourseListControllerProvider.notifier).init(args["token"]);

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    var authorInfo = ref.watch(courseAuthorControllerProvider);
    var authorCourses = ref.watch(authorCourseListControllerProvider);

    return Scaffold(
      appBar: buildGlobalAppbar(title: "Author page"),
      body: switch (authorInfo) {
        AsyncData(:final value) => value == null
            ? Center(
                child: CircularProgressIndicator(
                  color: Colors.black26,
                  strokeWidth: 2,
                ),
              )
            : Padding(
                padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 25.w),
                child: Column(
                  children: [
                    AuthorMenu(authorInfo: value),
                    AuthorDescription(authorInfo: value),
                    SizedBox(height: 20.h),
                    //go chat button
                    AppButton(
                      buttonName: "Go Chat",
                      func: () {
                        print("I am tapped");
                      },
                    ),
                    SizedBox(height: 20.h),
                    AuthorCourses(authorCourses: authorCourses.value!),
                  ],
                ),
              ),
        AsyncError(:final error) => Text('Error $error'),
        _ => const Center(
            child: SizedBox(
              width: 20,
              height: 20,
              child: CircularProgressIndicator(
                color: Colors.red,
                strokeWidth: 2,
              ),
            ),
          ),
      },
    );
  }
}
