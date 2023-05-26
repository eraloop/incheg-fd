import 'package:flutter/material.dart';
import 'package:incheg_events/create_event.dart';
import 'package:incheg_events/home/recap.dart';
import 'package:incheg_events/invites/invites.dart';
import 'package:incheg_events/listings/listings.dart';
import 'package:incheg_events/profile/profile.dart';

class HomeNav extends StatefulWidget {
  const HomeNav({Key? key}) : super(key: key);
  @override
  State<HomeNav> createState() => _HomeNavState();
}
class _HomeNavState extends State<HomeNav> {
  bool selectFilter = false;
  bool show_filter = false;
  static int _currentIndex = 0;
  var token;

  @override
  Widget build(BuildContext context) {
    print(token);
    return Scaffold(
        resizeToAvoidBottomInset: false,
        extendBody: true,
        body: IndexedStack(
          index: _currentIndex,
          children: [
            for (final tabItem in TabNavigationItem.items) tabItem.page,
          ],
        ),
        floatingActionButton: TextButton(
          onPressed: () {
            setState(() {
              _currentIndex = 2;
            });
          },
          child: Container(
            height: 55,
            width: 55,
            decoration: BoxDecoration(
              color: _currentIndex == 2 ? Theme.of(context).primaryColor : Color(0xff007333),
              borderRadius: BorderRadius.circular(300),
            ),
            child: const Icon(Icons.add,
                color:  Color(0xffffffff)
            ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
            bottomNavigationBar: BottomAppBar(
              elevation: 0,
              shape: CircularNotchedRectangle(),
              notchMargin: 10,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                height: 60,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    MaterialButton(
                      minWidth: 40,
                      onPressed: () {
                        setState(() {
                          _currentIndex = 0;
                        });
                      },
                      child: Icon(
                        _currentIndex == 0 ? Icons.home : Icons.home_outlined,
                        size: 30,
                        color: _currentIndex == 0 ? Theme.of(context).primaryColor : Theme.of(context).unselectedWidgetColor,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 45.0),
                      child: MaterialButton(
                        minWidth: 40,
                        onPressed: () {
                          setState(() {
                            _currentIndex = 1;
                          });
                        },
                        child: Icon(
                          size: 30,
                          _currentIndex == 1 ? Icons.email : Icons.email_outlined,
                          color: _currentIndex == 1 ? Theme.of(context).primaryColor : Theme.of(context).unselectedWidgetColor,
                        ),
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.only(left: 45.0),
                      child: MaterialButton(
                        minWidth: 40,
                        onPressed: () {
                          setState(() {
                            _currentIndex = 3;
                          });
                        },
                        child: Icon(
                          size: 30,
                          Icons.line_weight_sharp,
                          color: _currentIndex == 3 ? Theme.of(context).primaryColor : Theme.of(context).unselectedWidgetColor,
                        ),
                      ),
                    ),
                    MaterialButton(
                      minWidth: 40,
                      onPressed: () {
                        setState(() {
                          _currentIndex = 4;
                        });
                      },

                    child:  Icon(
                      _currentIndex == 4 ? Icons.person : Icons.person_2_outlined,
                      size: 30,
                        color: _currentIndex == 4 ? Theme.of(context).primaryColor : Theme.of(context).unselectedWidgetColor,
                    )
                      )
                  ],
                ),
              ),
        )
    );
  }
}

class TabNavigationItem {
  final BottomNavigationBarItem tab;
  final Widget page;
  TabNavigationItem({
    required this.page,
    required this.tab,
  });
  static List<TabNavigationItem> get items => [
    TabNavigationItem(
      page: const Recap(),
      tab: const BottomNavigationBarItem(
        label: "",
        icon: Padding(
          child: Icon(Icons.home_outlined),
          padding: EdgeInsets.only(top: 5),
        ),
      ),
    ),
    TabNavigationItem(
      page: const Invites(),
      tab: const BottomNavigationBarItem(
        label: "",
        icon: Padding(
          child: Icon(Icons.email_outlined),
          padding: EdgeInsets.only(top: 5),
        ),
      ),
    ),

    TabNavigationItem(
      page: const CreateEvent(),
      tab: const  BottomNavigationBarItem(
        label: "",
        icon: Padding(
          padding: EdgeInsets.only(top: 5),
        ),
      ),
    ),

    TabNavigationItem(
      page: Listings(),
      tab: BottomNavigationBarItem(
        label: "",
        icon: Padding(
          child: Icon(Icons.line_weight_sharp),
          padding: EdgeInsets.only(top: 5),
        ),
      ),
    ),
    TabNavigationItem(
      page: Profile(),
      tab: BottomNavigationBarItem(
        label: "",
        icon: Padding(
          child: Icon(Icons.person_2_outlined),
          padding: EdgeInsets.only(top: 5),
        ),
      ),
    ),

  ];
}