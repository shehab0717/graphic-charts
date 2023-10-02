import 'package:charts/area_chart.dart';
import 'package:charts/forecast_chart.dart';
import 'package:charts/hourly_forecast_chart.dart';
import 'package:charts/humidity_dew_chart.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                // Container(
                //   padding:
                //       const EdgeInsets.symmetric(vertical: 10, horizontal: 0),
                //   height: 300,
                //   width: double.infinity,
                //   child: const HumidityDewChart(),
                // ),
                // Container(
                //   padding:
                //       const EdgeInsets.symmetric(horizontal: 0, vertical: 10),
                //   height: 300,
                //   width: double.infinity,
                //   child: const ForecastChart(),
                // ),
                // SingleChildScrollView(
                //   scrollDirection: Axis.horizontal,
                //   child: Container(
                //     padding:
                //         const EdgeInsets.symmetric(horizontal: 0, vertical: 10),
                //     width: 1200,
                //     height: 200,
                //     child: const HourlyForecastChart(),
                //   ),
                // ),
                Container(
                  width: double.infinity,
                  height: 200,
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: const AreaChart(),
                ),
                const SizedBox(height: 200),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
