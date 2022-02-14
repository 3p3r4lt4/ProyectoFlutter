import 'package:flutter/material.dart';
import 'package:flxtech/core/style/text_style_app.dart';
import 'package:flxtech/core/theme/colors_app.dart';
import 'package:flxtech/core/values/dimensions.dart';

class ResumenTotalItem extends StatelessWidget {
  const ResumenTotalItem(
    this.title, {
    this.isTotal = true,
    required this.value,
  });
  final String title;
  final bool isTotal;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text(
          title,
          style: TextStyleApp.b1().copyWith(
            color: darkColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        Container(
          margin: const EdgeInsets.only(left: MARGIN_SIZE_SMALL, right: MARGIN_SIZE_EXTRA_LARGE),
          padding: const EdgeInsets.only(right: MARGIN_SIZE_SMALL, top: 2.5, bottom: 2.5),
          width: MediaQuery.of(context).size.width * 0.3,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(RADIUS_SIZE_SMALL),
            border: Border.all(
              color: darkColor,
            ),
            color: isTotal ? darkColor : whiteColor,
          ),
          child: Text(
            value,
            textAlign: TextAlign.end,
            style: TextStyleApp.b1().copyWith(
              color: isTotal ? whiteColor : darkColor,
            ),
          ),
        ),
      ],
    );
  }
}