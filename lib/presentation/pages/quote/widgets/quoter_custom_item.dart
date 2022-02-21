import 'package:flutter/material.dart';

import 'package:flxtech/core/env/environment.dart';
import 'package:flxtech/core/style/text_style_app.dart';
import 'package:flxtech/core/values/dimensions.dart';
import 'package:flxtech/presentation/controllers/quote/quoter_controller.dart';
import 'package:flxtech/presentation/widgets/theme_text_formfield.dart';

class QuoterCustomItem extends StatelessWidget {
  const QuoterCustomItem(
    this.item, {
    this.onTap,
    required this.controller,
    this.isAdditional = true,
    this.textEditingController,
  });

  final Map<String, dynamic> item;
  final Function? onTap;
  final QuoteController controller;
  final bool isAdditional;
  final TextEditingController? textEditingController;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: Container(
            margin: const EdgeInsets.only(left: MARGIN_SIZE_DEFAULT),
            child: Text(
              item['name'],
              style: TextStyleApp.caption(),
            ),
          ),
        ),
        ThemeTextFormField(
          width: (MediaQuery.of(context).size.width - 120) / 3,
          initialValue: textEditingController == null
            ? item['quantity'].toString()
            : null,
          textEditingController: textEditingController,
          textInputType: TextInputType.number,
          onChanged: (String value) {
            if (value.isNotEmpty) {
              isAdditional
                ? controller.loadAdditionalIPQuote(value)
                : controller.loadInstallationsQuote(value);
            }
          },
        ),
        Container(
          width: WIDTH_SHORT_TEXT_FORM,
          alignment: Alignment.centerRight,
          margin: const EdgeInsets.only(right: MARGIN_SIZE_DEFAULT),
            child: Text(
              '$CURRENCY_TYPE_SYMBOL ${item['price']}',
              style: TextStyleApp.b1(),
            ),
        ),
      ],
    );
  }
}
