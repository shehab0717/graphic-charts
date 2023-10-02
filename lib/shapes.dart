import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:graphic/graphic.dart';
import 'package:graphic/src/graffiti/element/element.dart';

class ArrowShape extends PointShape {
  ArrowShape({this.rotation = 0.0, double strokeWidth = 2})
      : super(false, strokeWidth);

  final double rotation;

  @override
  MarkElement<ElementStyle> drawPoint(Attributes item, CoordConv coord) {
    final position = coord.convert(item.position.last);
    return ArrowElement(
      position: position,
      rotationAngle: rotation,
      style: PaintStyle(
        strokeWidth: strokeWidth,
        strokeColor: item.color ?? Colors.blue,
      ),
      size: item.size ?? 14,
    );
  }

  @override
  bool equalTo(Object other) => super.equalTo(other) && other is ArrowShape;
}

class ArrowElement extends PrimitiveElement {
  ArrowElement({
    required super.style,
    required this.position,
    this.rotationAngle = 0,
    required this.size,
  });

  final Offset position;
  final double size;
  final double rotationAngle;

  @override
  ArrowElement lerpFrom(covariant ArrowElement from, double t) => ArrowElement(
        style: style.lerpFrom(from.style, t),
        position: Offset.lerp(from.position, position, t)!,
        size: lerpDouble(from.size, size, t)!,
      );

  @override
  void drawPath(Path path) {
    path.moveTo(position.dx, position.dy);

    var p = _rotate(Offset(0, size / 2), rotationAngle);
    path.relativeMoveTo(p.dx, p.dy);

    p = _rotate(Offset(0, -size), rotationAngle);
    path.relativeLineTo(p.dx, p.dy);

    p = _rotate(const Offset(0, -2), rotationAngle);
    path.relativeMoveTo(p.dx, p.dy);

    p = _rotate(Offset(-size / 2, size / 2), rotationAngle);
    path.relativeLineTo(p.dx, p.dy);

    p = _rotate(Offset(size / 2, -size / 2), rotationAngle);
    path.relativeMoveTo(p.dx, p.dy);

    p = _rotate(Offset(size / 2, size / 2), rotationAngle);
    path.relativeLineTo(p.dx, p.dy);
  }

  Offset _rotate(Offset offset, double angle) {
    final radAngle = angle * pi / 180;
    final xx = offset.dx * cos(radAngle) - offset.dy * sin(radAngle);
    final yy = offset.dy * cos(radAngle) + offset.dx * sin(radAngle);
    return Offset(xx, yy);
  }

  @override
  List<Segment> toSegments() {
    return [];
  }
}
