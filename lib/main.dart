import 'package:flutter/material.dart';
import 'package:flutter_vsync_review/raw/manual_animated_clock.dart';
import 'package:flutter_vsync_review/vsync/vsync_animated_clock.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Vsync Sample'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RaisedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ManualAnimatedClock(),
                  ),
                );
              },
              child: const Text('Manual Animated Clock'),
            ),
            SizedBox(
              height: 32,
            ),
            RaisedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => VsyncAnimatedClock(),
                  ),
                );
              },
              child: const Text('Vsync Animated Clock'),
            ),
          ],
        ),
      ),
    );
  }
}
