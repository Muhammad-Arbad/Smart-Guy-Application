import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smart_guy/constants/consts.dart';
import 'package:smart_guy/utils/page_navigation.dart';
import 'package:smart_guy/views/signin.dart';
import 'package:smart_guy/widgets/scaffold_second.dart';

import '../utils/check_internet_connection.dart';
import 'no_internet.dart';



class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late AnimationController _fadeController;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarIconBrightness: Brightness.light),
    );
    checkInternetConnectivity();
    // Initialize fade animation, but don't start it yet
    _fadeController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    _fadeAnimation = CurvedAnimation(
      parent: _fadeController,
      curve: Curves.easeIn,
    );

    // Delay the fade-in until background animation completes
    Future.delayed(const Duration(milliseconds: 1000), () {
      _fadeController.forward();
    });
  }

  @override
  void dispose() {
    _fadeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:CustomAppColors.whiteColor,
      body: TweenAnimationBuilder<double>(
        tween: Tween(begin: 0.2, end: 1.2),
        duration: const Duration(seconds: 1),
        curve: Curves.easeInOut,
        builder: (context, value, child) {
          return Stack(
            children: [
              // Animated diagonal fill
              ClipPath(
                clipper: DiagonalClipper(value),
                child: Container(
                  color: CustomAppColors.primaryColor,
                ),
              ),

              // Fade-in logo/text after background is filled
              Center(
                child: FadeTransition(
                  opacity: _fadeAnimation,
                  child: Hero(
                    tag: "logo",
                    child: Image.asset("assets/images/logo.png",
                    width: MediaQuery.of(context).size.width/1.5,
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),

    );
  }
  // Custom route for slide-up transition


  checkInternetConnectivity() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    // AppSharedPreferences.setBioPopupValue(false);

    if (await checkInternet()) {
//
// final String? alreadylogin = prefs.getString("token");
// log(alreadylogin??'ufuiyreyfe78ryery8');
//       await Future.delayed(Duration(seconds: 2));
//       if(alreadylogin!.isNotEmpty){
//         ScreenNavigationSlide.navigateReplacement(context, const ScaffoldSecond());
//       }
//       else {
        if (mounted) {
          ScreenNavigationSlide.navigateReplacement(
              context, const SignInScreen());
        }
      // }


      // if (AppSharedPreferences.getUserToken() != '' &&
      //     DateTime.now().isBefore(DateTime.parse(
      //         AppSharedPreferences.getExpTime() ??
      //             DateTime.now().toString())
      //         .subtract(Duration(hours: subtractHours)))) {
      //
      //
      //
      //   if (ME_Model.instance != null && MyInstitutesSingletonMDL.instance!=null) {
      //     Navigator.of(context).pushAndRemoveUntil(
      //       MaterialPageRoute(
      //         builder: (context) => CustomScaffold(),
      //         settings: const RouteSettings(name: ConstStrings.scaffoldRouteName),
      //       ),
      //           (Route<dynamic> route) => false,
      //     );
      //   } else {
      //     Navigator.pushReplacement(
      //       context,
      //       MaterialPageRoute(
      //           builder: (context) => const SomethingWentWrong()),
      //     );
      //   }
      // } else {
      //
      //   await Future.delayed(Duration(seconds: 2));
      //
      //   Navigator.pushReplacement(
      //     context,
      //     MaterialPageRoute(builder: (context) => const SignInScreen()),
      //   );
      //
      // }


    } else {
      Future.delayed(const Duration(seconds: 2), () async {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const NoInternet()),
        );
      });
    }
  }

}


class DiagonalClipper extends CustomClipper<Path> {
  final double progress;
  DiagonalClipper(this.progress);

  @override
  Path getClip(Size size) {
    final path = Path();

    path.moveTo(0, size.height);
    path.lineTo(0, size.height - (size.height * progress));
    path.lineTo(size.width, size.height - (size.height * (progress - 0.2)).clamp(0, size.height));
    path.lineTo(size.width, size.height);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant DiagonalClipper oldClipper) {
    return oldClipper.progress != progress;
  }
}





