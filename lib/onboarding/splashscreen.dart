import 'dart:async';

import 'package:flutter/material.dart';
import 'package:incheg_events/helper/app_utils.dart';
import 'package:incheg_events/onboarding/loading_screen.dart';
import 'package:incheg_events/onboarding/onboarding.dart';
class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {

  @override
  void initState() {
    super.initState();

    Timer
      (const Duration(seconds: 5), () {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => OnboardingScreen()),
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
         child: Column(
           mainAxisAlignment: MainAxisAlignment.center,
           children: [
             Image.asset("assets/images/logo_white.png",
             height: 30,
             fit: BoxFit.cover,),

              const Padding(
                padding: EdgeInsets.symmetric(vertical: 10.0),
                child: Text("Incheg events",
             style: TextStyle(
                 color: Colors.white,
                 fontFamily: 'poppins',
                 fontStyle: FontStyle.normal,
                 fontSize: 20,
                 fontWeight: FontWeight.w400,
                 height: 1.5,
             ),),
              )
           ],
         )
     )

    );
  }
}
