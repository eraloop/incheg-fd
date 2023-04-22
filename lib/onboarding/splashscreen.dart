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

  late AnimationController _controller;
  late Animation<double> _containerScaleAnimation;

  bool _visible = false;
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    _containerScaleAnimation = Tween<double>(
      begin: 5.0,
      end: 0.0,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInExpo,
      ),
    );

    Timer
      (const Duration(seconds: 5), () {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => OnboardingScreen()),
              (route) => false);
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _controller
      ..reset()
      ..forward();
    return Scaffold(
     body: SingleChildScrollView(
       child: Container(
           height: double.infinity,
           width: double.infinity,
           // color: AppUtils.PrimaryColor,
           child: Stack(
             children:[
               Container(
                 alignment: Alignment.center,
                 margin: const EdgeInsets.symmetric(vertical: 40),
                 child: Column(
                   mainAxisSize: MainAxisSize.min,
                   mainAxisAlignment: MainAxisAlignment.center,
                   // mainAxisAlignment: MainAxisAlignment.center,
                   children: [
                     Container(
                       margin: const EdgeInsets.only(top: 300 ),
                       child: Column(
                         children: [
                           Padding(
                             padding: const EdgeInsets.only(top: 40.0),
                             child: FittedBox(
                               child: Image.asset("assets/images/logo_blue.png",
                                 fit: BoxFit.cover,
                                 height: 30,
                               ),
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
                     // const Spacer(),
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
               ),

               Positioned.fill(
                 child: ScaleTransition(
                   scale: _containerScaleAnimation,
                   child: Container(
                     height: MediaQuery.of(context).size.height,
                     width: MediaQuery.of(context).size.width,
                     alignment: Alignment.center,
                     decoration: BoxDecoration(
                       shape: BoxShape.circle,
                       color: Theme.of(context).primaryColor,
                     ),
                     child: SizedBox(
                       height: 20,
                       width: 20,
                       child: FittedBox(
                         child: Image.asset("assets/images/logo_white.png",
                           // fit: BoxFit.fill,
                         ),
                       ),
                     ),
                   ),
                 ),
               ),
             ],
           )
       ),
     )

    );
  }
}
