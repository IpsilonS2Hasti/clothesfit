import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:sensors_plus/sensors_plus.dart';

import '../inclination/inclinometer.dart';

class PitchGuage extends StatefulWidget {
  PitchGuage({Key? key}) : super(key: key);

  final Stream<double> stream = Inclinometer().pitch.stream;

  @override
  State<PitchGuage> createState() => _PitchGuageState();
}

class _PitchGuageState extends State<PitchGuage> {
  StreamSubscription? _subscription;
  double _degrees = 30;

  void initState() {
    super.initState();

    _subscription = widget.stream.listen(
      (d) => setState(
        () => _degrees = d,
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _subscription?.cancel();
  }

  @override
  Widget build(BuildContext context) {
    print(_degrees);
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Stack(
        children: [
          Container(
            color: Colors.black,
            height: 75,
            width: 2,
            margin: EdgeInsets.only(left: 10),
          ),
          Container(
            color: Colors.blue,
            height: 2,
            width: 20,
            margin: EdgeInsets.only(
                top: _degrees < 0
                    ? negativeVals(35 + _degrees.abs())
                    : positiveVals(35 - _degrees)),
          ),
        ],
      ),
    );
  }
}

double positiveVals(double a) {
  if (a > 0) return a;
  return 0;
}

double negativeVals(double a) {
  if (a >= 75) return 75;
  return a;
}
