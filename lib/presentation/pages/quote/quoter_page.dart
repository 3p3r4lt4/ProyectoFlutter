import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:flxtech/core/env/environment.dart';
import 'package:flxtech/core/helpers/double_to_as_fixed_decimals.dart';
import 'package:flxtech/core/style/text_style_app.dart';
import 'package:flxtech/core/values/dimensions.dart';
import 'package:flxtech/generated/l10n.dart';
import 'package:flxtech/presentation/controllers/quote/quoter_controller.dart';
import 'package:flxtech/presentation/widgets/scaffold_container.dart';
import 'package:flxtech/presentation/widgets/theme_dropdown.dart';

class QuoterPage extends StatelessWidget {
  const QuoterPage();

  DataRow _buildDataRowFeed(
      String key, String destination, QuoteController controller) {
    return DataRow(
      cells: [
        DataCell(
          Text(destination, style: TextStyleApp.b2()),
        ),
        DataCell(
          ThemeDropDown(
            paddingHorizontal: PADDING_SIZE_SMALL,
            listItems:
                List.generate(controller.quantityFeedMap.length, (index) {
              final int quantityFeed = controller.quantityFeedMap[index]!;
              return DropdownMenuItem(
                value: '$quantityFeed',
                child: Text(quantityFeed.toString()),
              );
            }),
            valueSelected:
                controller.bagOfMinutesQuote[key]!['quantity'].toString(),
            onChanged: (dynamic value) {
              controller.loadBagOfMinutesQuote(key, value);
            },
          ),
        ),
        DataCell(
          Text(
              '${doubleToAsFixedDecimals(controller.bagOfMinutesQuote[key]!['price'])}',
              style: TextStyleApp.b2()),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final S l10n = S.current;
    return ScaffoldContainer(
      l10n.myQuoter,
      haveReturn: false,
      isCustomAppBar: true,
      rightIcon: Icons.help_outline_outlined,
      rightPressed: () => print('help'),
      body: ListView(
        children: [
          Container(
            alignment: Alignment.center,
            child: Text(l10n.bagOfMinutes, style: TextStyleApp.h1()),
          ),
          Consumer<QuoteController>(builder: (context, controller, _) {
            // print(controller.bagOfMinutesQuote);
            // final String key = 'local_landline';
            return DataTable(
              sortColumnIndex: 2,
              dataRowHeight: HEIGHT_DATAROW,
              // columnSpacing: 100,
              columns: List.generate(
                3,
                (index) {
                  List<String> titleList = [
                    l10n.destination,
                    l10n.quantity,
                    l10n.price
                  ];
                  return DataColumn(
                    label: Text(titleList[index], style: TextStyleApp.b2()),
                  );
                },
              ),
              rows: [
                _buildDataRowFeed(
                    'local_landline', l10n.localLandline, controller),
              ],
            );
          }),
        ],
      ),
    );
  }
}
