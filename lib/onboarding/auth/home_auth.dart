import 'package:flutter/material.dart';
class HomeAuth extends StatelessWidget {
  const HomeAuth({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 100.0),
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
              // const Spacer(),
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
                    onPressed: (){},
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
                  onPressed: (){},
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
