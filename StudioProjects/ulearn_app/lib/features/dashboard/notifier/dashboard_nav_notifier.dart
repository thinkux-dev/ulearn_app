import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'dashboard_nav_notifier.g.dart';

@riverpod
class DashboardNavIndex extends _$DashboardNavIndex{
  @override
  int build(){
    return 0;
  }

  void changeIndex(int val){
    state = val;
  }
}