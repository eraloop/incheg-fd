import 'package:flutter/material.dart';
import 'package:incheg_events/helpers/utils.dart';
class Listings extends StatefulWidget {
  const Listings({Key? key}) : super(key: key);

  @override
  State<Listings> createState() => _ListingsState();
}

class _ListingsState extends State<Listings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Utils.appBar(context, "Events around you"),
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
