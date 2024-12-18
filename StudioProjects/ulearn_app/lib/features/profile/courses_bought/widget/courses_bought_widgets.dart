import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ulearn_app/common/models/course_entities.dart';
import 'package:ulearn_app/common/widgets/course_tile_widgets.dart';

class CoursesBoughtWidgets extends ConsumerWidget {
  final List<CourseItem> value;
  const CoursesBoughtWidgets({super.key, required this.value});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return CourseTileWidgets(value: value);
  }
}
