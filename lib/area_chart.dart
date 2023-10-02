import 'package:charts/mydata.dart';
import 'package:flutter/material.dart';
import 'package:graphic/graphic.dart';

class AreaChart extends StatefulWidget {
  const AreaChart({super.key});

  @override
  State<AreaChart> createState() => _AreaChartState();
}

class _AreaChartState extends State<AreaChart> {
  @override
  Widget build(BuildContext context) {
    return Chart(
      data: areaChartData,
      variables: {
        'day': Variable(accessor: (Map map) => map['day'].toString()),
        'temp2020': Variable(
            accessor: (Map map) => map['temp']['2020'] as num,
            scale: LinearScale(min: 0, max: 50)),
        'temp2021': Variable(
            accessor: (Map map) => map['temp']['2021'] as num,
            scale: LinearScale(min: 0, max: 50)),
      },
      marks: [
        LineMark(
          position: Varset('day') * Varset('temp2020'),
          color: ColorEncode(encoder: (_) => Colors.red),
          shape: ShapeEncode(encoder: (_) => BasicLineShape(smooth: true)),
        ),
        LineMark(
          position: Varset('day') * Varset('temp2021'),
          color: ColorEncode(encoder: (_) => Colors.blue),
          shape: ShapeEncode(encoder: (_) => BasicLineShape(smooth: true)),
        ),
        AreaMark(
          position: Varset('day') * (Varset('temp2020') + Varset('temp2021')),
          color: ColorEncode(
            encoder: (Map data) => Colors.yellow.withOpacity(0.4),
          ),
          shape: ShapeEncode(encoder: (_) => BasicAreaShape(smooth: true)),
        )
      ],
      axes: [
        Defaults.horizontalAxis,
        Defaults.verticalAxis,
      ],
    );
  }
}
