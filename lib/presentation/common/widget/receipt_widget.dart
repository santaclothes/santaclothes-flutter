import 'package:flutter/material.dart';

class ReceiptWidget extends StatelessWidget {
  final Color color;
  final double? width;
  final double? height;
  final Widget child;

  ReceiptWidget({
    required this.child,
    required this.color,
    this.width,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _ClipShadowShadowPainter(
        clipper: _SancleFormClipper(),
        shadow: Shadow(
          color: Colors.black.withOpacity(0.18),
          blurRadius: 4.0,
        ),
      ),
      child: ClipPath(
          child: Container(
            child: child,
            width: width,
            height: height,
            color: color,
          ),
          clipper: _SancleFormClipper()),
    );
  }
}

class _ClipShadowShadowPainter extends CustomPainter {
  final Shadow shadow;
  final CustomClipper<Path> clipper;

  _ClipShadowShadowPainter({required this.shadow, required this.clipper});

  @override
  void paint(Canvas canvas, Size size) {
    var paint = shadow.toPaint();
    var clipPath = clipper.getClip(size).shift(shadow.offset);
    canvas.drawPath(clipPath, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

class _SancleFormClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height);
    double x = 0;
    double y = size.height;
    double increment = size.width / 62;

    while (x < size.width) {
      x += increment;
      y = (y == size.height) ? size.height - 7.0 : size.height;
      path.lineTo(x, y);
    }
    path.lineTo(size.width, 0.0);

    while (x > 0) {
      x -= increment;
      y = (y == 0) ? 7.0 : 0;
      path.lineTo(x, y);
    }

    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper old) {
    return old != this;
  }
}
