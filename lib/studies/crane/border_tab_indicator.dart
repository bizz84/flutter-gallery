// Copyright 2019 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';

class const BorderTabIndicator({
    required final double indicatorHeight,
    required final double textScaleFactor,
  }) extends Decoration {
  this : super();

  @override
  BorderPainter createBoxPainter([VoidCallback? onChanged]) {
    return BorderPainter(this, indicatorHeight, textScaleFactor, onChanged);
  }
}

class BorderPainter(
    final BorderTabIndicator decoration,
    final double indicatorHeight,
    final double textScaleFactor,
    VoidCallback? onChanged,
  ) extends BoxPainter {
  this : assert(indicatorHeight >= 0), super(onChanged);

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    assert(configuration.size != null);
    final horizontalInset = 16 - 4 * textScaleFactor;
    final rect =
        Offset(
          offset.dx + horizontalInset,
          (configuration.size!.height / 2) - indicatorHeight / 2 - 1,
        ) &
        Size(configuration.size!.width - 2 * horizontalInset, indicatorHeight);
    final paint = Paint();
    paint.color = Colors.white;
    paint.style = PaintingStyle.stroke;
    paint.strokeWidth = 2;
    canvas.drawRRect(
      RRect.fromRectAndRadius(rect, const Radius.circular(56)),
      paint,
    );
  }
}
