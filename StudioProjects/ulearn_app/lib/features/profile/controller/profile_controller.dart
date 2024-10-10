import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:ulearn_app/common/models/entities.dart';
import 'package:ulearn_app/global.dart';

part 'profile_controller.g.dart';

@riverpod
class ProfileController extends _$ProfileController{

  @override
  UserProfile build()=>Global.storageService.getUserProfile();
}