import 'package:flutter/material.dart';

import '../clock_widget.dart';
import 'second_screen.dart';

class ManualAnimatedClock extends StatefulWidget {
  @override
  _ManualAnimatedClockState createState() => _ManualAnimatedClockState();
}

class _ManualAnimatedClockState extends State<ManualAnimatedClock> {
  var running = true;

  @override
  void initState() {
    super.initState();
    Future.doWhile(() async {
      setState(() {});
      await Future.delayed(const Duration(microseconds: 50));
      return running;
    });
  }

  @override
  void dispose() {
    running = false;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Manual Animated Clock'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: ClockWidget(
                dateTime: DateTime.now(),
              ),
            ),
            RaisedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SecondScreen()));
              },
              child: const Text('Go to next screen'),
            )
          ],
        ),
      ),
    );
  }
}
