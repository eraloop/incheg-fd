import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart' as fb;
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:incheg_events/helper/app_utils.dart';
import 'package:incheg_events/helper/network.dart';
import 'package:incheg_events/helper/session_mananger.dart';
import 'package:incheg_events/home_nav.dart';
import 'package:incheg_events/models/user.dart';
import 'package:incheg_events/onboarding/auth/phone_verification.dart';

class Authenticate {
  SessionManager ss = SessionManager();

  static Future<dynamic> checkProviderUser(Map<String, dynamic> userData) async {
    final Map<String, dynamic> data = {
      "email": userData['email'],
      'name': userData['name'],
      'provider_id': userData['provider_id'],
      'provider': userData['provider'],
    };

    final String url = 'api/provider_auth';
    try {
      print("user data before post request $data");
      var response = await HttpResource().post(url, data);

      return response;
    } catch (error) {
      throw error;
    }
  }
  static Future<dynamic> registerProviderUser(Map<String, dynamic> userData) async {
    final Map<String, dynamic> data = {
      "first_name": userData['first_name'],
      'last_name': userData['last_name'],
      'email': userData['email'],
      'phone_number': userData['phone_number'],
      'password': userData['password'],
      'provider': userData['provider'],
      'provider_id': userData['provider_id'],
    };

    final String url = 'api/register_provider_user';

    try {
      print("user data before post request $data");
      final response = await HttpResource().post(url, data);
      print(response.body);
      return response;
    } catch (error) {
      print(error);
      throw error;
    }
  }

