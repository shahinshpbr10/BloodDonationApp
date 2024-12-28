import 'dart:math';
import 'package:flutter/material.dart';

class CircularBubbleWidget extends StatefulWidget {
  final PageController pageController;
  final double radius;
  final double angleOffset;
  final double bubbleSize;
  final Color color;

  const CircularBubbleWidget({
    Key? key,
    required this.pageController,
    required this.radius,
    required this.angleOffset,
    required this.bubbleSize,
    required this.color,
  }) : super(key: key);

  @override
  _CircularBubbleWidgetState createState() => _CircularBubbleWidgetState();
}

class _CircularBubbleWidgetState extends State<CircularBubbleWidget> {
  double _currentPage = 0;

  @override
  void initState() {
    super.initState();
    widget.pageController.addListener(() {
      setState(() {
        _currentPage = widget.pageController.page ?? 0;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    double angle = (_currentPage * 2 * pi / 3) + widget.angleOffset;
    double x = widget.radius * cos(angle);
    double y = widget.radius * sin(angle);

    return Positioned(
      left: MediaQuery.of(context).size.width / 2 + x - widget.bubbleSize / 2,
      top: MediaQuery.of(context).size.height * 0.3 + y - widget.bubbleSize / 2,
      child: CircleAvatar(
        radius: widget.bubbleSize / 2,
        backgroundColor: widget.color,
      ),
    );
  }
}
