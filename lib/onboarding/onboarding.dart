import 'package:flutter/material.dart';
import 'package:incheg_events/helpers/utils.dart';
import 'package:incheg_events/onboarding/auth/home_auth.dart';
class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  var currentIndex = 0;
  var previousIndex = 0;

  late PageController _controller;

  @override
  void initState() {
    _controller = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double imageHeight = screenHeight * 0.6;

    return Scaffold(
        body: PageView.builder(
            controller: _controller,
            itemCount: 3,
            onPageChanged: (int i) {
              setState(() {
                previousIndex = currentIndex;
                currentIndex = i;
              });
            },
            itemBuilder: (context, i) =>
                Container(
                    child:  Column(
                      children: <Widget>[
                        Container(
                          margin: const EdgeInsets.only(bottom: 20),
                          height: imageHeight,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Theme.of(context).backgroundColor,
                            // borderRadius: BorderRadius.all(Radius.circular(20))
                          ),
                          child: Image.asset("assets/images/jakob-owens-qoFQxxuk3QY-unsplash.jpg",
                            fit: BoxFit.cover,
                          ),
                        ),


                        Container(
                          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                          alignment: Alignment.topCenter,
                          width: double.infinity,
                          // height: phoneHeight * 0.1,
                          child: Text(
                            "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. ",
                            style: Theme
                                .of(context)
                                .textTheme
                                .bodyText1?.copyWith(color: Colors.black54, fontWeight: FontWeight.w500),
                            textAlign: TextAlign.center,
                          ),
                        ),

                        const Spacer(),
                        Container(
                            width: double.infinity,
                            height: 100,
                            child: Stack(
                              clipBehavior: Clip.none,
                              children: [
                                Container(
                                  margin: EdgeInsets.only(bottom: 20),
                                  padding: EdgeInsets.symmetric(horizontal: 30),
                                  alignment: Alignment.center,
                                  height: double.infinity,
                                  child: Row(
                                    // mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                     Container(
                                       child: Row(
                                         children: [
                                           buildDot(currentIndex == 0, currentIndex > 0),
                                           const SizedBox(width: 18,),
                                           buildDot(currentIndex == 1, currentIndex > 1),
                                           const SizedBox(width: 18,),
                                           buildDot(currentIndex == 2, currentIndex > 2),
                                         ],
                                       ),
                                     ),
                                      TextButton(
                                        onPressed: () {
                                          if(currentIndex == 2){
                                            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomeAuth()));
                                          }
                                          else{
                                            _controller.animateToPage(currentIndex + 1, duration: Duration(milliseconds: 300), curve: Curves.easeIn);
                                          }
                                        },
                                        child: Container(
                                          height: 45,
                                          width: 45,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(100),
                                            color:  Utils.PrimaryColor,
                                          ),
                                            child: Icon(Icons.arrow_forward, color: Colors.white, size: 20,)),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            )
                        ),
                      ],
                    )) ,
          ),
    );
  }

  Widget buildDot(bool isActive, bool passed) {
    return Container(
        height: isActive ? 10 : 9,
        width: isActive ? 20 : 9,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Utils.PrimaryColor),
          color: isActive ? Theme
              .of(context)
              .primaryColor : Colors.white,)
    );
  }
}
