import "package:flutter/material.dart";
import "package:fluttertoast/fluttertoast.dart";

class Utils {
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

  static Widget logo(){
    return Container(
      constraints: const BoxConstraints(
          maxHeight: 100
      ),
      padding: const EdgeInsets.symmetric(vertical: 30.0),
      child: FittedBox(
        child: Image.asset("assets/images/logo_blue.png",
          fit: BoxFit.cover,
          height: 35,
          // width: 40,
        ),
      ),
    );
  }

  static AppBar appBar(BuildContext context, String title){
    return AppBar(
    automaticallyImplyLeading: false,
    backgroundColor: Colors.transparent,
    elevation: 0,
      title: Text(title,
        style: TextStyle(
            color: Theme.of(context).primaryColor,
            fontFamily: 'Nexa',
            fontStyle: FontStyle.normal,
            fontSize: 20,
            fontWeight: FontWeight.w900),
      ),
      actions: [
        MaterialButton(
            minWidth: 40,
            onPressed: () {
            },
            child:  Icon(
              Icons.notifications_none ,
              size: 30,
              color: Theme.of(context).primaryColor ,
            )
        )
      ],

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