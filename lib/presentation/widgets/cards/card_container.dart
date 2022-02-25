import 'package:flutter/material.dart';

import 'package:flxtech/core/theme/colors_app.dart';
import 'package:flxtech/core/values/dimensions.dart';

class CardContainer extends StatelessWidget {
  final List<Widget> children;
  final Color? color;
  final EdgeInsetsGeometry margin;
  final EdgeInsetsGeometry padding;
  final double elevation;
  final CrossAxisAlignment? crossAxisAlignment;
  final MainAxisAlignment? mainAxisAlignment;
  final Color borderColor;
  final double borderRadius;

  const CardContainer({
    required this.children,
    this.color,
    this.elevation = 2.0,
    this.crossAxisAlignment,
    this.mainAxisAlignment,
    this.margin = const EdgeInsets.symmetric(vertical: MARGIN_SIZE_EXTRA_SMALL),
    this.padding = const EdgeInsets.all(MARGIN_SIZE_EXTRA_SMALL),
    this.borderColor = Colors.transparent,
    this.borderRadius = MARGIN_SIZE_SMALL,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      child: Card(
        color: color ?? whiteColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        elevation: elevation,
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: borderColor,
              width: 2,
            ),
            borderRadius: BorderRadius.circular(borderRadius),
          ),
          child: Padding(
            padding: padding,
            child: Column(
              mainAxisAlignment: mainAxisAlignment ?? MainAxisAlignment.center,
              crossAxisAlignment:
                  crossAxisAlignment ?? CrossAxisAlignment.stretch,
              children: children,
            ),
          ),
        ),
      ),
    );
  }
}
