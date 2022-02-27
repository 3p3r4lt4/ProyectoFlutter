import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flxtech/core/env/environment.dart';
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
        domainFn: (CustomItemChart customItemChart, index) => '${index!+1}°',
        measureFn: (CustomItemChart customItemChart, _) => customItemChart.item,
        colorFn: (CustomItemChart customItemChart, _) => customItemChart.barColor
      )
    ];

    return Column(
      children: [
        Container(
          height: HEIGHT_CHART_CARD,
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(PADDING_SIZE_SMALL),
              child: Column(
                children: <Widget>[
                  Text(
                    chartKey,
                    style: TextStyleApp.b1(),
                  ),
                  Expanded(child: charts.BarChart(series, animate: true),),

                ],
              ),
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.symmetric(vertical: MARGIN_SIZE_SMALL),
          child: Text(
            chartKey,
            style: TextStyleApp.b1(),
          ),
        ),
      ],
    );
  }
}