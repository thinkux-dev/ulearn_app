import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearn_app/common/models/course_entities.dart';
import 'package:ulearn_app/common/routes/app_routes_names.dart';
import 'package:ulearn_app/common/utils/app_colors.dart';
import 'package:ulearn_app/common/utils/constants.dart';
import 'package:ulearn_app/common/widgets/app_bar.dart';
import 'package:ulearn_app/common/widgets/search_widgets.dart';
import 'package:ulearn_app/common/widgets/text_widgets.dart';
import 'package:ulearn_app/features/search/controller/courses_search_controller.dart';
import 'package:ulearn_app/features/search/widget/courses_search_widgets.dart';

class Search extends ConsumerWidget {
  const Search({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final searchProvider = ref.watch(coursesSearchControllerProvider);
    return Scaffold(
      appBar: buildGlobalAppbar(title: "Search courses"),
      body: RefreshIndicator(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 25.w),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20.h),
                AppSearchBar(
                  searchFunc: (search) {
                    ref.watch(coursesSearchControllerProvider.notifier).searchData(search);
                  },
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height,
                  child: switch (searchProvider) {
                    /// When we have data
                    AsyncData(:final value) => value!.isEmpty
                        ? const Center(child: CircularProgressIndicator())
                        : CoursesSearchWidgets(value: value),
        
                  /// When we have error
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
                ),
              ],
            ),
          ),
        ),
        onRefresh: (){
          return ref.watch(coursesSearchControllerProvider.notifier).reloadSearchData();
        },
      ),
    );
  }
}
