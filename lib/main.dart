import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:lottie/lottie.dart';
import 'Roles_UI/UI/SplashScreen/main_Splash.dart';
import 'Service/controller_handling.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [
        DeviceOrientation.portraitUp,
      ]
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {

  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    HandleControllers.createGetControllers();

    return GlobalLoaderOverlay(
      useDefaultLoading: false,
      overlayWidgetBuilder: (_) {
        return Center(
          child: SizedBox(
            width:120,
            height:120,
            child: Lottie.asset(

              "assets/images/LoadingscreenLQTest.json",

              fit: BoxFit.fitHeight,
            ),
          ),
          // child: SpinKitChasingDots(
          //   color: Colorutils.userdetailcolor,
          //   size: 28.w,
          // ),
        );
      },
      child: ScreenUtilInit(
        designSize: const Size(430, 930),
        minTextAdapt: true,
        splitScreenMode: true,
        child: GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Metro Mind',
          home: SplashScreen(),
        ),
      ),
    );
  }
}
