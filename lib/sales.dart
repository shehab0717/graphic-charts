import 'dart:async';
import 'dart:math';

import 'package:charts/mydata.dart';
import 'package:flutter/material.dart';
import 'package:graphic/graphic.dart';

class SalesChart extends StatelessWidget {
  const SalesChart({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        _LineChart(),
      ],
    );
  }
}

class _LineChart extends StatefulWidget {
  _LineChart({super.key});

  @override
  State<_LineChart> createState() => _LineChartState();
}

class _LineChartState extends State<_LineChart> {
  final resizeStreamController = StreamController<ResizeEvent>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var maxY = -double.infinity;
    for (Map<String, dynamic> entry in salesData) {
      maxY = max(maxY, max(entry['soldA'], entry['soldB']));
    }
    return Chart(
      resizeStream: resizeStreamController,
      data: salesData,
      variables: {
        'year': Variable(accessor: (Map data) => data['year'].toString()),
        'soldA': Variable(
          accessor: (Map data) => data['soldA'] as num,
          scale: LinearScale(max: maxY, min: 0),
        ),
        'soldB': Variable(
          accessor: (Map data) => data['soldB'] as num,
          scale: LinearScale(max: maxY, min: 0),
        ),
      },
      marks: [
        LineMark(
          color: ColorEncode(encoder: (_) => Colors.blue),
          position: Varset('year') * Varset('soldA'),
          shape: ShapeEncode(
            encoder: (_) => BasicLineShape(smooth: true),
          ),
        ),
        PointMark(),
        LineMark(
          color: ColorEncode(encoder: (_) => Colors.green),
          position: Varset('year') * Varset('soldB'),
          shape: ShapeEncode(
            encoder: (_) => BasicLineShape(smooth: true),
          ),
        ),
        PointMark(
          color: ColorEncode(encoder: (_) => Colors.green),
          position: Varset('year') * Varset('soldB'),
        )
      ],
      coord: RectCoord(transposed: false),
      axes: [
        Defaults.horizontalAxis,
        Defaults.verticalAxis,
      ],
      selections: {
        'soldASelection': PointSelection(
          variable: 'soldA',
          on: {
            GestureType.scaleUpdate,
            GestureType.tapDown,
            GestureType.longPressMoveUpdate,
          },
          dim: Dim.x,
        ),
      },
      tooltip: TooltipGuide(
        variables: ['soldA', 'soldB'],
        followPointer: [false, true],
        align: Alignment.topLeft,
        offset: const Offset(-20, -20),
        multiTuples: false,
      ),
      crosshair: CrosshairGuide(followPointer: [false, true]),
    );
  }
}
