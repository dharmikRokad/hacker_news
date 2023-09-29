import 'package:flutter/material.dart';

class HeadLine extends ImplicitlyAnimatedWidget {
  const HeadLine({
    required this.text,
    required this.color,
    Key? key,
  }) : super(key: key, duration: const Duration(milliseconds: 600));

  final String text;
  final Color color;

  @override
  HeadLineState createState() {
    return HeadLineState();
  }
}

class HeadLineState extends AnimatedWidgetBaseState<HeadLine> {
  late GhostFadeTween colorTween;
  late TextTween textTween;

  @override
  void initState() {
    colorTween = GhostFadeTween(begin: widget.color);
    textTween = TextTween(begin: widget.text);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      textTween.evaluate(animation),
      style: TextStyle(
        color: colorTween.evaluate(animation),
      ),
    );
  }

  @override
  void forEachTween(visitor) {
    colorTween = visitor(
      colorTween,
      widget.color,
      (color) => GhostFadeTween(begin: color),
    ) as GhostFadeTween;

    textTween = visitor(
      textTween,
      widget.text,
      (text) => TextTween(begin: text),
    ) as TextTween;
  }
}

class GhostFadeTween extends ColorTween {
  final Color middle = Colors.transparent;

  GhostFadeTween({super.begin, super.end});

  @override
  Color lerp(double t) {
    if (t < 0.5) {
      return Color.lerp(begin, middle, t * 2) ?? Colors.yellow;
    } else {
      return Color.lerp(middle, end, (t - 0.5) * 2) ?? Colors.yellow;
    }
  }
}

class TextTween extends Tween<String> {
  TextTween({super.begin, super.end});

  @override
  String lerp(double t) {
    if (t < 0.5) return begin ?? '[begin]';
    return end ?? '[end]';
  }
}
