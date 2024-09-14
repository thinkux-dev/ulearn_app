class ImageRes{
  ///this is a private constructor which means the class is now private
  ///and nobody would be able to create an instance of this class
  ImageRes._();

  /*
    Center(child: appImage(imagePath: 'assets/icons/home.png', width: 250, height: 250,),),
    Center(child: appImage(imagePath: "assets/icons/search2.png", width: 250, height: 250,),),
    Center(child: appImage(imagePath: "assets/icons/play-circle.png", width: 250, height: 250,),),
    Center(child: appImage(imagePath: "assets/icons/message-circle.png", width: 250, height: 250,),),
    Center(child: appImage(imagePath: "assets/icons/person2.png", width: 250, height: 250,),),
   */

  static const String _imageBase = "assets/icons";
  static const String defaultImg = '$_imageBase/default.png';
  static const String user = '$_imageBase/user.png';
  static const String lock = '$_imageBase/lock.png';
  static const String home = '$_imageBase/home.png';
  static const String search = '$_imageBase/search2.png';
  static const String play = '$_imageBase/play-circle.png';
  static const String message = '$_imageBase/message-circle.png';
  static const String profile = '$_imageBase/person2.png';
  static const String searchIcon = '$_imageBase/search.png';
  static const String searchButton = '$_imageBase/options.png';
  static const String banner1 = '$_imageBase/Art.png';
  static const String banner2 = '$_imageBase/Image(1).png';
  static const String banner3 = '$_imageBase/Image(2).png';
  static const String menu = '$_imageBase/menu.png';


  static const String reading = "assets/images/reading.png";
  static const String man = "assets/images/man.png";
  static const String boy = "assets/images/boy.png";
}