import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:ulearn_app/common/models/course_entities.dart';
import 'package:ulearn_app/features/search/repo/courses_search_repos.dart';

// part 'courses_search_controller.g.dart';

///This is the manual way to write Async Notifier without using the build generator.
//this is like "@Riverpod(keepAlive:true)"
class CoursesSearchController extends AsyncNotifier<List<CourseItem>?>{

  @override
  FutureOr<List<CourseItem>?> build() async{
    final response = await CoursesSearchRepos.coursesRecommended();
    if(response.code==200){
      return response.data;
    }
    return [];
  }

  reloadSearchData() async{
    final response = await CoursesSearchRepos.coursesRecommended();
    if(response.code==200){
      state = AsyncValue.data(response.data);
      return;
    }
    state = AsyncValue.data([]);
  }

  searchData (String search)async{
    SearchRequestEntity searchRequestEntity = SearchRequestEntity();
    searchRequestEntity.search = search;
    var response = await CoursesSearchRepos.coursesSearch(params: searchRequestEntity);
    if(response.code==200){
      state = AsyncValue.data(response.data);
    }else{
      state = AsyncValue.data([]);
    }
  }

}

final coursesSearchControllerProvider =
AsyncNotifierProvider<CoursesSearchController, List<CourseItem>?>(CoursesSearchController.new);