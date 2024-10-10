import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearn_app/common/utils/image_res.dart';
import 'package:ulearn_app/common/widgets/app_bar.dart';
import 'package:ulearn_app/common/widgets/image_widgets.dart';
import 'package:ulearn_app/features/profile/view/widget/profile_courses.dart';
import 'package:ulearn_app/features/profile/view/widget/profile_list_items.dart';
import 'package:ulearn_app/features/profile/view/widget/profile_widgets.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: buildGlobalAppbar(title: "Profile"),
      body: SingleChildScrollView(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: const Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ProfileImageWidget(),
              ProfileNameWidget(),
              ProfileDescriptionWidget(),
              ProfileCourses(),
              ProfileListItems(),
            ],
          ),
        ),
      ),
    );
  }
}
