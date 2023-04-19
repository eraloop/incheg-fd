import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';
import 'package:incheg_events/helper/app_utils.dart';
import 'package:incheg_events/helper/session_mananger.dart';
import 'package:incheg_events/home_nav.dart';
import 'package:incheg_events/models/user.dart';
import 'package:incheg_events/onboarding/auth/home_auth.dart';
import 'package:incheg_events/onboarding/auth/signup.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final formKey = GlobalKey<FormState>();

  FocusNode passwordFocusNode = FocusNode();
  FocusNode emailFocusNode = FocusNode();
  bool _passwordVisible = false;
  bool remember_me = false;

  Map<String, dynamic> formData = {
    "email": '',
    "password": '',
  };
  onLogin() async {
    if (!formKey.currentState!.validate()) {
      return "form data invalid";
    }
    if (formKey.currentState != null) {
      formKey.currentState!.save();
    }



    AppUtils.showProgressDialog(context);
    final response = await  User.login(formData);
    final data = json.decode(response.body);
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
    }else if(response.statusCode == 500){
      //server error
      Navigator.of(context, rootNavigator: true).pop();
      AppUtils.showToast(context, Colors.red, data['message']);
    }else{
      // something whe  wrong
      Navigator.of(context, rootNavigator: true).pop();
      AppUtils.showToast(context, Colors.red, 'Something when wrong');
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Container(
            margin: const EdgeInsets.only(top: 150),
            child: Column(
              // crossAxisAlignment: CrossAxisAlignment.stretch,
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: Text("Login",
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
                          formData["email"] = value ??= "";
                        },
                        onChanged: (value) =>
                        formData['email'] = value,
                        focusNode: emailFocusNode,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Theme.of(context).backgroundColor,
                          labelText: 'Email',
                          labelStyle: TextStyle(
                              color: passwordFocusNode.hasFocus
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
                      height: 30,
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
                        formData["password"] = value ??= "";
                      },
                      onChanged: (value) =>
                      formData['password'] = value,
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
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                           const Text(
                            "Don't have an account ? ",
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
                                            SignUp()));
                              },
                              child: Text(
                                "Sign up",
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
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5.0),
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
                          onPressed: (){
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => Login()),
                            );
                          },
                          child: Text("Login",
                            style: Theme.of(context).textTheme.headline5,),

                        ),
                      ),

                       Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: TextButton(
                          onPressed: (){

                          },
                          child: Text(
                            "Forgot password ? ",
                            style: Theme.of(context).textTheme.bodyText1
                          ),
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
                              left: 110,
                              right: 110,
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
                    child: Text("Login with Google",
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
