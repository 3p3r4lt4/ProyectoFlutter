import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:flxtech/data/local/dictionaries.dart';
import 'package:flxtech/core/theme/colors_app.dart';
import 'package:flxtech/core/env/environment.dart';
import 'package:flxtech/core/helpers/double_to_as_fixed_decimals.dart';
import 'package:flxtech/core/style/text_style_app.dart';
import 'package:flxtech/core/values/dimensions.dart';
import 'package:flxtech/generated/l10n.dart';
import 'package:flxtech/presentation/pages/quote/widgets/quoter_server_item.dart';
import 'package:flxtech/presentation/pages/quote/widgets/quoter_custom_item.dart';
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
          Consumer<QuoteController>(
            builder: (context, controller, _) {
              return _TitleQuoterItem(l10n.bagOfMinutes,isHide: controller.isHideBagOfMinutes,handleAction: () => controller.showOrHideBagOfMinutes());
            }
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
                ),
                const Divider(),
              
              ],
            ),
          ),

          Column(
            children: [
              Consumer<QuoteController>(
                builder: (context, controller, _) {
                  return _TitleQuoterItem(l10n.services,isHide: controller.isHideServices,handleAction: () => controller.showOrHideServices());
                }
              ),
              Consumer<QuoteController>(
                builder: (context, controller, _) {
                  return controller.isHideServices
                    ? Column(
                        children: List.generate(controller.servicesQuote.length, (index) {
                          final String key = controller.servicesQuote.keys.elementAt(index);
                          final Map<String, dynamic> service = controller.servicesQuote[key]!;
                          return QuoterServerItem(
                            key,
                            service: service,
                            controller: controller,
                          );
                        }),
                      )
                    : const SizedBox(height: MARGIN_SIZE_SMALL);
                }
              ),
              const SizedBox(height: MARGIN_SIZE_SMALL),
              Consumer<QuoteController>(
                builder: (context, controller, _) {
                  return Column(
                    children: [
                      ResumenTotalItem(
                        l10n.subTotal, 
                        value: '$CURRENCY_TYPE_SYMBOL  ${doubleToAsFixedDecimals(controller.subTotalServicesQuote)}'
                      ),
                      const Divider(),
                    ],
                  );
                }
              ),
              _TitleQuoterItem(l10n.installations),
              Consumer<QuoteController>(
                builder: (context, controller, _) {
                  return Column(
                    children: [
                      QuoterCustomItem(
                        controller.equipmentToInstallMap, 
                        controller: controller,
                        isAditional: false,
                      ),
                      const Divider(),
                    ],
                  );
                }
              ),
              
              _TitleQuoterItem(l10n.additional),
            ],
          ),
        ],
      ),
    );
  }
}

class _TitleQuoterItem extends StatelessWidget {
  const _TitleQuoterItem(
    this.title,{
    this.handleAction,
    this.isHide,
  });

  final String title;
  final void Function()? handleAction;
  final bool? isHide;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        const SizedBox(width: WIDTH_ICONBUTTON),
        const Expanded(child: SizedBox()),
        Text(
          title, 
          style: TextStyleApp.h1().copyWith(
          // fontWeight: FontWeight.bold,
          ),
        ),
        const Expanded(child: SizedBox()),
        isHide != null
          ? RotatedBox(
              quarterTurns: isHide! ? 1 : 0,
              child: IconButton(
                onPressed: handleAction,
                icon: const Icon(Icons.arrow_forward_ios_sharp, size: ICON_SIZE_SMALL),
                color: grayColor,
              ),
            )
          : IconButton(
            onPressed: () => null,
            icon: const Icon(Icons.help_outline_outlined, size: ICON_SIZE_SMALL),
            // icon: const Icon(Icons.electrical_services_rounded, size: ICON_SIZE_SMALL),
          )
      ],
    );
  }
}
