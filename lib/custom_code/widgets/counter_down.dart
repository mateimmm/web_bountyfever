// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'dart:async';
import 'package:intl/intl.dart';

class CounterDown extends StatefulWidget {
  const CounterDown({
    Key? key,
    this.width,
    this.height,
    required this.endTime,
    this.textColor,
    this.textStyle,
    this.fontSize,
    this.fontWeight,
  }) : super(key: key);

  final double? width;
  final double? height;
  final DateTime endTime;
  final Color? textColor;
  final TextStyle? textStyle;
  final double? fontSize;
  final FontWeight? fontWeight;

  @override
  State<CounterDown> createState() => _CounterDownState();
}

class _CounterDownState extends State<CounterDown> {
  late Timer _timer;
  late Duration _timeUntilEnd;

  @override
  void initState() {
    super.initState();
    _timeUntilEnd = widget.endTime.difference(DateTime.now());
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        _timeUntilEnd = widget.endTime.difference(DateTime.now());
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_timeUntilEnd.isNegative) {
      return Text(
        'Ended',
        style: widget.textStyle != null
            ? widget.textStyle!.copyWith(
                fontSize: widget.fontSize,
                fontWeight: widget.fontWeight,
              )
            : TextStyle(
                color: widget.textColor,
                fontSize: widget.fontSize ?? 12, // Default font size
                fontWeight: widget.fontWeight ??
                    FontWeight.normal, // Default font weight
              ),
      );
    }
    final days = _timeUntilEnd.inDays;
    final hours = _timeUntilEnd.inHours % 24;
    final minutes = _timeUntilEnd.inMinutes % 60;
    final seconds = _timeUntilEnd.inSeconds % 60;
    return Text(
      '$days days $hours hours $minutes minutes $seconds seconds',
      style: widget.textStyle != null
          ? widget.textStyle!.copyWith(
              fontSize: widget.fontSize,
              fontWeight: widget.fontWeight,
            )
          : TextStyle(
              color: widget.textColor,
              fontSize: widget.fontSize ?? 12, // Default font size
              fontWeight:
                  widget.fontWeight ?? FontWeight.normal, // Default font weight
            ),
    );
  }
}
