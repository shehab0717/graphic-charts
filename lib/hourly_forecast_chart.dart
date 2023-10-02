import 'package:charts/mydata.dart';
import 'package:charts/shapes.dart';
import 'package:flutter/material.dart';
import 'package:graphic/graphic.dart';

const windColor = Colors.green;
const precipColor = Color(0xff5DA7BD);

class HourlyForecastChart extends StatelessWidget {
  const HourlyForecastChart({super.key});

  @override
  Widget build(BuildContext context) {
    return Chart(
      data: hourlyWeatherInfo,
      variables: {
        'hour': Variable(
          accessor: (Map data) => data['hour'] as String,
        ),
        'wind': Variable(
          accessor: (Map data) => data['wind'] as double,
          scale: LinearScale(
            max: 50,
            min: 0,
            tickCount: 8,
            title: 'Wind Speed',
          ),
        ),
        'precip': Variable(
          accessor: (Map data) => data['precip'] as double,
          scale: LinearScale(min: 0, max: 25, title: 'Precipitation'),
        ),
        'windDirection': Variable(
          accessor: (Map data) => data['windDirection'] as double,
        )
      },
      marks: [
        IntervalMark(
          color: ColorEncode(encoder: (_) => precipColor),
          position: Varset('hour') * Varset('precip'),
          // label: LabelEncode(
          //   encoder: (data) => Label(
          //     (data['precip'] as double).toStringAsFixed(1),
          //     LabelStyle(
          //       textStyle: const TextStyle(
          //         color: precipColor,
          //         fontSize: 10,
          //         fontWeight: FontWeight.bold,
          //       ),
          //     ),
          //   ),
          // ),
        ),
        PointMark(
          position: Varset('hour') * Varset('wind'),
          layer: 3,
          shape: ShapeEncode(
            encoder: (Map data) =>
                ArrowShape(rotation: data['windDirection'], strokeWidth: 2),
          ),
          color: ColorEncode(encoder: (_) => Colors.green.shade700),
          size: SizeEncode(encoder: (_) => 12),
        ),
        LineMark(
          layer: 2,
          position: Varset('hour') * Varset('wind'),
          color: ColorEncode(encoder: (_) => Colors.green.shade200),
          shape: ShapeEncode(encoder: (_) => BasicLineShape()),
        )
      ],
      axes: [
        AxisGuide(
          grid: PaintStyle(
            strokeColor: windColor.withOpacity(0.2),
            dash: [10],
          ),
          dim: Dim.x,
          line: PaintStyle(
            strokeColor: Colors.grey,
            strokeWidth: 0.5,
          ),
          label: LabelStyle(
            offset: const Offset(0, 12),
            textStyle: const TextStyle(
              color: Color.fromARGB(255, 0, 56, 102),
              fontSize: 11,
            ),
            rotation: 0.4,
          ),
        ),
        AxisGuide(
          grid: PaintStyle(
            strokeColor: windColor.withOpacity(0.2),
            dash: [10],
          ),
          position: 0,
          variable: 'wind',
          label: LabelStyle(
            align: Alignment.centerLeft,
            textStyle: const TextStyle(
              color: windColor,
              fontSize: 12,
            ),
          ),
        ),
        AxisGuide(
          // grid: PaintStyle(
          //   strokeColor: humidityColor.withOpacity(0.2),
          // ),
          position: 1,
          variable: 'precip',
          label: LabelStyle(
            align: Alignment.center,
            textStyle: const TextStyle(
              color: precipColor,
              fontSize: 12,
            ),
          ),
        ),
      ],
      selections: {
        'selection': PointSelection(
          dim: Dim.x,
          on: {GestureType.tap},
        ),
      },
      crosshair: CrosshairGuide(followPointer: [false, true]),
      tooltip: TooltipGuide(
        layer: 4,
        variables: ['precip', 'wind'],
      ),
    );
  }
}
