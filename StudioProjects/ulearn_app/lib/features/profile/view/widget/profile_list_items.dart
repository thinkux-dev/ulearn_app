import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearn_app/common/routes/app_routes_names.dart';
import 'package:ulearn_app/common/utils/app_colors.dart';
import 'package:ulearn_app/common/utils/image_res.dart';
import 'package:ulearn_app/common/widgets/image_widgets.dart';
import 'package:ulearn_app/common/widgets/text_widgets.dart';

class ProfileListItems extends StatelessWidget {
  const ProfileListItems({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 25.w, vertical: 30.h),
      child: Column(
        children: [
          ListItem(
            imagePath: ImageRes.settings,
            text: "Settings",
            func: ()=>Navigator.of(context).pushNamed(AppRoutesNames.SETTINGS),
          ),
          ListItem(
            imagePath: ImageRes.creditCard,
            text: "Payment detail",
          ),
          ListItem(
            imagePath: ImageRes.award,
            text: "Achievement",
          ),
          ListItem(
            imagePath: ImageRes.love,
            text: "Love",
          ),
          ListItem(
            imagePath: ImageRes.reminder,
            text: "Reminder",
          ),
        ],
      ),
    );
  }
}

class ListItem extends StatelessWidget {
  final String imagePath;
  final String text;
  final VoidCallback? func;

  const ListItem({super.key, required this.imagePath, required this.text, this.func});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: func,
      child: Row(
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 15.h),
            width: 40.w,
            height: 40.h,
            padding: EdgeInsets.all(7.w),
            decoration: BoxDecoration(
              color: AppColors.primaryElement,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: AppColors.primaryElement),
            ),
            child: AppImage(
              imagePath: imagePath,
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 15.w, bottom: 15.h),
            child: Text13Normal(text: text),
          )
        ],
      ),
    );
  }
}
