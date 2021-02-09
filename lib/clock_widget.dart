import 'dart:math';

import 'package:flutter/material.dart';

class ClockWidget extends StatelessWidget {
  const ClockWidget({
    Key key,
    @required this.dateTime,
  }) : super(key: key);

  final DateTime dateTime;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 210,
      height: 210,
      decoration: BoxDecoration(
        border: Border.all(width: 3, color: Colors.black),
        borderRadius: BorderRadius.circular(210),
      ),
      child: Stack(
        children: <Widget>[
          Positioned(
            top: 105,
            left: 100,
            child: Transform(
              alignment: Alignment.topCenter,
              transform: Matrix4.rotationZ(pi / 24 * 2 * dateTime.hour),
              child: Container(height: 50, width: 5, color: Colors.black),
            ),
          ),
          Positioned(
            top: 105,
            left: 100,
            child: Transform(
              alignment: Alignment.topCenter,
              transform: Matrix4.rotationZ(pi + pi / 60 * 2 * dateTime.minute),
              child: Container(height: 90, width: 5, color: Colors.grey),
            ),
          ),
          Positioned(
            top: 105,
            left: 101.5,
            child: Transform(
              alignment: Alignment.topCenter,
              transform: Matrix4.rotationZ(pi + pi / 60 * 2 * dateTime.second),
              child: Container(height: 90, width: 2, color: Colors.red),
            ),
          ),
        ],
      ),
    );
  }
}
