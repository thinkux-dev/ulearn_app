import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ulearn_app/common/widgets/app_bar.dart';
import 'package:ulearn_app/features/profile/courses_bought/controller/courses_bought_controller.dart';
import 'package:ulearn_app/features/profile/courses_bought/widget/courses_bought_widgets.dart';

class CoursesBought extends ConsumerWidget {
  const CoursesBought({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final coursesList = ref.watch(coursesBoughtControllerProvider);
    int i = 0;

    return Scaffold(
      appBar: buildGlobalAppbar(title: "Your courses"),
      body: switch (coursesList) {
        AsyncData(:final value) => value == null
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : CoursesBoughtWidgets(value: value),
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
          )
      },
    );
  }
}
