import 'package:flutter/material.dart';
import 'package:incheg_events/helper/app_utils.dart';
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
    ThemeData theme = Theme.of(context);

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          // toolbarHeight: 60,
          title: Center(
            child: Text(
              "Incheg",
              textAlign: TextAlign.center,
              style: Theme
                  .of(context)
                  .textTheme
                  .headline1,

            ),
          ),
        ),
        backgroundColor: Colors.white,
        body: Container(
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: PageView.builder(
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
                        // Image.asset(
                        //   "content[i].image",
                        //   width: double.infinity,
                        // ),
                        Container(
                          margin: const EdgeInsets.only(bottom: 20),
                          height: 350,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Theme.of(context).backgroundColor,
                            borderRadius: BorderRadius.all(Radius.circular(20))
                          ),
                        ),

                        Container(
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
                            height: 50,
                            child: Stack(
                              clipBehavior: Clip.none,
                              children: [
                                if(currentIndex == 2) ...[
                                  Positioned(
                                      right: 0,
                                      bottom: 0,
                                      child: InkWell(
                                        onTap: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(builder: (context) => HomeAuth()),
                                                 );
                                        },
                                        child: Container(
                                          height: 50,
                                          child: Center(
                                            child: Text("FINISH", style: theme.textTheme.headline4
                                                ?.copyWith(fontWeight: FontWeight.w600, fontSize: 15),),
                                          ),
                                        ),
                                      )
                                  )
                                ],
                                Container(
                                  alignment: Alignment.center,
                                  height: double.infinity,
                                  child: Center(
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        buildDot(currentIndex == 0, currentIndex > 0),
                                        const SizedBox(width: 18,),
                                        buildDot(currentIndex == 1, currentIndex > 1),
                                        const SizedBox(width: 18,),
                                        buildDot(currentIndex == 2, currentIndex > 2),
                                      ],
                                    ),
                                  ),
                                ),

                              ],
                            )
                        ),
                      ],
                    )) ,
          ),
        ));
  }

  Widget buildDot(bool isActive, bool passed) {
    return Container(
        height: isActive ? 10 : 9,
        width: isActive ? 20 : 9,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: AppUtils.PrimaryColor),
          color: isActive ? Theme
              .of(context)
              .primaryColor : Colors.white,)
    );
  }
}
