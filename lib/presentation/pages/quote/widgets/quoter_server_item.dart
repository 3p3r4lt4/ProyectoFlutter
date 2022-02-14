import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import 'package:flxtech/core/style/text_style_app.dart';
import 'package:flxtech/core/theme/colors_app.dart';
import 'package:flxtech/core/values/dimensions.dart';
import 'package:flxtech/generated/l10n.dart';
import 'package:flxtech/presentation/controllers/quote/quoter_controller.dart';
import 'package:flxtech/presentation/widgets/theme_text_formfield.dart';

class QuoterServerItem extends StatelessWidget {
  const QuoterServerItem(
    this.service, {
    this.onTap,
    required this.keyService,
  });

  final Map<String, dynamic> service;
  final Function? onTap;
  final String keyService;

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
    Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.only(left: MARGIN_SIZE_SMALL),
          child: Text(
            label,
            style: TextStyleApp.caption(),
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

  Widget _buildEditServiceItem(BuildContext context, S l10n) {
    return Column(
      children: [
        const Divider(
          height: MARGIN_SIZE_LARGE, 
          color: grayColor,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Consumer<QuoteController>(
              builder: (context, controller, _) {
                return _buildTextFormField(
                  service['name'],
                  context,
                  initialValue: service['quantity'].toString(),
                  onChanged: (String value) {
                    controller.loadBagOfMinutesQuote(keyService, value);
                  }
                );
              }
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildContent(context, l10n) {

    return Container(
      margin: const EdgeInsets.only(left: MARGIN_SIZE_DEFAULT),
      width: MediaQuery.of(context).size.width - MARGIN_SIZE_DEFAULT * 2,
      child: _buildEditServiceItem(context, l10n)
    );
  }

  @override
  Widget build(BuildContext context) {
    final S l10n = S.current;
    return InkWell(
      onTap: () => onTap,
      child: _buildContent(context, l10n),
    );
  }
}
