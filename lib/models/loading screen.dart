import 'package:flutter/material.dart';

class Widget0 extends StatelessWidget {
  const Widget0({Key? key}) : super (key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(
        color: Colors.orangeAccent,
        backgroundColor: Colors.blueGrey,
        value: 0.50,
      ),
    );
  }
}// CircularprogressIndicator
// Center