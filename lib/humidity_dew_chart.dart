import 'package:charts/mydata.dart';
import 'package:flutter/material.dart';
import 'package:graphic/graphic.dart';

const dewpointColor = Color(0xffFFA73E);
const humidityColor = Color(0xff5890BE);
const precipColor = Color(0xff5DA7BD);

class HumidityDewChart extends StatelessWidget {
  const HumidityDewChart({super.key});

  @override
  Widget build(BuildContext context) {
    return Chart(
      data: humidityDewData,
      variables: {
        'day': Variable(accessor: (Map data) => data['day'] as String),
        'humidity': Variable(
          accessor: (Map data) => data['humidity'] as double,
          scale: LinearScale(
            max: 100,
            min: 0,
            formatter: (value) => '${value.toInt()}%',
            tickCount: 6,
            title: 'Humidity',
          ),
        ),
        'dewpoint': Variable(
          accessor: (Map data) => data['dewpoint'] as double,
          scale: LinearScale(
            max: 90,
            min: 0,
            tickCount: 8,
            title: 'Dewpoint',
          ),
        ),
        'precip': Variable(
          accessor: (Map data) => data['precip'] as double,
          scale: LinearScale(min: 0, max: 100, title: 'Precipitation'),
        ),
        'windDirection': Variable(
          accessor: (Map data) => data['windDirection'] as double,
        )
      },
      marks: [
        LineMark(
          color: ColorEncode(
            encoder: (_) => humidityColor,
          ),
          label: LabelEncode(
            encoder: (data) => Label(
              (data['humidity'] as double).toStringAsFixed(0),
              LabelStyle(
                offset: const Offset(0, -6),
                textStyle: const TextStyle(color: humidityColor, fontSize: 10),
              ),
            ),
          ),
        ),
        PointMark(
          color: ColorEncode(encoder: (_) => humidityColor),
          size: SizeEncode(encoder: (_) => 6),
        ),
        LineMark(
          position: Varset('day') * Varset('dewpoint'),
          color: ColorEncode(
            encoder: (_) => dewpointColor,
          ),
          label: LabelEncode(
            encoder: (data) => Label(
              (data['dewpoint'] as double).toStringAsFixed(0),
              LabelStyle(
                offset: const Offset(0, -6),
                textStyle: const TextStyle(color: dewpointColor, fontSize: 10),
              ),
            ),
          ),
        ),
        PointMark(
          position: Varset('day') * Varset('dewpoint'),
          color: ColorEncode(encoder: (_) => dewpointColor),
          size: SizeEncode(encoder: (_) => 6),
        ),
        IntervalMark(
          color: ColorEncode(encoder: (_) => precipColor),
          position: Varset('day') * Varset('precip'),
          label: LabelEncode(
            encoder: (data) => Label(
              (data['precip'] as double).toStringAsFixed(1),
              LabelStyle(
                textStyle: const TextStyle(
                  color: precipColor,
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ],
      axes: [
        AxisGuide(
          grid: PaintStyle(
            strokeColor: dewpointColor.withOpacity(0.2),
            dash: [10],
          ),
          dim: Dim.x,
          line: PaintStyle(
            strokeColor: humidityColor,
            strokeWidth: 0.5,
          ),
          label: LabelStyle(
            offset: const Offset(0, 12),
            textStyle: const TextStyle(
              color: humidityColor,
              fontSize: 11,
            ),
            // rotation: 1,
          ),
        ),
        AxisGuide(
          grid: PaintStyle(
            strokeColor: dewpointColor.withOpacity(0.2),
            dash: [10],
          ),
          position: 0,
          variable: 'dewpoint',
          label: LabelStyle(
            align: Alignment.centerLeft,
            textStyle: const TextStyle(
              color: dewpointColor,
              fontSize: 12,
            ),
          ),
        ),
        AxisGuide(
          // grid: PaintStyle(
          //   strokeColor: humidityColor.withOpacity(0.2),
          // ),
          position: 1,
          variable: 'humidity',
          label: LabelStyle(
            align: Alignment.center,
            textStyle: const TextStyle(
              color: humidityColor,
              fontSize: 12,
            ),
          ),
        ),
      ],
      selections: {
        'selection': PointSelection(
          dim: Dim.x,
          on: {
            GestureType.scaleUpdate,
            GestureType.tapDown,
            GestureType.longPressMoveUpdate,
          },
        ),
      },
      crosshair: CrosshairGuide(followPointer: [false, true]),
      tooltip: TooltipGuide(
        variables: ['humidity', 'dewpoint', 'precip'],
      ),
    );
  }
}
