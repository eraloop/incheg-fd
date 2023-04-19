import 'dart:async';

import 'package:flutter/material.dart';
import 'package:incheg_events/helper/app_utils.dart';
import 'package:incheg_events/onboarding/loading_screen.dart';
class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    Timer(const Duration(seconds: 1), () {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => LoadingScreen()),
              (route) => false);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     body: Container(
         height: double.infinity,
         width: double.infinity,
         color: AppUtils.PrimaryColor,
         child: Center(
           child: FittedBox(
             child: Image.asset("assets/images/logo_white.png",
               // fit: BoxFit.cover,
               height: 100,
               width: 100,
             ),
           ),
         )
     )

    );
  }
}
