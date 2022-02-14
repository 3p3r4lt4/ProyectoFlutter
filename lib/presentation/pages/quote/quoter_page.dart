import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:flxtech/data/local/dictionaries.dart';
import 'package:flxtech/core/theme/colors_app.dart';
import 'package:flxtech/core/env/environment.dart';
import 'package:flxtech/core/helpers/double_to_as_fixed_decimals.dart';
import 'package:flxtech/core/style/text_style_app.dart';
import 'package:flxtech/core/values/dimensions.dart';
import 'package:flxtech/generated/l10n.dart';
import 'package:flxtech/presentation/controllers/quote/quoter_controller.dart';
import 'package:flxtech/presentation/widgets/scaffold_container.dart';
import 'package:flxtech/presentation/widgets/theme_dropdown.dart';
import 'package:flxtech/presentation/pages/quote/widgets/resument_total_item.dart';

class QuoterPage extends StatelessWidget {
  const QuoterPage();

  DataRow _buildDataRowFeed(
      String key, String destination, QuoteController controller) 
    => DataRow(
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
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const SizedBox(),
                Text(l10n.bagOfMinutes, style: TextStyleApp.h1()),
                Consumer<QuoteController>(
                  builder: (context, controller, _) {
                    return RotatedBox(
                      quarterTurns: controller.isHideBagOfMinutes ? 1 : 0,
                      child: IconButton(
                        onPressed: () => controller.showOrHideBagOfMinutes(),
                        icon: const Icon(Icons.arrow_forward_ios_sharp, size: ICON_SIZE_SMALL),
                        color: grayColor,
                      ),
                    );
                  }
                ),
              ],
            ),
          ),
          Consumer<QuoteController>(builder: (context, controller, _) 
            => Column(
              children: [
                !controller.isHideBagOfMinutes
                  ? DataTable(
                      sortColumnIndex: 2,
                      dataRowHeight: HEIGHT_DATAROW,
                      showBottomBorder: false,
                      // columnSpacing: 100,
                      columns: List.generate(
                        3,(index) {
                          List<String> titleList = [l10n.destination,l10n.quantity,'${l10n.price} $CURRENCY_TYPE_SYMBOL'];
                          return DataColumn(
                            label: Text(titleList[index], style: TextStyleApp.b2()),
                          );
                        },
                      ),
                      rows: List.generate(nameWithFeedMap.length, (index) {
                        String key = nameWithFeedMap.keys.elementAt(index);
                        return _buildDataRowFeed(key, nameWithFeedMap[key]!['name'], controller);
                      }),
                    )
                  : const SizedBox(height: MARGIN_SIZE_SMALL),
                const SizedBox(height: MARGIN_SIZE_SMALL),
                ResumenTotalItem(
                  l10n.subTotal, 
                  value: '$CURRENCY_TYPE_SYMBOL  ${doubleToAsFixedDecimals(controller.subTotalBagOfMinutesQuote)}'
                )
              ],
            ),
            
          ),
        ],
      ),
    );
  }
}
