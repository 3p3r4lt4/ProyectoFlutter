import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flxtech/core/style/text_style_app.dart';
import 'package:flxtech/core/values/dimensions.dart';
import 'package:flxtech/domain/entities/custom_item_chart.dart';

class TopCharts extends StatelessWidget {
  const TopCharts(this.data,{
    required this.chartKey,
  });
  final List<CustomItemChart> data;
  final String chartKey;

  @override
  Widget build(BuildContext context) {
    
    List<charts.Series<CustomItemChart, String>> series = [
      charts.Series(
        id: chartKey,
        data: data,
        overlaySeries: true,
        displayName: 'Top Chart',
        labelAccessorFn: (datum, index) => datum.bottom,
        domainFn: (CustomItemChart customItemChart, _) => customItemChart.bottom.toString(),
        measureFn: (CustomItemChart customItemChart, _) => customItemChart.item,
        colorFn: (CustomItemChart customItemChart, _) => customItemChart.barColor
      )
    ];

    return Container(
      height: 400,
      // padding: EdgeInsets.all(PADDING_SIZE_DEFAULT),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(PADDING_SIZE_SMALL),
          child: Column(
            children: <Widget>[
              Text(
                chartKey,
                style: TextStyleApp.b1(),
              ),
              Expanded(
                child: charts.BarChart(series, animate: true),
              ),
              // Expanded(
              //   child: charts.LineChart(series,
              //    domainAxis: const charts.NumericAxisSpec(
              //          tickProviderSpec:
              //          charts.BasicNumericTickProviderSpec(zeroBound: false),
              //          viewport: charts.NumericExtents(2016.0, 2022.0),
              //    ),
              //    animate: true),
              // ),
              // Expanded(
              //   child: charts.PieChart(series,
              //    defaultRenderer: charts.ArcRendererConfig(
              //     arcRendererDecorators: [
              //       charts.ArcLabelDecorator(
              //       labelPosition: charts.ArcLabelPosition.inside)
              //   ]),
              //    animate: true),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}