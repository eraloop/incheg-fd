import 'package:flutter/material.dart';
class Recap extends StatefulWidget {
  const Recap({Key? key}) : super(key: key);

  @override
  State<Recap> createState() => _RecapState();
}

class _RecapState extends State<Recap> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Text("Recap",
            style: Theme
                .of(context)
                .textTheme
                .headline1,),
        ),
      ),
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