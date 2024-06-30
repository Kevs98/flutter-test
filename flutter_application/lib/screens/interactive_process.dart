import 'dart:math';

import 'package:flutter/material.dart';

class InteractiveProcess extends StatefulWidget {
  const InteractiveProcess({super.key});

  @override
  State<InteractiveProcess> createState() => _InteractiveProcessState();
}

class _InteractiveProcessState extends State<InteractiveProcess> with SingleTickerProviderStateMixin {
  double _progress = 0.0;
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..addListener(() {
        setState(() {
          _progress = _animation.value;
        });
      });
    _animation = Tween(begin: 0.0, end: 1.0).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _startProcess() {
    _controller.reset();
    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: _startProcess,
            child: SizedBox(
              width: 200,
              height: 200,
              child: CustomPaint(
                foregroundPainter: _CircularProgressPainter(_progress),
                child: Center(
                  child: Text(
                    '${(_progress * 100).toInt()} %',
                    style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          ElevatedButton(onPressed: _startProcess, child: const Text('Inciar Progreso'))
        ],
      ),
    );
  }
}

class _CircularProgressPainter extends CustomPainter {
  final double progress;
  _CircularProgressPainter(this.progress);

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..strokeWidth = 10
      ..color = Colors.blue
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    Offset center = Offset(size.width / 2, size.height / 2);
    double radius = size.width / 2;

    canvas.drawArc(Rect.fromCircle(center: center, radius: radius), -pi / 2, 2 * pi * progress, false, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
