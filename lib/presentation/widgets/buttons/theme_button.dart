import 'package:flutter/material.dart';

import 'package:flxtech/core/theme/colors_app.dart';
import 'package:flxtech/core/values/dimensions.dart';

class ThemeButton extends StatelessWidget {
  const ThemeButton({
    required this.title,
    required this.onPress,
    this.margin,
    this.borderRadius = RADIUS_SIZE_SMALL,
    this.buttonColor,
    this.textColor,
  });

  final void Function()? onPress;
  final String title;
  final EdgeInsets? margin;
  final double borderRadius;
  final Color? buttonColor;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: MARGIN_SIZE_LARGE, horizontal: MARGIN_SIZE_XXXLL),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius),
      ),

      child: MaterialButton(
        onPressed: onPress,
        padding: const EdgeInsets.all(PADDING_SIZE_DEFAULT),
        color: buttonColor ?? purpleColor,
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius),
        ),

        child: Text(
          title,
          style: TextStyle(
            color: textColor ?? whiteColor,
            fontSize: 18,
          ),
        ),

      ),

    );
  }
}
