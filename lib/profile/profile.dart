import 'package:flutter/material.dart';
import 'package:incheg_events/helpers/utils.dart';
class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Utils.appBar(context, "Profile"),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [

            ],
          ),
        ),
      ),
    );
  }
}
