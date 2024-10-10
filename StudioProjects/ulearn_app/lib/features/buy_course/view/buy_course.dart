import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearn_app/features/buy_course/controller/buy_course_controller.dart';
import 'package:webview_flutter/webview_flutter.dart';

class BuyCourse extends ConsumerStatefulWidget {
  const BuyCourse({super.key});

  @override
  ConsumerState<BuyCourse> createState() => _BuyCourseState();
}

class _BuyCourseState extends ConsumerState<BuyCourse> {
  late var args;
  late WebViewController webViewController;

  @override
  void didChangeDependencies() {
    var id = ModalRoute.of(context)!.settings.arguments as Map;
    args = id['id'];
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    var courseBuy = ref.watch(buyCourseControllerProvider(index: args.toInt()));
    return Scaffold(
      appBar: AppBar(),
      body: courseBuy.when(
        data: (data) {
          if(data==null){
            return Center(
              child: Text(
                'Order already exist or something went wrong',
                style: TextStyle(fontSize: 22.sp),
                textAlign: TextAlign.center,
              ),
            );
          }
          return WebView(
            initialUrl: data,
            javascriptMode: JavascriptMode.unrestricted,
            javascriptChannels: {
              JavascriptChannel(
                name: "Pay",
                onMessageReceived: (JavascriptMessage message){
                  print("-----message received------");
                  print(message.message);
                  Navigator.of(context).pop(message.message);
                },
              ),
            },
            onWebViewCreated: (WebViewController web){
              print("------created------");
              webViewController = web;
            },
          );
        },
        error: (error, trace) => const Text('Error getting webview'),
        loading: () => const Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
