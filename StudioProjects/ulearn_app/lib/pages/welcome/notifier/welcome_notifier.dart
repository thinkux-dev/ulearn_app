import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'welcome_notifier.g.dart';

@riverpod
class IndexDotProvider extends _$IndexDotProvider{
  @override
  int build() {
    return 0;
  }

  void changeIndex(int value){
    state = value;
  }
}