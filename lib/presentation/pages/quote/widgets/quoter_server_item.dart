import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flxtech/core/env/environment.dart';
import 'package:flxtech/core/style/text_style_app.dart';
import 'package:flxtech/core/values/dimensions.dart';
import 'package:flxtech/presentation/controllers/quote/quoter_controller.dart';
import 'package:flxtech/presentation/widgets/theme_text_formfield.dart';

class QuoterServerItem extends StatelessWidget {
  const QuoterServerItem(
    this.keyService, {
    this.onTap,
    required this.server,
    required this.controller,
    required this.textEditingController,
  });

  final Map<String, dynamic> server;
  final Function? onTap;
  final String keyService;
  final QuoteController controller;
  final TextEditingController textEditingController;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: Container(
            margin: const EdgeInsets.only(left: MARGIN_SIZE_DEFAULT),
            child: Text(
              server['name'],
              style: TextStyleApp.caption(),
            ),
          ),
        ),
        ThemeTextFormField(
          width: (MediaQuery.of(context).size.width - 120) / 3,
          // initialValue: server['quantity'].toString(),
          textInputType: TextInputType.number,
          textEditingController: textEditingController,
          onChanged: (String value) {
            if (value.isNotEmpty)
              controller.loadServicesQuote(keyService, value);
          },
        ),
        Container(
          width: WIDTH_SHORT_TEXT_FORM,
          alignment: Alignment.centerRight,
          margin: const EdgeInsets.only(right: MARGIN_SIZE_DEFAULT),
            child: Text(
              '$CURRENCY_TYPE_SYMBOL ${server['price']}',
              style: TextStyleApp.b1(),
            ),
        ),
      ],
    );
  }
}
