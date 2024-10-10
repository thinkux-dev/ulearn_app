import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearn_app/common/utils/constants.dart';
import 'package:ulearn_app/common/utils/image_res.dart';
import 'package:ulearn_app/common/widgets/app_bar.dart';
import 'package:ulearn_app/common/widgets/app_box_decoration.dart';
import 'package:ulearn_app/common/widgets/image_widgets.dart';
import 'package:ulearn_app/common/widgets/popup_messages.dart';
import 'package:ulearn_app/features/lesson_detail/controller/lesson_controller.dart';
import 'package:ulearn_app/features/lesson_detail/widget/lesson_detail_widgets.dart';
import 'package:video_player/video_player.dart';

class LessonDetail extends ConsumerStatefulWidget {
  const LessonDetail({super.key});

  @override
  ConsumerState<LessonDetail> createState() => _LessonDetailState();
}

class _LessonDetailState extends ConsumerState<LessonDetail> {
  late var args;
  int videoIndex=0;

  @override
  void didChangeDependencies() {
    var id = ModalRoute.of(context)!.settings.arguments as Map;
    // print(args['id']);
    args = id['id'];
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    videoPlayerController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // var lessonDetail = ref.watch(lessonDetailControllerProvider(index: args.toInt()));
    var lessonData = ref.watch(lessonDataControllerProvider);
    ref.watch(videoIndexControllerProvider);
    print(
        '-------my data length is ${lessonData.value!.lessonItem.length}----------');
    return Scaffold(
      appBar: buildGlobalAppbar(title: "Lesson detail"),
      body: Center(
        child: lessonData.value==null
            ? Container(child: Center(child: CircularProgressIndicator()))
            : Column(
                children: [
                  lessonData.when(
                    data: (data) {
                      return Column(
                        children: [
                          Container(
                            width: 325.w,
                            height: 200.h,
                            decoration: data.lessonItem.isEmpty? appBoxShadow() : networkImageDecoration(
                              imagePath:
                              "${AppConstants.IMAGE_UPLOADS_PATH}${data.lessonItem[0].thumbnail}",
                            ),
                            child: FutureBuilder(
                              future: data.initializeVideoPlayer,
                              builder: (context, snapshot) {
                                if (snapshot.connectionState ==
                                    ConnectionState.done) {
                                  return videoPlayerController == null
                                      ? Container()
                                      : Stack(
                                    children: [
                                      VideoPlayer(videoPlayerController!)
                                    ],
                                  );
                                } else {
                                  return const Center(
                                      child: CircularProgressIndicator());
                                }
                              },
                            ),
                          ),

                          //Video Controls
                          Padding(
                            padding: EdgeInsets.only(left: 25.w, right: 25.w, top: 10.h),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                GestureDetector(
                                  onTap:(){
                                    // videoIndex = videoIndex - 1;
                                    // if (videoIndex < 0) {
                                    //   videoIndex = 0;
                                    //   toastInfo(msg: "No earlier videos");
                                    //   return;
                                    // }
                                    // var videoUrl =
                                    //     data.lessonItem[videoIndex].url;
                                    // ref.read(lessonDataControllerProvider.notifier).playNextVid(videoUrl!);

                                    var indexVal = ref.read(videoIndexControllerProvider.notifier).playEarlyAndNext(false);
                                    if(indexVal==-1){
                                      toastInfo(msg: "No more early videos");
                                    }
                                  },
                                  child: AppImage(
                                    width: 24.w,
                                    height: 24.h,
                                    imagePath: ImageRes.left,
                                  ),
                                ),
                                SizedBox(width: 15.w),

                                GestureDetector(
                                    onTap: (){
                                      ref.read(videoIndexControllerProvider.notifier).playPause();
                                    },
                                    child: data.isPlay?AppImage(
                                      width: 24.w,
                                      height: 24.h,
                                      imagePath: ImageRes.pause,
                                    ):AppImage(
                                      width: 24.w,
                                      height: 24.h,
                                      imagePath: ImageRes.play,
                                    )
                                ),
                                SizedBox(width: 15.w),

                                GestureDetector(
                                  onTap: (){
                                    // videoIndex = videoIndex+1;
                                    // if(videoIndex>=data.lessonItem.length){
                                    //   videoIndex = data.lessonItem.length-1;
                                    //   toastInfo(msg: "You have seen all the videos");
                                    //   return;
                                    // }
                                    // var videoUrl = data.lessonItem[videoIndex].url;
                                    // ref.read(lessonDataControllerProvider.notifier).playNextVid(videoUrl!);

                                    var indexVal = ref.read(videoIndexControllerProvider.notifier).playEarlyAndNext(true);
                                    if(indexVal==-1){
                                      toastInfo(msg: "No more next videos");
                                    }
                                  },
                                  child: AppImage(
                                    width: 24.w,
                                    height: 24.h,
                                    imagePath: ImageRes.right,
                                  ),
                                )

                              ],
                            ),
                          ),

                          SizedBox(height: 10.h),

                          //Video List
                          Padding(
                            padding: EdgeInsets.only(left: 25.w, right: 25.w),
                            child: LessonVideos(
                              lessonData: data.lessonItem,
                              ref:ref,
                              syncVideoIndex: syncVideoIndex
                            ),
                          ),
                        ],
                      );
                    },
                    error: (e, t) => Text("error loading data"),
                    loading: () => Text("Loading..."),
                  ),
                ],
              ),
      ),
    );
  }

  void syncVideoIndex(int index){
    videoIndex = index;
  }
}
