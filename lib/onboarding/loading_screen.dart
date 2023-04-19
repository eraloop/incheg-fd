import 'dart:async';

import 'package:flutter/material.dart';
import 'package:incheg_events/helper/app_utils.dart';
import 'package:incheg_events/onboarding/onboarding.dart';
class LoadingScreen extends StatefulWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(const Duration(seconds: 2), () {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => OnboardingScreen()),
              (route) => false);
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:  Container(
          alignment: Alignment.center,
          margin: const EdgeInsets.symmetric(vertical: 40),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: const EdgeInsets.only(top: 300 ),
                child: Column(
                  children: [
                    FittedBox(
                      child: Image.asset("assets/images/logo_blue.png",
                        fit: BoxFit.cover,
                        height: 80,
                      ),
                    ),
                     const Padding(
                       padding:  EdgeInsets.symmetric(vertical: 10.0),
                       child: Text('Incheg events',
                        style: TextStyle(
                            color: Color(0xff330073),
                            fontFamily: 'Nexa',
                            fontStyle: FontStyle.normal,
                            fontSize: 30,
                            fontWeight: FontWeight.w900),),
                     ),
                  ],
                ),
              ),
              const Spacer(),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 10),
                width: 30,
                height: 30,
                child: const CircularProgressIndicator(
                  backgroundColor: Color(0xff330073),
                  color: Colors.white,
                  strokeWidth: 3,
                ),
              ),
              Text('All rights reserved, Incheg 2023.',
                style: TextStyle(
                  color: Theme.of(context).unselectedWidgetColor,
                ),),

            ],
          ),
        )
    );
  }
}
