import 'package:flutter/material.dart';

  import 'package:fl_chart/fl_chart.dart';

  class TemperaturePage  extends StatefulWidget {
  const TemperaturePage({super.key});

  @override
  _TemperaturePageState createState() => _TemperaturePageState();
  }

  class _TemperaturePageState extends State<TemperaturePage> {
  final List<TemperatureData> temperatureData = [
  TemperatureData(DateTime(2022, 1, 1), 20),
  TemperatureData(DateTime(2022, 1, 2), 21),
  TemperatureData(DateTime(2022, 1, 3), 22),
  // Add more data points here...
  ];

  @override
  Widget build(BuildContext context) {
  return Scaffold(
  appBar: AppBar(
  title: const Text('Temperature Sensor Data'),
  ),
  body: Column(
  children: [
  SizedBox(
  height: 300,
  child: LineChart(
  LineChartData(
  minX: temperatureData.first.date.millisecondsSinceEpoch.toDouble(),
  maxX: temperatureData.last.date.millisecondsSinceEpoch.toDouble(),
  minY: temperatureData.map((data) => data.temperature).reduce((a, b) => a < b ? a : b).toDouble(),
  maxY: temperatureData.map((data) => data.temperature).reduce((a, b) => a > b ? a : b).toDouble(),
  lineBarsData: [
  LineChartBarData(
  spots: temperatureData
      .map((data) => FlSpot(data.date.millisecondsSinceEpoch.toDouble(), data.temperature))
      .toList(),
  isCurved: true,
  // colors: [Colors.blue],
  barWidth: 4,
  isStrokeCapRound: true,
  belowBarData: BarAreaData(show: false),
  dotData: FlDotData(show: false),
  ),
  ],
  titlesData: FlTitlesData(
  // bottomTitles: SideTitles(
  // showTitles: true,
  // reservedSize: 22,

  // getTitles: (value) {
  // final date = DateTime.fromMillisecondsSinceEpoch(value.toInt());
  // return '${date.day}/${date.month}';
  // },
  // margin: 8,
  // ),
  // leftTitles: SideTitles(
  // showTitles: true,

  // getTitles: (value) {
  // return '$value°C';
  // },
  // margin: 8,
  // ),
  
  ),
  borderData: FlBorderData(
  show: true,
  border: Border.all(color: const Color(0xff37434d), width: 1),
  ),
  gridData: FlGridData(
  show: true,
  checkToShowHorizontalLine: (value) => true,
  drawHorizontalLine: true,
  getDrawingHorizontalLine: (value) => FlLine(color: const Color(0xff37434d), strokeWidth: 1),
  ),
  ),
  ),
  ),
  const SizedBox(height: 20),
  const Text(
  'Temperature Data',
  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
  ),
  Expanded(
  child: ListView.builder(
  itemCount: temperatureData.length,
  itemBuilder: (context, index) {
  return ListTile(
  title: Text('Date: ${temperatureData[index].date.toString()}, Temperature: ${temperatureData[index].temperature}°C'),
  );
  },
  ),
  ),
  ],
  ),
  );
  }
  }

  class TemperatureData {
  final DateTime date;
  final double temperature;

  TemperatureData(this.date, this.temperature);
  }
