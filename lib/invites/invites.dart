import 'package:flutter/material.dart';
import 'package:incheg_events/helpers/utils.dart';

class Invites extends StatefulWidget {
  const Invites({Key? key}) : super(key: key);

  @override
  State<Invites> createState() => _InvitesState();
}

class _InvitesState extends State<Invites> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  Utils.appBar(context, "Your Events"),
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
