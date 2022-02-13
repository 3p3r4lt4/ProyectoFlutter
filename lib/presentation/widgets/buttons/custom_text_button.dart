import 'package:flutter/material.dart';

import 'package:flxtech/core/style/text_style_app.dart';
import 'package:flxtech/core/theme/colors_app.dart';

class CustomTextButton extends StatelessWidget {
  const CustomTextButton(this.title,{
    this.onPressed,
    this.color = orangeColor
  });
  final String title;
  final void Function()? onPressed;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      alignment: Alignment.center,
      child: Text(
        title,
        style: TextStyleApp.b1().copyWith(
          color: color,
        ),
      ),
    );
  }
}