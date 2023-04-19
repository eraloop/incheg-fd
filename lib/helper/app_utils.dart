import "package:flutter/material.dart";
import "package:fluttertoast/fluttertoast.dart";

class AppUtils {
  static Color PrimaryLight = Color(0xffEAE3E8);
  static Color PrimaryColor = Color(0xff330072);
  static Color YellowColor = Color(0xffFEDD1F);
  static Color Secondary = Color(0xFF696969);

  static showToast(BuildContext context, Color color, String message) {
    return Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 3,
        backgroundColor: color,
        textColor: Colors.white,
        fontSize: 14.0
    );
  }

  static showProgressDialog(BuildContext context) {
    showDialog(
        context: context,
        barrierDismissible: true,
        builder: (context) {
          return Container(
              color: Theme.of(context).backgroundColor,
              child: Center(
                child: SizedBox(
                  width: 50,
                  height: 50,
                  child: CircularProgressIndicator(
                    backgroundColor: Theme.of(context).backgroundColor,
                    color: Theme.of(context).primaryColor,
                    strokeWidth: 4,
                    // value: 0.4,
                  ),
                ),
              ));
        });
  }

}