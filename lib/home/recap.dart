import 'package:flutter/material.dart';
import 'package:incheg_events/helpers/utils.dart';
class Recap extends StatefulWidget {
  const Recap({Key? key}) : super(key: key);

  @override
  State<Recap> createState() => _RecapState();
}

class _RecapState extends State<Recap> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Utils.appBar(context, "Recap"),
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