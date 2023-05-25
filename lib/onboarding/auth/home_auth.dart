import 'package:flutter/material.dart';
import 'package:incheg_events/home_nav.dart';
import 'package:incheg_events/onboarding/auth/login.dart';
import 'package:incheg_events/onboarding/auth/signup.dart';
import 'package:scroll_snap_list/scroll_snap_list.dart';

class HomeAuth extends StatefulWidget {
  const HomeAuth({Key? key}) : super(key: key);

  @override
  State<HomeAuth> createState() => _HomeAuthState();
}

class _HomeAuthState extends State<HomeAuth> {
  ScrollController _controller = ScrollController();

  List<String> items = [
  //  fill with party images
    "assets/images/michael-discenza-MxfcoxycH_Y-unsplash.jpg",
    "assets/images/michael-discenza-MxfcoxycH_Y-unsplash.jpg",
    "assets/images/michael-discenza-MxfcoxycH_Y-unsplash.jpg",
    "assets/images/michael-discenza-MxfcoxycH_Y-unsplash.jpg",
    "assets/images/michael-discenza-MxfcoxycH_Y-unsplash.jpg",
    "assets/images/michael-discenza-MxfcoxycH_Y-unsplash.jpg",
    "assets/images/michael-discenza-MxfcoxycH_Y-unsplash.jpg",
  ];
  int _focusedIndex = 0;

  double _calculateItemSize(int index) {
    return 100 + (index % 3) * 20; // Example calculation based on the index
  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.symmetric(vertical: 50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
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
              ),


              Container(
                margin: EdgeInsets.symmetric(vertical: 50),
                height: 350,
                child: ScrollSnapList(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  curve: Curves.ease,
                  onItemFocus: (index) {
                    setState(() {
                      _focusedIndex = index;
                    });
                  },
                  dynamicItemOpacity: 0.8,
                  itemSize: 350,
                  itemCount: items.length,
                  dynamicItemSize: true,
                  itemBuilder: (BuildContext context, int index){
                    final itemSize = _calculateItemSize(index);
                    return GestureDetector(
                      onTap: (){},
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.asset( items[index],
                          height: itemSize,
                          width: 280,
                          fit: BoxFit.cover,
                        ),
                      ),
                    );
                  },

                  // dynamicSizeEquation: customEquation, //optional
                ),
              ),


              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
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
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                child: TextButton(
                  style: ButtonStyle(
                    padding: MaterialStateProperty.all<EdgeInsets>(
                        const EdgeInsets.only(
                            top: 8,
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
              ),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Row(
                  children: [
                    Expanded(
                      child: Divider(
                        thickness: 1,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Text("OR",
                      style: Theme.of(context).textTheme.headline6,),
                    ),

                    Expanded(
                      child: Divider(
                        thickness: 1,
                        color: Theme.of(context).primaryColor,

                      ),
                    ),
                  ],
                ),
              ),

              TextButton(
                  onPressed: (){
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => HomeNav()),
                        (route) => false);
              }, child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Skip for now ",
                    style: Theme.of(context).textTheme.headline6,),
                  Icon(Icons.double_arrow,
                    size: 20,
                    color: Theme.of(context).primaryColor,),
                ],
              ))
            ],
          ),
        ),
      )
    );
  }
}
