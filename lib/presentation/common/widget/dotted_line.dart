import 'package:flutter/material.dart';

class DottedLine extends StatelessWidget {
  final lineLength;
  final dashColor;
  final dashWidth;
  final dashHeight;

  DottedLine({
    this.lineLength = double.infinity,
    this.dashColor = Colors.black,
    this.dashWidth = 4.0,
    this.dashHeight = 1.0,
  });

  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final boxWidth = constraints.constrainWidth();
        final dashCount = (boxWidth / (2 * dashWidth)).floor();
        return Flex(
          children: List.generate(dashCount, (_) {
            return SizedBox(
              width: dashWidth,
              height: dashHeight,
              child: DecoratedBox(
                decoration: BoxDecoration(color: dashColor),
              ),
            );
          }),
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          direction: Axis.horizontal,
        );
      },
    );
  }
}
