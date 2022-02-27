// ignore: implementation_imports
import 'package:provider/src/provider.dart';
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

import 'package:flxtech/core/env/environment.dart';
import 'package:flxtech/core/theme/colors_app.dart';
import 'package:flxtech/core/helpers/double_to_as_fixed_decimals.dart';
import 'package:flxtech/core/style/text_style_app.dart';
import 'package:flxtech/core/values/dimensions.dart';
import 'package:flxtech/domain/entities/circuit.dart';
import 'package:flxtech/domain/entities/custom_item_chart.dart';
import 'package:flxtech/presentation/controllers/circuit/circuits_controller.dart';

class TopCharts extends StatelessWidget {
  const TopCharts(
    this.data, {
    required this.chartKey,
    this.isChartMinutes = false,
  });
  final List<CustomItemChart> data;
  final String chartKey;
  final bool isChartMinutes;

  @override
  Widget build(BuildContext context) {
    final controller = context.read<CircuitController>();
    final List<charts.Series<CustomItemChart, String>> series = [
      charts.Series(
          id: chartKey,
          data: data,
          overlaySeries: true,
          displayName: 'Top Chart',
          domainFn: (CustomItemChart customItemChart, index) =>
              '${index! + 1}°',
          measureFn: (CustomItemChart customItemChart, _) =>
              customItemChart.item,
          colorFn: (CustomItemChart customItemChart, _) =>
              customItemChart.barColor)
    ];

    return Column(
      children: [

        Text(
          chartKey.toUpperCase(),
          style: TextStyleApp.h1().copyWith(
            // decoration: TextDecoration.underline,
            color: purpleColor
          )
        ),

        ...List.generate(series[0].data.length, (index) {
          Circuit circuit = series[0].data[index].circuit;
          return GestureDetector(
            onTap: () => controller.handleNavToClientDetail(circuit, context),
            child: Row(
              children: [
                Text(
                  '${index + 1}°  ',
                  style: TextStyleApp.b1().copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Expanded(
                  child: Text(
                    circuit.organizationName,
                    style: TextStyleApp.b2(),
                  ),
                ),
                Text(
                  !isChartMinutes
                    ? '${circuit.currencySymbol} ${doubleToAsFixedDecimals(circuit.routeGroupTotal)}'
                    : '${doubleToAsFixedDecimals(circuit.routeGroupTime)}\'',
                  style: TextStyleApp.b2(),
                ),
                IconButton(
                  onPressed: () => controller.handleNavToClientDetail(circuit, context),
                  splashRadius: 0.1,
                  icon: const Icon(
                    Icons.arrow_forward_ios_outlined,
                    color: grayLightColor,
                  ),
                ),
              ],
            ),
          );
        }),

        Container(
          height: HEIGHT_CHART_CARD,
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(PADDING_SIZE_SMALL),
              child: Column(
                children: <Widget>[
                  Expanded(
                    child: charts.BarChart(series, animate: true),
                  ),
                ],
              ),
            ),
          ),
        ),

        const Divider(),
      ],
    );
  }
}