  static onVerifyPhone(BuildContext context,  String phone_number, dynamic userData) {
    fb.FirebaseAuth _auth = fb.FirebaseAuth.instance;
    _auth.verifyPhoneNumber(
      phoneNumber: phone_number,
      codeSent: (verificationId, forceResendingToken) {
        Navigator.pop(context);
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => const PhoneVerification(
                  // phone_number: phone_number,
                  // verificationId: verificationId,
                  // user: userData
              )),
        );
      },
      codeAutoRetrievalTimeout: (String verificationId) {},
      timeout: const Duration(seconds: 60),
      verificationCompleted: (fb.AuthCredential authCredential) async {
        Navigator.pop(context);
        AppUtils.showProgressDialog(context);
        final response = await User.register(userData);
        print("response from onverify phone during normal signup $response");
        if (response.statusCode == 201) {
          Map data = json.decode(response.body);
          Map user = data['user'];
          String token = data['token'];
          // ss.setUser(user, token);


          // final profile_status = await ss.getProfileStatus();
          // final isFirstTime = await ss.isFirstime();

        //   if (profile_status) {
        //     if (isFirstTime) {
        //       Navigator.of(context).pop();
        //       Navigator.pushAndRemoveUntil(
        //           context,
        //           MaterialPageRoute(builder: (context) => OnboardingScreens()),
        //               (route) => false);
        //     } else {
        //       Navigator.of(context).pop();
        //       Navigator.pushAndRemoveUntil(
        //           context,
        //           MaterialPageRoute(builder: (context) => ProfilePrompt()),
        //               (route) => false);
        //     }
        //   } else {
        //     Navigator.of(context).pop();
        //     Navigator.pushAndRemoveUntil(
        //         context,
        //         MaterialPageRoute(builder: (context) => HomeNav()),
        //             (route) => route.isFirst);
        //   }
        //   final snackBar = customSnackBar( context: context, type: ContentType.success, data: data);
        //   ScaffoldMessenger.of(context)
        //     ..hideCurrentSnackBar()
        //     ..showSnackBar(snackBar);
        // } else if (response.statusCode == 409) {
        //   Map data = json.decode(response.body);
        //   final snackBar = customSnackBar(
        //       context: context, type: ContentType.failure, data: data);
        //   ScaffoldMessenger.of(context)
        //     ..hideCurrentSnackBar()
        //     ..showSnackBar(snackBar);
        //
        //   Navigator.pop(context);
        //   Navigator.push(
        //       context, MaterialPageRoute(builder: (context) => LogIn()));
        // } else if (response.statusCode == 500) {
        //   Map data = json.decode(response.body);
        //   final snackBar = customSnackBar(
        //       context: context, type: ContentType.failure, data: data);
        //   ScaffoldMessenger.of(context)
        //     ..hideCurrentSnackBar()
        //     ..showSnackBar(snackBar);
        //   Navigator.of(context).pop();
        //   Navigator.push(
        //       context, MaterialPageRoute(builder: (context) => SignUp()));
        // } else {
        //   var data = {
        //     "title": "Something went wrong",
        //     "message": "Request failed, Please try again !!",
        //   };
        //   Navigator.of(context).pop();
        //   final snackBar = customSnackBar(
        //       context: context, type: ContentType.failure, data: data);
        //   ScaffoldMessenger.of(context)
        //     ..hideCurrentSnackBar()
        //     ..showSnackBar(snackBar);
        }
      },
      verificationFailed: (authException) {
        Navigator.pop(context);
        print(authException.message ?? "Something went wrong");

      },
    );
  }

 static  verifyPhone(BuildContext context, String verificationId, String code,
      dynamic userData) {
    fb.FirebaseAuth auth = fb.FirebaseAuth.instance;
    fb.AuthCredential credential = fb.PhoneAuthProvider.credential(
        verificationId: verificationId, smsCode: code);

    auth.signInWithCredential(credential).catchError((error) {
      Navigator.of(context).push(MaterialPageRoute(builder: (context) => HomeNav()));
      AppUtils.showToast(context, Colors.red, 'Something went wrong');

    }).then((value) async {
      Navigator.pop(context);
      AppUtils.showProgressDialog(context);
      final response = await  User.register(userData);
      final data = json.decode(response.body);
      print(" error from backend $data");
      if(response.statusCode == 201){
        //  success
        Navigator.of(context, rootNavigator: true).pop();
        SessionManager().setUser(
          id: data['user']['id'],
          token: data['token'],
          name: data['user']['name'],
          email: data['user']['email'],
          phone: data['user']['phone'],
          sin: data['user']['sin'],
          resp_promoter: data['user']['resp_promoter'],
          eligibility_status: data['user']['eligibility_status'],
        );
        SessionManager().setToken(data['token']);
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => HomeNav()));
        AppUtils.showToast(context, Colors.green, data['message']);
      }else if (response.statusCode == 401){
        //  credentials not correct
        Navigator.of(context, rootNavigator: true).pop();
        AppUtils.showToast(context, Colors.red, data['message']);
      }else if(response.statusCode == 403){
        //  missing credential
        Navigator.of(context, rootNavigator: true).pop();
        AppUtils.showToast(context, Colors.red, data['message']);
      }else if(response.statusCode == 409){
        Navigator.of(context, rootNavigator: true).pop();
        AppUtils.showToast(context, Colors.red, data['message']);
      }
      else if(response.statusCode == 500){
        //server error
        Navigator.of(context, rootNavigator: true).pop();
        AppUtils.showToast(context, Colors.red, data['message']);
      }else{
        // something whe  wrong
        Navigator.of(context, rootNavigator: true).pop();
        AppUtils.showToast(context, Colors.red, 'Something when wrong');
      }
    });
  }

  static Future<dynamic> signInWithGoogle({required BuildContext context}) async {
    fb.FirebaseAuth auth = fb.FirebaseAuth.instance;
    dynamic user;
    final GoogleSignIn googleSignIn = GoogleSignIn();

    final GoogleSignInAccount? googleSignInAccount =
    await googleSignIn.signIn();

    if (googleSignInAccount != null) {
      final GoogleSignInAuthentication googleSignInAuthentication =
      await googleSignInAccount.authentication;

      final fb.AuthCredential credential = fb.GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );

      try {
        final fb.UserCredential userCredential =
        await auth.signInWithCredential(credential);

        user = userCredential.user;
      } on fb.FirebaseAuthException catch (e) {
        if (e.code == 'account-exists-with-different-credential') {
          Map data = {
            "title": 'Error',
            "message":
            "'The account already exists with a different credential'"
          };
          Navigator.of(context).pop();
          // final snackBar = customSnackBar(
          //     context: context, type: ContentType.failure, data: data);
          // ScaffoldMessenger.of(context)
          //   ..hideCurrentSnackBar()
          //   ..showSnackBar(snackBar);
        } else if (e.code == 'invalid-credential') {
          var data = {
            "title": "Error",
            "message": "Invalid credentials !!",
          };
          Navigator.of(context).pop();
          // final snackBar = customSnackBar(
          //     context: context, type: ContentType.failure, data: data);
          // ScaffoldMessenger.of(context)
          //   ..hideCurrentSnackBar()
          //   ..showSnackBar(snackBar);
        }
      } catch (e, stackTrace) {
        print(stackTrace);
        // ScaffoldMessenger.of(context).showSnackBar(
        //   customSnackBar(
        //     content: 'Error occurred using Google Sign In. Try again.',
        //   ),
        // );
      }
    }
    return user.providerData[0];
  }

}