import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:flxtech/core/values/dimensions.dart';
import 'package:flxtech/generated/l10n.dart';
import 'package:flxtech/presentation/pages/reports/top_charts.dart';
import 'package:flxtech/presentation/controllers/circuit/circuits_controller.dart';
import 'package:flxtech/presentation/widgets/scaffold_container.dart';

class ReportsPage extends StatelessWidget {
  
  const ReportsPage();
  
  @override
  Widget build(BuildContext context) {
    final S l10n = S.current;
    return ScaffoldContainer(
      l10n.reports,
      haveReturn: false,
      isCustomAppBar: true,
      body: Container(
        margin: const EdgeInsets.only(
          left: MARGIN_SIZE_DEFAULT,
          right: MARGIN_SIZE_DEFAULT,
          top: MARGIN_SIZE_SMALL,
        ),
        child: ListView(
          children: [
            const Divider(height: 1),

            Consumer<CircuitController>(
              builder: (context, controller, _) {
                return controller.routeGroupsTop.isNotEmpty
                  ? TopCharts(controller.routeGroupsTop, chartKey: l10n.clientsTop)
                  : const SizedBox();
              }
            ),
            
            const SizedBox(height: MARGIN_SIZE_DEFAULT),

            Consumer<CircuitController>(
              builder: (context, controller, _) {
                return controller.totalsMinutes.isNotEmpty
                  ? TopCharts(controller.totalsMinutes, chartKey: l10n.minutesTotalTop)
                  : const SizedBox();
              }
            ),
            
          ],
        ),
      ),
    );
  }

}