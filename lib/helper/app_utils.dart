import "package:flutter/material.dart";

class AppUtils {
  static Color PrimaryLight = Color(0xffEAE3E8);
  static Color PrimaryColor = Color(0xff330072);
  static Color YellowColor = Color(0xffFEDD1F);
  static Color Secondary = Color(0xFF696969);

  showProgressDialog(BuildContext context) {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return Container(
              color: Theme.of(context).backgroundColor,
              child:const Center(
                child: SizedBox(
                  width: 50,
                  height: 50,
                  child: CircularProgressIndicator(
                    backgroundColor: Color(0xffFEDD1F),
                    strokeWidth: 4,
                    // value: 0.4,
                  ),
                ),
              ));
        });

  }
}