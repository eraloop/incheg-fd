import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:incheg_events/helpers/utils.dart';
class ForgotPassword extends StatefulWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  FocusNode passwordFocusNode = FocusNode();
  FocusNode confirmPasswordFocusNode = FocusNode();
  FocusNode emailFocusNode = FocusNode();
  bool _passwordVisible = false;
  bool _confirmPasswordVisible = false;

  Map<String, dynamic> formData = {
    "email": '',
    "password": '',
    "confirm_password": ''
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        shrinkWrap: true,
        children: [
          Utils.logo(),
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
              labelText: 'New Password',
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
                    : Icon(
                  Icons.visibility_off,
                  color: Theme.of(context).primaryColor,
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
            height: 30,
          ),
          TextFormField(
            obscureText: !_confirmPasswordVisible,
            autovalidateMode:
            AutovalidateMode.onUserInteraction,
            validator: (value) {
              if (value!.length < 6) {
                return 'Confirm password is too short';
              }
              return null;
            },
            onSaved: (value) {
              formData["confirm_password"] = value ??= "";
            },
            onChanged: (value) =>
            formData['confirm_password'] = value,
            focusNode: passwordFocusNode,
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
                    : Icon(
                  Icons.visibility_off,
                  color: Theme.of(context).primaryColor,
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
            padding: const EdgeInsets.symmetric(vertical: 30.0),
            child: TextButton(
              style: ButtonStyle(
                  padding: MaterialStateProperty.all<EdgeInsets>(
                      const EdgeInsets.only(
                          top: 10.0,
                          bottom: 10)),
                  shape: MaterialStateProperty.all<
                      RoundedRectangleBorder>(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  )),
                  backgroundColor:
                  MaterialStateProperty.all(Color(0xff330072))),
              onPressed: (){
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(builder: (context) => HomeNav()),
                // );
              },
              child: Text("Login",
                style: Theme.of(context).textTheme.headline5,),

            ),
          ),
        ],
      ),
    );
  }
}
