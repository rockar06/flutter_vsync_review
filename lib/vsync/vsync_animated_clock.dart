import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_vsync_review/raw/second_screen.dart';

import '../clock_widget.dart';

class VsyncAnimatedClock extends StatefulWidget {
  @override
  _VsyncAnimatedClockState createState() => _VsyncAnimatedClockState();
}

class _VsyncAnimatedClockState extends State<VsyncAnimatedClock>
    with SingleTickerProviderStateMixin {
  Ticker _ticker;
  DateTime _startTime;
  DateTime _currentTime;

  @override
  void initState() {
    super.initState();
    _startTime = _currentTime = DateTime.now();
    _ticker = createTicker((elapsed) {
      setState(() {
        _currentTime = _startTime.add(elapsed);
      });
    });
    _ticker.start();
  }

  @override
  void dispose() {
    _ticker.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Vsync Animated Clock'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: ClockWidget(
                dateTime: _currentTime,
              ),
            ),
            RaisedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SecondScreen(),
                  ),
                );
              },
              child: const Text('Go to next screen'),
            )
          ],
        ),
      ),
    );
  }
}
