import 'dart:async';

import 'package:flutter/material.dart';
import 'package:incheg_events/home_nav.dart';
class VerificationDone extends StatefulWidget {
  const VerificationDone({Key? key}) : super(key: key);

  @override
  State<VerificationDone> createState() => _VerificationDoneState();
}

class _VerificationDoneState extends State<VerificationDone> {
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(const Duration(seconds: 2), () {

      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => HomeNav()),
              (route) => false);
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20.0,),
              child: Text("Done",
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headline1,),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5),
              child: Text(" Your all set up,",
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyText2,),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5),
              child: Text(" Welcome to Incheg Events",
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headline4,),
            ),

            const Padding(
              padding: EdgeInsets.symmetric(vertical: 10.0),
              child: Icon(Icons.check_rounded,
              size: 100,
              color: Color(0xff62BAAC),
              ),
            ),


          ],
        ),
      ),
    );
  }
}
