import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearn_app/common/utils/app_colors.dart';
import 'package:ulearn_app/common/utils/image_res.dart';

class AppImage extends StatelessWidget {
  final String imagePath; ///replace "assets/icons/user.png" with "ImageRes.defaultImg"
  final double width;
  final double height;

   const AppImage({
    super.key,
    this.imagePath = "assets/icons/user.png",
    this.height = 16,
    this.width = 16,
  });

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      imagePath.isEmpty ? "assets/icons/user.png" : imagePath, ///replace "assets/icons/user.png" with "ImageRes.defaultImg"
      width: width.w,
      height: height.h,
    );
  }
}


Widget appImageWithColor({
  String imagePath = "assets/icons/user.png", ///replace with "ImageRes.defaultImg"
  double width = 16,
  double height = 16,
  Color color = AppColors.primaryElement
}) {
  return Image.asset(
    imagePath.isEmpty ? "assets/icons/user.png" : imagePath,  ///replace "assets/icons/user.png" with "ImageRes.defaultImg"
    width: width.w,
    height: height.h,
    color: color,
  );
}

