import 'package:flutter/material.dart';


class CountDownTimerNew extends StatefulWidget {
  const CountDownTimerNew({
    super.key,
    required this.targetDateTime,
    required this.whenTimeExpires,
    this.countDownFormatter,
    this.countDownTimerStyle,
  });

  final DateTime targetDateTime;
  final VoidCallback whenTimeExpires;
  final TextStyle? countDownTimerStyle;
  final Function(int seconds)? countDownFormatter;

  @override
  State createState() => _CountDownTimerNewState();
}

class _CountDownTimerNewState extends State<CountDownTimerNew> with TickerProviderStateMixin {
  late final AnimationController _controller;
  late final Duration duration;

  String get timerDisplayString {
    final duration = _controller.duration! * _controller.value;
    if (widget.countDownFormatter != null) {
      return widget.countDownFormatter!(duration.inSeconds) as String;
    } else {
      return formatHHMMSS(duration.inSeconds);
    }
  }

  String formatHHMMSS(int seconds) {
    final hours = (seconds / 3600).truncate();
    seconds = seconds % 3600;
    final minutes = (seconds / 60).truncate();
    final remainingSeconds = seconds % 60;

    final hoursStr = hours.toString().padLeft(2, '0');
    final minutesStr = minutes.toString().padLeft(2, '0');
    final secondsStr = remainingSeconds.toString().padLeft(2, '0');

    if (hours == 0) {
      return '$minutesStr:$secondsStr';
    }

    return '$hoursStr:$minutesStr:$secondsStr';
  }

  int _calculateSecondsUntilTargetTime() {
    DateTime now = DateTime.now();
    print('praveen  widget.targetDateTime ${widget.targetDateTime}');
    Duration difference = widget.targetDateTime.difference(now);
    return difference.isNegative ? 0 : difference.inSeconds;
  }

  @override
  void initState() {
    super.initState();

    int secondsRemaining = _calculateSecondsUntilTargetTime();
    duration = Duration(seconds: secondsRemaining);

    _controller = AnimationController(
      vsync: this,
      duration: duration,
    );
    _controller
      ..reverse(from: secondsRemaining.toDouble())
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed ||
            status == AnimationStatus.dismissed) {
          widget.whenTimeExpires();
        }
      });
  }

  @override
  void didUpdateWidget(CountDownTimerNew oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.targetDateTime != oldWidget.targetDateTime) {
      setState(() {
        int secondsRemaining = _calculateSecondsUntilTargetTime();
        duration = Duration(seconds: secondsRemaining);
        _controller.dispose();
        _controller = AnimationController(
          vsync: this,
          duration: duration,
        );
        _controller
          ..reverse(from: secondsRemaining.toDouble())
          ..addStatusListener((status) {
            if (status == AnimationStatus.completed) {
              widget.whenTimeExpires();
            }
          });
      });
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedBuilder(
        animation: _controller,
        builder: (_, Widget? child) {
          return Text(
            timerDisplayString,
            style: widget.countDownTimerStyle,
          );
        },
      ),
    );
  }
}
