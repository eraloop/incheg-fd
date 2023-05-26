import 'dart:async';

import 'package:flutter/material.dart';
import 'package:incheg_events/helpers/utils.dart';
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
      (const Duration(seconds: 3), () {
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
         color: Utils.PrimaryColor,
         child: Column(
           mainAxisAlignment: MainAxisAlignment.center,
           children: [
             Image.asset("assets/images/logo_white.png",
             height: 50,
             fit: BoxFit.cover,),

              const Padding(
                padding: EdgeInsets.symmetric(vertical: 10.0),
                child: Text("events",
             style: TextStyle(
                 color: Colors.white,
                 fontFamily: 'poppins',
                 fontStyle: FontStyle.normal,
                 fontSize: 25,
                 fontWeight: FontWeight.w500,
                 height: 1.5,
             ),),
              )
           ],
         )
     )

    );
  }
}
