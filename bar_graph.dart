import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'bar_data.dart';

class MyBarGraph extends StatelessWidget {

  final double? maxY;
  final double sunAmount;
  final double monAmount;
  final double tueAmount;
  final double wedAmount;
  final double thuAmount;
  final double friAmount;
  final double satAmount;

  const MyBarGraph({
    super.key,
    required this.maxY,
    required this.sunAmount,
    required this.monAmount,
    required this.tueAmount,
    required this.wedAmount,
    required this.thuAmount,
    required this.friAmount,
    required this.satAmount,
  });

  @override
  Widget build(BuildContext context) {

    BarData myBarData=BarData(
      sunAmount: sunAmount,
      monAmount: monAmount,
      tueAmount: tueAmount,
      wedAmount: wedAmount,
      thuAmount: thuAmount,
      friAmount: friAmount,
      satAmount: satAmount,
    );

    myBarData.initialze_BarData();

    return BarChart(BarChartData(
      maxY: maxY, minY: 10,
      titlesData: FlTitlesData(
        show: true,
        topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
        rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
        leftTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
        bottomTitles: AxisTitles(sideTitles: SideTitles(
          showTitles: true,
          getTitlesWidget: getBottomTitles,
          reservedSize: 30//给定轴（例如底部轴或侧边轴）预留的空间大小
        )),
      ),
      gridData: FlGridData(show: false),
      borderData: FlBorderData(show: false),
      barGroups: myBarData.barData.map(
        (data) => BarChartGroupData(
          x: data.x, barRods: [
            BarChartRodData(
              toY: data.y,
              color: Colors.greenAccent[400]!,width: 27,
              borderRadius: BorderRadius.circular(3),
              backDrawRodData: BackgroundBarChartRodData(
                show: true, toY: maxY, color: Colors.grey[200]!,
              ),
            )
          ],
        ),
      ).toList(),
    ));
  }

  Widget getBottomTitles(double value, TitleMeta meta) {
    Widget text = Container(); // 给 text 变量一个默认的初始值
    switch (value.toInt()) {
      case 0: text = Text('天', style: boldBlackFont());break;
      case 1: text = Text('一', style: boldBlackFont());break;
      case 2: text = Text('二', style: boldBlackFont());break;
      case 3: text = Text('三', style: boldBlackFont());break;
      case 4: text = Text('四', style: boldBlackFont());break;
      case 5: text = Text('五', style: boldBlackFont());break;
      case 6: text = Text('六', style: boldBlackFont());break;
    }
    return SideTitleWidget(axisSide: meta.axisSide, child: text);
  }

  TextStyle boldBlackFont() {
    return const TextStyle(
      fontWeight: FontWeight.bold,
      color: Colors.black,
    );
  }
}

