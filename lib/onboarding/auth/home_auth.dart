import 'dart:async';

import 'package:flutter/material.dart';
import 'package:incheg_events/helpers/utils.dart';
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
  final ScrollController _scrollController = ScrollController();
  Timer? _scrollTimer;
  bool _isScrolling = false;

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

  // double _calculateItemSize(int index) {
  //   return (index % 3) * 20;
  // }

  void _startScrolling() {
    _scrollTimer?.cancel();
    _scrollTimer = Timer.periodic(Duration(seconds: 3), (timer) {
      if (!_isScrolling) {
        _scrollController.animateTo(
          _scrollController.position.pixels + 350,
          duration: Duration(milliseconds: 500),
          curve: Curves.ease,
        );
      }
    });
  }

  @override
  void initState() {
    super.initState();
    _startScrolling();
  }

  @override
  void dispose() {
    _scrollTimer?.cancel();
    _scrollController.dispose();
    super.dispose();
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
              Utils.logo(),

              Container(
                height: 400,
                child: NotificationListener<ScrollNotification>(
                  onNotification: (notification) {
                    if (notification is ScrollStartNotification) {
                      setState(() {
                        _isScrolling = true;
                      });
                    } else if (notification is ScrollEndNotification) {
                      setState(() {
                        _isScrolling = false;
                      });
                    }
                    return true;
                  },
                  child: ScrollSnapList(
                    listController: _scrollController,
                    curve: Curves.bounceIn,
                    padding: const EdgeInsets.symmetric(horizontal: 0.0),
                    margin: const EdgeInsets.symmetric(horizontal: 0.0),
                    duration: 500,
                    shrinkWrap: true,
                    updateOnScroll: true,
                    onItemFocus: (index) {
                      setState(() {
                        _focusedIndex = index;
                      });
                    },
                    dynamicItemOpacity: 0.8,
                    itemSize: 280,
                    itemCount: items.length * 5,
                    dynamicItemSize: true,
                    itemBuilder: (BuildContext context, int index){
                      final itemIndex = index % items.length;
                      return GestureDetector(
                        onTap: (){
                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(builder: (context) => Login()),
                          // );
                        },
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Container(
                            alignment: Alignment.bottomCenter,
                            width: 280,
                            height: 280,
                            padding: const EdgeInsets.all(20),
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                opacity: 0.9,
                                image: AssetImage(items[itemIndex]),
                                fit: BoxFit.cover,
                              ),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      height: 50,
                                      width: 50,
                                      child: ClipOval(
                                        child: Image.asset("assets/images/michael-discenza-MxfcoxycH_Y-unsplash.jpg",
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: 10,),
                                    Column(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text("Party Name",
                                          textAlign: TextAlign.start,
                                          style: Theme.of(context).textTheme.headline5!.copyWith(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Text("Owner",
                                          textAlign: TextAlign.start,
                                          style: Theme.of(context).textTheme.bodyText1!.copyWith(
                                            color: Colors.white,
                                          ),
                                        )
                                      ],
                                    )
                                  ],
                                ),

                              ],
                            ),

                          )

                        ),
                      );
                    },
                  ),
                ),
              ),

              ListView(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                children: [
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

            ],
          ),
        ),
      )
    );
  }
}
