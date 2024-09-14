import 'dart:convert';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearn_app/common/routes/routes.dart';
import 'package:ulearn_app/common/utils/app_styles.dart';
import 'package:ulearn_app/common/utils/constants.dart';
import 'package:ulearn_app/firebase_options.dart';
import 'package:ulearn_app/global.dart';

import 'features/dashboard/dashboard.dart';
import 'features/sign_in/view/sign_in.dart';
import 'features/sign_up/view/sign_up.dart';
import 'features/welcome/view/welcome.dart';

Future<void> main() async {

  ///understanding json encode method(Json encode converts json object/map to string)
  // var item = {"name" :"bob", "age" :34};
  // var newItem = jsonEncode(item);
  // print(item['name']);
  // print(newItem);

  // var test = "name";
  // print(test[3]);

  ///understanding json decode method(Json decode converts string to json object/map)
  // var item = Global.storageService.getString(AppConstants.STORAGE_USER_PROFILE_KEY)??'';
  // print(item);
  // var newItem = jsonDecode(item);
  // print(newItem);

  await Global.init();
  runApp(const ProviderScope(child: MyApp()));
}

final GlobalKey<NavigatorState> navKey = GlobalKey<NavigatorState>();

// var routesMap = {
//   "/": (context)=>Welcome(),
//   "/signIn": (context)=>const SignIn(),
//   "/register": (context)=>const SignUp(),
//   "/dashboard": (context)=>const Dashboard()
// };

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812), //Size(360, 690)
      // minTextAdapt: true,
      builder: (context, child) {
        return MaterialApp(
          navigatorKey: navKey,
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
          theme: AppTheme.appThemeData,
          // routes: routesMap,
          onGenerateRoute: AppPages.generateRouteSettings,
        );
      },
    );
  }
}

final appCount = StateProvider<int>((ref){
  return 1;
});

class MyHomePage extends ConsumerWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    int count  = ref.watch(appCount);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('Riverpod app'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              count.toString(),
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          FloatingActionButton(
            heroTag: "one",
            onPressed: (){
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const SecondPage(),
                ),
              );
            },
            tooltip: 'Increment',
            child: const Icon(Icons.arrow_right_rounded),
          ),
          FloatingActionButton(
            heroTag: "two",
            onPressed: (){
              ref.read(appCount.notifier).state++;
            },
            tooltip: 'Increment',
            child: const Icon(Icons.add),
          )
        ],
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class SecondPage extends ConsumerWidget {
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    int count = ref.watch(appCount);
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Text("$count", style: const TextStyle(fontSize: 30),),
      ),
    );
  }
}

