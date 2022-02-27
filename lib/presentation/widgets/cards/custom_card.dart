import 'package:flutter/material.dart';
import 'package:flxtech/core/theme/colors_app.dart';

import 'package:flxtech/core/values/dimensions.dart';
import 'package:flxtech/presentation/widgets/cards/card_container.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({
    this.colorIndicator,
    this.textColor,
    this.rightAction,
    required this.children,
    this.margin,
    this.padding,
    this.borderRadius = RADIUS_SIZE_SMALL,
  });

  final Color? textColor;
  final Color? colorIndicator;
  final void Function()? rightAction;
  final List<Widget> children;
  final EdgeInsets? margin;
  final EdgeInsets? padding;
  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    final useRightIcon = rightAction != null;
    return InkWell(
      onTap: rightAction,
      child: Container(
        child: Stack(
          children: [
            CardContainer(
              borderRadius: borderRadius,
              children: children,
              color: whiteColor,
              padding: padding ?? const EdgeInsets.only(
                  left: MARGIN_SIZE_EXTRA_LARGE,
                  right: MARGIN_SIZE_EXTRA_SMALL,
                  top: MARGIN_SIZE_LARGE,
                  bottom: MARGIN_SIZE_LARGE),
              margin: margin ?? const EdgeInsets.symmetric(vertical: 5),
            ),
            useRightIcon
              ? Positioned(
                right: MARGIN_SIZE_EXTRA_SMALL,
                top: 0,
                bottom: 0,
                child: Icon(Icons.arrow_forward_ios, color: grayColor),
              )
              : const SizedBox(),
          ],
        ),
      ),
    );
  }
}
