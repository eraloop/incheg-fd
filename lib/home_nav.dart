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
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: _currentIndex,
          iconSize: 28,
          elevation: 0,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          // backgroundColor: Color(0xff790252),
          selectedItemColor: Theme.of(context).primaryColor,
          unselectedItemColor: Theme.of(context).unselectedWidgetColor,
          onTap: (value) {
            // Respond to item press.
            setState(() => _currentIndex = value);
          },
          items: [
            for (final tabItem in TabNavigationItem.items) tabItem.tab,
          ],
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
      page: Recap(),
      tab: BottomNavigationBarItem(
        label: "",
        icon: Padding(
          child: Icon(Icons.home_outlined),
          padding: EdgeInsets.only(top: 5),
        ),
      ),
    ),
    TabNavigationItem(
      page: Invites(),
      tab: BottomNavigationBarItem(
        label: "",
        icon: Padding(
          child: Icon(Icons.email_outlined),
          padding: EdgeInsets.only(top: 5),
        ),
      ),
    ),

    TabNavigationItem(
      page: CreateEvent(),
      tab: BottomNavigationBarItem(
        label: "",
        icon: Container(
          height: 40,
          width: 40,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(300),
              border: Border.all(
                  width: 1,
                  color: Color(0xff62BAAC)
              )
          ),
          child: Icon(Icons.add,
              color:  Color(0xff62BAAC)
          ),
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