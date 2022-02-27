import 'package:flutter/material.dart';

import 'package:flxtech/core/style/text_style_app.dart';
import 'package:flxtech/core/theme/colors_app.dart';
import 'package:flxtech/core/values/dimensions.dart';
import 'package:flxtech/domain/entities/circuit.dart';
import 'package:flxtech/generated/l10n.dart';
import 'package:flxtech/core/helpers/double_to_as_fixed_decimals.dart';
import 'package:flxtech/presentation/widgets/cards/custom_card.dart';
import 'package:flxtech/presentation/widgets/scaffold_container.dart';

class ClientDetailPage extends StatelessWidget {
  const ClientDetailPage(this.client);
  final Circuit client;

  Widget _buildInfo(String title,String subtitle) => RichText(
    textAlign: title.isEmpty ? TextAlign.center : TextAlign.start,
      text: TextSpan(
          text: title,
          style: TextStyleApp.b1().copyWith(
            color: grayColor,
            fontWeight: FontWeight.bold,
          ),
          children: <TextSpan>[
            TextSpan(
              text: subtitle, style: TextStyleApp.b1().copyWith(
              color: darkColor,
              fontWeight: FontWeight.normal,
              ),
            ),
          ],
        ),
    );

  @override
  Widget build(BuildContext context) {
    final S l10n = S.current;
    return ScaffoldContainer(
      '${l10n.code}: ${client.circuitCode}',
      isCustomAppBar: true,
      body: Container(
        
        height: MediaQuery.of(context).size.height,
        // margin: const EdgeInsets.symmetric(horizontal: MARGIN_SIZE_DEFAULT),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: MARGIN_SIZE_DEFAULT),

            Container(
              margin: const EdgeInsets.all(0),
              width: double.maxFinite,
              color: purpleColor.withOpacity(0.5),
              padding: const EdgeInsets.symmetric(
                horizontal: MARGIN_SIZE_EXTRA_LARGE,
                vertical: MARGIN_SIZE_SMALL,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  _buildInfo('', client.organizationName),
                  _buildInfo('${l10n.ruc} ', client.organizationCode),
                  _buildInfo('${l10n.costTotal}: ', '${client.currencySymbol} ${doubleToAsFixedDecimals(client.routeGroupTotal)}'),
                  _buildInfo('${l10n.minutesTotal}: ', '${doubleToAsFixedDecimals(client.routeGroupTime)}\''),
                ],
              ),
            ),
            Expanded(
              child: Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: MARGIN_SIZE_LARGE),
                child: ListView(
                  physics: const BouncingScrollPhysics(),
                  padding: const EdgeInsets.only(top: MARGIN_SIZE_EXTRA_SMALL),
                  children: List.generate(client.routeGroups.length, (index) {
                        return CustomCard(
                          margin: const EdgeInsets.all(0),
                          padding: const EdgeInsets.symmetric(horizontal: PADDING_SIZE_DEFAULT, vertical: PADDING_SIZE_SMALL),
                          children: [
                            _buildInfo('${l10n.name}: ', client.routeGroups[index].name),
                            _buildInfo('${l10n.minutes}:  ', doubleToAsFixedDecimals(client.routeGroups[index].minutes).toString()),
                            _buildInfo('${l10n.cost}: ', '${client.currencySymbol} ${doubleToAsFixedDecimals(client.routeGroups[index].sellCost)}'),
                          ],
                        );
                      }
                  )
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
