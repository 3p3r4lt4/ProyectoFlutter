import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flxtech/core/style/text_style_app.dart';
import 'package:flxtech/core/values/dimensions.dart';
import 'package:flxtech/presentation/controllers/quote/quoter_controller.dart';
import 'package:flxtech/presentation/widgets/theme_text_formfield.dart';

class QuoterServerItem extends StatelessWidget {
  const QuoterServerItem(
    this.keyService, {
    this.onTap,
    required this.service,
    required this.controller,
  });

  final Map<String, dynamic> service;
  final Function? onTap;
  final String keyService;
  final QuoteController controller;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: Container(
            margin: const EdgeInsets.only(left: MARGIN_SIZE_SMALL),
            child: Text(
              service['name'],
              style: TextStyleApp.caption(),
            ),
          ),
        ),
        ThemeTextFormField(
          // leftWidget: leftWidget,
          // inputFormatters: inputFormatters, use decimals
          // onTap: () => controller.loadServicesQuote(keyService, null),
          width: (MediaQuery.of(context).size.width - 120) / 3,
          initialValue: service['quantity'].toString(),
          textInputType: TextInputType.number,
          onChanged: (String value) {
            if (value.isNotEmpty)
              controller.loadServicesQuote(keyService, value);
          },

        ),
      ],
    );
  }
}
