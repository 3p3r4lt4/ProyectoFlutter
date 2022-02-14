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

  Widget _buildTextFormField(
    String label, 
    // String field, 
    BuildContext context,{
      Widget? leftWidget,
      List<TextInputFormatter>? inputFormatters,
      void Function(String)? onChanged,
      String? initialValue,
      TextInputType textInputType = TextInputType.number,
    }) =>
    Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Container(
            margin: const EdgeInsets.only(left: MARGIN_SIZE_SMALL),
            child: Text(
              label,
              style: TextStyleApp.caption(),
            ),
          ),
        ),
        ThemeTextFormField(
          width: (MediaQuery.of(context).size.width - 120)/3,
          leftWidget: leftWidget,
          inputFormatters: inputFormatters,
          onChanged: onChanged,
          initialValue: initialValue,
          textInputType: textInputType,
        )
      ],
    );

  @override
  Widget build(BuildContext context) {
    return _buildTextFormField(
      service['name'],
      context,
      initialValue: service['quantity'].toString(),
      onChanged: (String value) {
        if (value.isNotEmpty) controller.loadServicesQuote(keyService, value);
      }
    );
  }
}
