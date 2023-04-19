import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:incheg_events/home_nav.dart';
import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:incheg_events/onboarding/auth/home_auth.dart';
import 'package:incheg_events/onboarding/auth/phone_verification.dart';
import 'package:incheg_events/onboarding/auth/verification_done.dart';
import 'package:incheg_events/onboarding/splashscreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await FirebaseAppCheck.instance.activate();



  // FirebaseApp.initializeApp();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: "AIzaSyCFHy0PdznDVpXVN1QM0wXHpPyceLfuXIQ",
      appId: "incheg-25bc0",
      messagingSenderId: "1036181384352",
      projectId: "1036181384352",
    ),
    // options: DefaultFirebaseOptions.currentPlatform,
  );
  // await FirebaseAuth.instance.useAuthEmulator('localhost', 9099);
  await FirebaseAppCheck.instance.activate(
    androidProvider: AndroidProvider.playIntegrity,
  );
  SystemChrome.setSystemUIOverlayStyle( const SystemUiOverlayStyle(
    systemNavigationBarColor: Color(0xff330072), // navigation bar color
    statusBarColor: Color(0xff330072), // status bar color
  ));
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Incheg',
      theme: ThemeData(
        primaryColor: const Color(0xff330072),
        accentColor: const Color(0xffFEDD1F),
        backgroundColor: const Color(0xff330072).withOpacity(0.03),
        unselectedWidgetColor: const Color(0xffDDDDDD),
        primaryColorDark: const Color(0xff000000),
        primaryColorLight: const Color(0xffffffff),
        errorColor: const Color(0xffFF230E),
        fontFamily: 'poppins',
        appBarTheme: const AppBarTheme(
          elevation: 0,
          color: Colors.transparent,
        ),
        textTheme: const TextTheme(
        // body text styles
        bodyText1: TextStyle(
        color: Color(0xff330072),
        fontFamily: 'poppins',
        fontStyle: FontStyle.normal,
        fontSize: 15,
        fontWeight: FontWeight.w400,
        height: 1.5,
        ),
        bodyText2: TextStyle(
        color: Color(0xff000000),
        fontFamily: 'poppins',
        height: 1.5,
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w600,
        fontSize: 16),

        // heading styles
        headline1: TextStyle(
        color: Color(0xff330073),
        fontFamily: 'Nexa',
        fontStyle: FontStyle.normal,
        fontSize: 22,
        fontWeight: FontWeight.w900),

        // for secondary headers that are black
        headline2: TextStyle(
        color: Color(0xff000000),
        fontFamily: 'Nexa',
        fontStyle: FontStyle.normal,
        fontSize: 16,
        fontWeight: FontWeight.w700),

        // for secondary headers that are purple
        headline3: TextStyle(
        color: Color(0xff790252),
        fontFamily: 'Nexa',
        fontStyle: FontStyle.normal,
        fontSize: 15,
        fontWeight: FontWeight.w600),

        // used for buttons
        headline4: TextStyle(
        color: Color(0xff330072),
        fontFamily: 'Nexa',
        fontStyle: FontStyle.normal,
        fontSize: 20,
        fontWeight: FontWeight.w500,
        letterSpacing: 0.4),

        headline5: TextStyle(
        color: Color(0xffffffff),
        fontFamily: 'Nexa',
        fontStyle: FontStyle.normal,
        fontSize: 15,
        fontWeight: FontWeight.w500,
        letterSpacing: 0.4),

        headline6: TextStyle(
        color: Color(0xff330072),
        fontFamily: 'Nexa',
        fontStyle: FontStyle.normal,
        fontSize: 15,
        fontWeight: FontWeight.w600,
        letterSpacing: 0.4),
    ),),
      home: VerificationDone(),
      // routes: null,
    );
  }
}

