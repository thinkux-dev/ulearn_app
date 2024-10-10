import 'package:flutter/foundation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:ulearn_app/common/models/lesson_entities.dart';
import 'package:ulearn_app/common/utils/constants.dart';
import 'package:ulearn_app/features/lesson_detail/repo/lesson_repo.dart';
import 'package:video_player/video_player.dart';
part 'lesson_controller.g.dart';

VideoPlayerController? videoPlayerController;

@riverpod
Future<void> lessonDetailController(
    LessonDetailControllerRef ref, {required int index}) async {

  LessonRequestEntity lessonRequestEntity = LessonRequestEntity();
  lessonRequestEntity.id = index;

  final response = await LessonRepo.courseLessonDetail(params: lessonRequestEntity);
  if(response.code==200){
    var url = "${AppConstants.IMAGE_UPLOADS_PATH}${response.data!.elementAt(0).url!}";
    if (kDebugMode) {
      print('my video url is $url');
    }

    videoPlayerController = VideoPlayerController.network(url);

    var initializeVideoPlayerFuture = videoPlayerController?.initialize();
    LessonVideo vidInstance =  LessonVideo(
        lessonItem: response.data!,
        isPlay: true,
        initializeVideoPlayer: initializeVideoPlayerFuture,
        url: url
    );
    videoPlayerController?.play();
    ref.read(lessonDataControllerProvider.notifier).updateLessonData(vidInstance);
  } else {
    print('request failed ${response.code}');
  }
}

@riverpod
class LessonDataController extends _$LessonDataController{

  @override
  FutureOr<LessonVideo> build() async{
    return LessonVideo();
  }

  ///this helps to know if your states are changing or not
  @override
  set state(AsyncValue<LessonVideo> newState) {
    print('-------------------${newState.value!.lessonItem.first.url}-------------------');
    super.state = newState;
  }

  void updateLessonData(LessonVideo lessons){
    // update((data)=>lessons);
    update((data)=>data.copyWith(
      url: lessons.url,
      initializeVideoPlayer: lessons.initializeVideoPlayer,
      lessonItem: lessons.lessonItem,
      isPlay: lessons.isPlay,
    ));
  }

  void playPause(bool isPLay){
    update((data)=>data.copyWith(
      isPlay: isPLay
    ));
  }

  void playNextVid(String url) async{
    if(videoPlayerController!=null){
      videoPlayerController?.pause();
      videoPlayerController?.dispose();
    }
    update((data)=>data.copyWith(
      isPlay: false,
      initializeVideoPlayer: null,
    ));
    //done with resource release

    //next start again
    var vidUrl = "${AppConstants.IMAGE_UPLOADS_PATH}$url";
    print("vidUrl -> ${vidUrl.toString()}");
    videoPlayerController = VideoPlayerController.network(vidUrl);

    var initializeVideoPlayerFuture = videoPlayerController?.initialize().then((value){
      videoPlayerController?.seekTo(Duration(seconds: 0));

      videoPlayerController?.play();
    });

    update((data)=>data.copyWith(
      initializeVideoPlayer: initializeVideoPlayerFuture,
      isPlay: true,
      url: vidUrl
    ));

  }
}

@riverpod
class VideoIndexController extends _$VideoIndexController{

  @override
  int build(){
    return 0;
  }

  int playEarlyAndNext(bool isEarlyOrNext){
    var data = ref.watch(lessonDataControllerProvider).value!.lessonItem;
    if(isEarlyOrNext) {
      //this is for left videos
      state = state + 1;
      if(state>=data.length){
        state = data.length-1;

        return -1;
      }
    }else{
      //this is for left videos
      state = state -1;
      if(state<0){
        state = 0;
        return -1;
      }
    }

    var videoUrl = data[state].url;
    ref.read(lessonDataControllerProvider.notifier).playNextVid(videoUrl!);
    return state;
  }

  void playPause(){
    var data = ref.watch(lessonDataControllerProvider).value!;
    if(data.isPlay){
      videoPlayerController?.pause();
      ref.read(lessonDataControllerProvider.notifier).playPause(false);
    }else{
      videoPlayerController?.play();
      ref.read(lessonDataControllerProvider.notifier).playPause(true);
    }

  }
}