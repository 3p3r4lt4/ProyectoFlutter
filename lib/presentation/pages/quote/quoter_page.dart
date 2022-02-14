import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:flxtech/core/style/text_style_app.dart';
import 'package:flxtech/core/values/dimensions.dart';
import 'package:flxtech/generated/l10n.dart';
import 'package:flxtech/presentation/controllers/quote/quoter_controller.dart';
import 'package:flxtech/presentation/widgets/scaffold_container.dart';
import 'package:flxtech/presentation/widgets/theme_dropdown.dart';

class QuoterPage extends StatelessWidget {
  const QuoterPage();

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
            child: Text(
              l10n.bagOfMinutes,
              style: TextStyleApp.h1()
            ),
          ),
          Consumer<QuoteController>(
            builder: (context, controller, _) {
              final String key = 'local_landline';
              // print(controller.quantityFeedMap);
              return ThemeDropDown(
                isExpanded: true,
                paddingHorizontal: PADDING_SIZE_LARGE,
                listItems: List.generate(controller.quantityFeedMap.length, (index) {
                  final int quantityFeed = controller.quantityFeedMap[index]!;
                  return DropdownMenuItem(
                    value: '$quantityFeed',
                    child: Text(quantityFeed.toString()),
                  );
                }),
                valueSelected: controller.bagOfMinutesQuote[key]!['quantity'].toString(),
                onChanged: (dynamic value) {
                  controller.loadBagOfMinutesQuote(key,value);
                },
              );
            }
          )
        ],
      ),
    );
  }
}
