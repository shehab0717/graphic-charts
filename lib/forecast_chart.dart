import 'dart:math';

import 'package:charts/modifiers.dart';
import 'package:charts/mydata.dart';
import 'package:flutter/material.dart';
import 'package:graphic/graphic.dart';

class ForecastChart extends StatelessWidget {
  const ForecastChart({super.key});

  @override
  Widget build(BuildContext context) {
    var maxY = -double.infinity;
    for (Map<String, dynamic> entry in precipForecast) {
      final data = [
        entry['ecmwf'] as double,
        entry['gfs'] as double,
        entry['wpc'] as double,
        entry['nbm'] as double
      ];
      maxY = max((data).reduce(max), maxY);
    }
    return Chart(
      data: precipForecast,
      variables: {
        'day': Variable(accessor: (Map data) => data['day'].toString()),
        'ecmwf': Variable(
          accessor: (Map data) => data['ecmwf'] as num,
          scale: LinearScale(max: maxY, min: 0),
        ),
        'gfs': Variable(
          accessor: (Map data) => data['gfs'] as num,
          scale: LinearScale(max: maxY, min: 0),
        ),
        'wpc': Variable(
          accessor: (Map data) => data['wpc'] as num,
          scale: LinearScale(max: maxY, min: 0),
        ),
        'nbm': Variable(
          accessor: (Map data) => data['nbm'] as num,
          scale: LinearScale(max: maxY, min: 0),
        ),
      },
      marks: [
        IntervalMark(
          color: ColorEncode(encoder: (_) => Colors.blue.shade900),
          position: Varset('day') * Varset('ecmwf') / Varset('day'),
          size: SizeEncode(
            encoder: (_) => 4,
          ),
          modifiers: [GroupModifier(ratio: 0.09)],
        ),
        IntervalMark(
          color: ColorEncode(
              encoder: (_) => Colors.blue.shade900.withOpacity(0.8)),
          size: SizeEncode(
            encoder: (_) => 4,
          ),
          position: Varset('day') * Varset('gfs') / Varset('day'),
          modifiers: [GroupModifier(ratio: 0.03)],
        ),
        IntervalMark(
          color: ColorEncode(
              encoder: (_) => Colors.blue.shade900.withOpacity(0.6)),
          size: SizeEncode(
            encoder: (_) => 4,
          ),
          position: Varset('day') * Varset('nbm') / Varset('day'),
          modifiers: [GroupModifier(ratio: -0.03)],
        ),
        IntervalMark(
          color: ColorEncode(
              encoder: (_) => Colors.blue.shade900.withOpacity(0.4)),
          size: SizeEncode(
            encoder: (_) => 4,
          ),
          position: Varset('day') * Varset('wpc') / Varset('day'),
          modifiers: [GroupModifier(ratio: -.09)],
        ),
        // PointMark(
        //   shape: ShapeEncode(
        //     encoder: (_) => ArrowShape(),
        //   ),
        // ),
      ],
      coord: RectCoord(),
      axes: [
        Defaults.horizontalAxis,
        Defaults.verticalAxis,
      ],
      selections: {
        'soldASelection': PointSelection(
          variable: 'ecmwf',
          on: {
            GestureType.scaleUpdate,
            GestureType.tapDown,
            GestureType.longPressMoveUpdate,
          },
          dim: Dim.x,
        ),
      },
      tooltip: TooltipGuide(
        variables: ['gfs', 'ecmwf', 'nbm', 'wpc'],
        followPointer: [false, true],
        align: Alignment.topLeft,
        offset: const Offset(-20, -20),
        multiTuples: false,
      ),
      crosshair: CrosshairGuide(
        followPointer: [false, true],
        styles: [
          PaintStyle(strokeColor: Colors.black, dash: [3]),
          PaintStyle(strokeColor: Colors.black, dash: [3]),
        ],
        mark: 1,
      ),
    );
  }
}
