import 'package:flutter/material.dart';
import 'package:incheg_events/home_nav.dart';
import 'package:incheg_events/onboarding/auth/login.dart';
import 'package:incheg_events/onboarding/auth/signup.dart';
class HomeAuth extends StatelessWidget {
  const HomeAuth({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: TextButton(onPressed: (){
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => HomeNav()),
                      (route) => false);
            }, child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text("Skip",
                style: Theme.of(context).textTheme.headline6,),
                Icon(Icons.double_arrow,
                  size: 20,
                  color: Theme.of(context).primaryColor,),
              ],
            )),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 0.0),
                child: FittedBox(
                  child: Image.asset("assets/images/logo_blue.png",
                    fit: BoxFit.cover,
                    height: 40,
                    // width: 40,
                  ),
                ),
              ),
              const Padding(
                padding:  EdgeInsets.only(top: 10.0, bottom: 50),
                child: Text('Incheg events',
                  style: TextStyle(
                      color: Color(0xff330073),
                      fontFamily: 'Nexa',
                      fontStyle: FontStyle.normal,
                      fontSize: 30,
                      fontWeight: FontWeight.w900),),
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 20),
                height: 300,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Theme.of(context).backgroundColor,
                    borderRadius: BorderRadius.all(Radius.circular(20))
                ),
              ),
              const SizedBox(
                height: 50,
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
                padding: const EdgeInsets.symmetric(vertical: 5.0),
                child: TextButton(
                  style: ButtonStyle(
                    padding: MaterialStateProperty.all<EdgeInsets>(
                        const EdgeInsets.only(
                            top: 8,
                            left: 100,
                            right: 100,
                            bottom: 8)),
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
                  child: Text("Sign Up",
                    style: Theme.of(context).textTheme.headline6,),

                ),
              )
            ],
          ),
        ),
      )
    );
  }
}
