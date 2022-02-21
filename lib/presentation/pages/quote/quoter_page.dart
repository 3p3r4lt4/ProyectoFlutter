import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:flxtech/generated/l10n.dart';
import 'package:flxtech/core/env/environment.dart';
import 'package:flxtech/core/theme/colors_app.dart';
import 'package:flxtech/core/values/dimensions.dart';
import 'package:flxtech/data/local/dictionaries.dart';
import 'package:flxtech/core/style/text_style_app.dart';
import 'package:flxtech/presentation/widgets/theme_dropdown.dart';
import 'package:flxtech/presentation/widgets/scaffold_container.dart';
import 'package:flxtech/core/helpers/double_to_as_fixed_decimals.dart';
import 'package:flxtech/presentation/widgets/buttons/theme_button.dart';
import 'package:flxtech/presentation/controllers/quote/quoter_controller.dart';
import 'package:flxtech/presentation/pages/quote/widgets/quoter_server_item.dart';
import 'package:flxtech/presentation/pages/quote/widgets/quoter_custom_item.dart';
import 'package:flxtech/presentation/pages/quote/widgets/resumen_total_item.dart';

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
    final QuoteController quoteController = context.read<QuoteController>();
    return ScaffoldContainer(
      l10n.myQuoter,
      haveReturn: false,
      isCustomAppBar: true,
      rightIcon: Icons.delete,
      rightPressed: () {
        FocusScope.of(context).requestFocus(FocusNode());
        quoteController.handleCleanQuoter();
      },
      body: ListView(
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        physics: const BouncingScrollPhysics(),
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
                      dataRowHeight: HEIGHT_DATA_ROW,
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
                builder: (context, controller, _) => _TitleQuoterItem(l10n.servers,isHide: controller.isHideServers,handleAction: () => controller.showOrHideServices())
              ),
              Consumer<QuoteController>(
                builder: (context, controller, _) 
                  => !controller.isHideServers
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
                    : const SizedBox(height: MARGIN_SIZE_SMALL)
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
                        isAdditional: false,
                      ),
                      const Divider(),
                    ],
                  );
                }
              ),
              
              _TitleQuoterItem(l10n.additional),
              Consumer<QuoteController>(
                builder: (context, controller, _) {
                  return Row(
                    children: [
                      Expanded(
                        child: Container(
                          margin: const EdgeInsets.only(left: MARGIN_SIZE_DEFAULT),
                          child: Text(
                            controller.additionalIPMap['name'],
                            style: TextStyleApp.caption(),
                          ),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(2.5),
                          border: Border.all(
                            width: 2,
                            color: controller.isIPPublic ? purpleColor : whiteColor,
                          )
                        ),
                          child: IconButton(
                            onPressed: () => controller.loadUseIpPublic(true),
                            icon: Text(
                              l10n.yes,
                              style: TextStyleApp.b1(),
                            ),
                          ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(2.5),
                          border: Border.all(
                            width: 2,
                            color: !controller.isIPPublic ? purpleColor : whiteColor,
                          )
                        ),
                          child: IconButton(
                            onPressed: () => controller.loadUseIpPublic(false),
                            icon: Text(
                              l10n.no,
                              style: TextStyleApp.b1(),
                            ),
                          ),
                      ),
                      Container(
                        width: WIDTH_SHORT_TEXT_FORM,
                        alignment: Alignment.centerRight,
                        margin: const EdgeInsets.only(right: MARGIN_SIZE_DEFAULT),
                          child: Text(
                            '$CURRENCY_TYPE_SYMBOL ${controller.additionalIPMap['price']}',
                            style: TextStyleApp.b1(),
                          ),
                      ),
                    ],
                  );
                }
              ),
              const Divider(),
              Consumer<QuoteController>(
                builder: (context, controller, _) {
                  return ResumenTotalItem(
                    l10n.total, 
                    value: doubleToAsFixedDecimals(controller.totalPriceQuoter).toString(),
                  );
                }
              ),
              const Divider(),
              const SizedBox(height: MARGIN_SIZE_DEFAULT),
              quoteController.totalPriceQuoter > 0
                ? Consumer<QuoteController>(
                    builder: (context, controller, _) {
                      return MaterialButton(
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(RADIUS_SIZE_XXXLL)),
                          elevation: 2,
                          color: whiteColor,
                          height: RADIUS_SIZE_XXLARGE,
                        child: Container(
                          padding: const EdgeInsets.all(PADDING_SIZE_DEFAULT),
                          decoration: BoxDecoration(
                            color: Colors.transparent,
                            borderRadius: BorderRadius.circular(RADIUS_SIZE_XXLARGE),
                          ),
                          child: const Icon(Icons.share, color: purpleColor),
                        ),
                        onPressed: () async => controller.pressedShare ? await controller.handleShareAllPlatforms() : null,
                      );
                    }
                  )
                : const SizedBox(),
              quoteController.totalPriceQuoter > 0
                ? Consumer<QuoteController>(
                    builder: (context, controller, _) {
                      return ThemeButton(
                        title: l10n.quote, 
                        onPress: () async => await controller.handleGeneratedPDF()
                      );
                    }
                  )
                : const SizedBox(),
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
        const SizedBox(width: WIDTH_ICON_BUTTON),
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
