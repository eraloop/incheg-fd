import 'dart:convert';

import 'package:country_code_picker/country_code_picker.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:incheg_events/helper/app_utils.dart';
import 'package:incheg_events/helper/authenticate.dart';
import 'package:incheg_events/helper/session_mananger.dart';
import 'package:incheg_events/home_nav.dart';
import 'package:incheg_events/models/user.dart';
import 'package:incheg_events/onboarding/auth/login.dart';
import 'package:incheg_events/onboarding/auth/phone_verification.dart';
class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final formKey = GlobalKey<FormState>();

  FocusNode passwordFocusNode = FocusNode();
  FocusNode emailFocusNode = FocusNode();
  FocusNode nameFocusNode = FocusNode();
  FocusNode confirmPasswordFocusNode = FocusNode();

  bool _passwordVisible = false;
  bool _confirmPasswordVisible = false;
  bool remember_me = false;
  String county_code='';

  Map<String, dynamic> userData = {
      "name": '',
      "email": '',
      "phone": '',
      "password": '',
      "confirm_password" : ''
  };



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Container(
            margin: const EdgeInsets.only(top: 100),
            child: Column(
              // crossAxisAlignment: CrossAxisAlignment.stretch,
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: Text("Sign Up",
                    style: Theme.of(context).textTheme.headline4,),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: Text("Please provide your login info below",
                    style: Theme.of(context).textTheme.bodyText1,),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 30.0),
                  child: Form(
                      key: formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          TextFormField(
                            obscureText: !_passwordVisible,
                            autovalidateMode:
                            AutovalidateMode.onUserInteraction,
                            validator: (value) {
                              if (value!.length < 6) {
                                return 'Invalid name, too short';
                              }
                              return null;
                            },
                            onSaved: (value) {
                              userData["name"] = value ??= "";
                            },
                            onChanged: (value) =>
                            userData['name'] = value,
                            focusNode: nameFocusNode,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Theme.of(context).backgroundColor,
                              labelText: 'Full Name',
                              labelStyle: TextStyle(
                                  color: nameFocusNode.hasFocus
                                      ? Theme.of(context).primaryColor
                                      : Colors.black),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(200.0),
                                  borderSide: BorderSide.none
                              ),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(200.0),
                                  borderSide: BorderSide.none
                              ),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(200.0),
                                  borderSide: BorderSide(color: Theme.of(context).primaryColor)
                              ),
                              errorBorder: const OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(200.0)),
                                  borderSide: BorderSide(
                                    width: 1,
                                    color: Colors.red,
                                  )),
                              focusedErrorBorder: const OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                    Radius.circular(200.0)),
                                borderSide: BorderSide(
                                  width: 1,
                                  color: Colors.red,
                                ),
                              ),

                              contentPadding:
                              const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 5),

                            ),
                            keyboardType: TextInputType.text,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            children: [
                              CountryCodePicker(
                                onChanged: (element) {
                                  county_code = element.dialCode!;
                                },
                                initialSelection: 'US',
                                showCountryOnly: false,
                                showOnlyCountryWhenClosed: false,
                                alignLeft: false,
                              ),
                              TextFormField(
                                obscureText: !_passwordVisible,
                                autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                                validator: (value) {
                                  if (value!.length < 6) {
                                    return 'Invalid phone, too short';
                                  }
                                  return null;
                                },
                                onSaved: (value) {
                                  userData["phone"] = value ??= "";
                                },
                                onChanged: (value) =>
                                userData['phone'] = value,
                                focusNode: nameFocusNode,
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Theme.of(context).backgroundColor,
                                  labelText: 'Phone',
                                  labelStyle: TextStyle(
                                      color: nameFocusNode.hasFocus
                                          ? Theme.of(context).primaryColor
                                          : Colors.black),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(200.0),
                                      borderSide: BorderSide.none
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(200.0),
                                      borderSide: BorderSide.none
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(200.0),
                                      borderSide: BorderSide(color: Theme.of(context).primaryColor)
                                  ),
                                  errorBorder: const OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(200.0)),
                                      borderSide: BorderSide(
                                        width: 1,
                                        color: Colors.red,
                                      )),
                                  focusedErrorBorder: const OutlineInputBorder(
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(200.0)),
                                    borderSide: BorderSide(
                                      width: 1,
                                      color: Colors.red,
                                    ),
                                  ),
                                  contentPadding:
                                  const EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 5),

                                ),
                                keyboardType: TextInputType.number,
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          TextFormField(
                            autovalidateMode:
                            AutovalidateMode.onUserInteraction,
                            validator: (value) {
                              if (value! == '') {
                                return "email field can't be empty";
                              }

                              if (!EmailValidator.validate(value)) {
                                return "Please enter a valid email";
                              }

                              final RegExp regex = RegExp(
                                  r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');
                              // RegExp regex = new RegExp(pattern);
                              if (!regex.hasMatch(value)) {
                                return "Please enter a valid email";
                              }
                            },
                            onSaved: (value) {
                              userData["email"] = value ??= "";
                            },
                            onChanged: (value) =>
                            userData['email'] = value,
                            focusNode: emailFocusNode,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Theme.of(context).backgroundColor,
                              labelText: 'Email',
                              labelStyle: TextStyle(
                                  color: emailFocusNode.hasFocus
                                      ? Theme.of(context).primaryColor
                                      : Colors.black),
                              border: const OutlineInputBorder(
                                  borderSide: BorderSide.none
                              ),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius:
                                  BorderRadius.circular(200.0),
                                  borderSide: BorderSide.none),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius:
                                  BorderRadius.circular(200.0),
                                  borderSide:  BorderSide(
                                      color: Theme.of(context).primaryColor,
                                      width: 1)),
                              errorBorder: const OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(10.0)),
                                  borderSide: BorderSide(
                                    width: 1,
                                    color: Colors.red,
                                  )),
                              focusedErrorBorder: const  OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                    Radius.circular(100.0)),
                                borderSide: BorderSide(
                                  width: 1,
                                  color: Colors.red,
                                ),
                              ),
                              contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 5),
                            ),
                            keyboardType: TextInputType.emailAddress,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          TextFormField(
                            obscureText: !_passwordVisible,
                            autovalidateMode:
                            AutovalidateMode.onUserInteraction,
                            validator: (value) {
                              if (value!.length < 6) {
                                return 'Password is too short';
                              }
                              return null;
                            },
                            onSaved: (value) {
                              userData["password"] = value ??= "";
                            },
                            onChanged: (value) =>
                            userData['password'] = value,
                            focusNode: passwordFocusNode,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Theme.of(context).backgroundColor,
                              labelText: 'Password',
                              labelStyle: TextStyle(
                                  color: passwordFocusNode.hasFocus
                                      ? Theme.of(context).primaryColor
                                      : Colors.black),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(200.0),
                                  borderSide: BorderSide.none
                              ),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(200.0),
                                  borderSide: BorderSide.none
                              ),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(200.0),
                                  borderSide: BorderSide(color: Theme.of(context).primaryColor)
                              ),
                              errorBorder: const OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(200.0)),
                                  borderSide: BorderSide(
                                    width: 1,
                                    color: Colors.red,
                                  )),
                              focusedErrorBorder: const OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                    Radius.circular(200.0)),
                                borderSide: BorderSide(
                                  width: 1,
                                  color: Colors.red,
                                ),
                              ),

                              contentPadding:
                              const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 5),
                              suffixIcon: IconButton(
                                icon: _passwordVisible
                                    ?  Icon(
                                  // Based on passwordVisible state choose the icon
                                  Icons.visibility,
                                  color: Theme.of(context).primaryColor,
                                )
                                    : const Icon(
                                  Icons.visibility_off,
                                  color: Color(0xff000000),
                                ),
                                onPressed: () {
                                  // Update the state i.e. toogle the state of passwordVisible variable
                                  setState(() {
                                    _passwordVisible =
                                    !_passwordVisible;
                                  });
                                },
                              ),
                            ),
                            keyboardType: TextInputType.visiblePassword,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          TextFormField(
                            obscureText: !_passwordVisible,
                            autovalidateMode:
                            AutovalidateMode.onUserInteraction,
                            validator: (value) {
                              if (value!.length < 6) {
                                return 'Invalid confirmation';
                              }
                              return null;
                            },
                            onSaved: (value) {
                              userData["confirm_password"] = value ??= "";
                            },
                            onChanged: (value) =>
                            userData['confirm_password'] = value,
                            focusNode: confirmPasswordFocusNode,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Theme.of(context).backgroundColor,
                              labelText: 'Confirm Password',
                              labelStyle: TextStyle(
                                  color: confirmPasswordFocusNode.hasFocus
                                      ? Theme.of(context).primaryColor
                                      : Colors.black),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(200.0),
                                  borderSide: BorderSide.none
                              ),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(200.0),
                                  borderSide: BorderSide.none
                              ),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(200.0),
                                  borderSide: BorderSide(color: Theme.of(context).primaryColor)
                              ),
                              errorBorder: const OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(200.0)),
                                  borderSide: BorderSide(
                                    width: 1,
                                    color: Colors.red,
                                  )),
                              focusedErrorBorder: const OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                    Radius.circular(200.0)),
                                borderSide: BorderSide(
                                  width: 1,
                                  color: Colors.red,
                                ),
                              ),

                              contentPadding:
                              const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 5),
                              suffixIcon: IconButton(
                                icon: _confirmPasswordVisible
                                    ?  Icon(
                                  // Based on passwordVisible state choose the icon
                                  Icons.visibility,
                                  color: Theme.of(context).primaryColor,
                                )
                                    : const Icon(
                                  Icons.visibility_off,
                                  color: Color(0xff000000),
                                ),
                                onPressed: () {
                                  // Update the state i.e. toogle the state of passwordVisible variable
                                  setState(() {
                                    _confirmPasswordVisible =
                                    !_confirmPasswordVisible;
                                  });
                                },
                              ),
                            ),
                            keyboardType: TextInputType.visiblePassword,
                          ),

                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 20.0),
                            child: TextButton(
                              style: ButtonStyle(
                                  padding: MaterialStateProperty.all<EdgeInsets>(
                                      const EdgeInsets.only(
                                          top: 10.0,
                                          left: 110,
                                          right: 110,
                                          bottom: 10)),
                                  shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30.0),
                                  )),
                                  backgroundColor:
                                  MaterialStateProperty.all(Color(0xff330072))),
                              onPressed: Authenticate.onVerifyPhone(
                                context,
                                userData['phone'],
                                userData
                              ),
                              child: Text("Sign Up",
                                style: Theme.of(context).textTheme.headline5,),
                            ),
                          ),

                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const Text(
                                  "Already have an account ? ",
                                  style: TextStyle(
                                    fontSize: 14,

                                  ),
                                ),
                                TextButton(
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  Login()));
                                    },
                                    child: Text(
                                      "Login",
                                      style: TextStyle(
                                          color: Theme.of(context)
                                              .primaryColor,
                                          decoration:
                                          TextDecoration.underline,
                                          fontFamily: 'Poppins',
                                          fontStyle: FontStyle.normal,
                                          fontSize: 15,
                                          fontWeight: FontWeight.w500),
                                    ))
                              ],
                            ),
                          ),

                          Center(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 10.0),
                              child: Row(
                                children: [
                                  Expanded(
                                      child: Divider(
                                        color: Theme.of(context).primaryColor,
                                      )
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(horizontal : 5.0),
                                    child: Text(
                                        "OR ",
                                        style: Theme.of(context).textTheme.headline1
                                    ),
                                  ),
                                  Expanded(
                                      child: Divider(
                                        color: Theme.of(context).primaryColor,
                                      )
                                  ),
                                ],
                              ),
                            ),
                          ),
                          // const Spacer(),



                        ],
                      )),
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5.0),
                  child: TextButton(
                    style: ButtonStyle(
                      padding: MaterialStateProperty.all<EdgeInsets>(
                          const EdgeInsets.only(
                              top: 10,
                              left: 105,
                              right: 105,
                              bottom:10)),
                      backgroundColor:
                      MaterialStateProperty.all(Color(0xffffffff)),
                      shape: MaterialStateProperty.all<
                          RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0),
                              side: const BorderSide(
                                  width: 1, color: Color(0xff330072)))),
                    ),
                    onPressed: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SignUp()),
                      );
                    },
                    child: Text("Sign Up with Google",
                      style: Theme.of(context).textTheme.headline6,),

                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
