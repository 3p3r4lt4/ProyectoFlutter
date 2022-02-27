import 'package:flutter/material.dart';

import 'package:flxtech/core/style/text_style_app.dart';
import 'package:flxtech/core/theme/colors_app.dart';
import 'package:flxtech/core/values/dimensions.dart';
import 'package:flxtech/generated/l10n.dart';


class ItemRowCustomCard extends StatelessWidget {
  const ItemRowCustomCard({
    required this.title,
    this.backgroundColor,
    this.textColor,
    this.rightAction,
    this.isActive = false,
    this.borderRadius = MARGIN_SIZE_SMALL,
    this.contentWidget,
    this.iconLeft,
    this.iconLeftColor = purpleColor,
    this.isSeeMore = false,
    this.moreText,
    this.subTitle,
  });

  final Color? backgroundColor;
  final Color? textColor;
  final String title;
  final void Function()? rightAction;
  final bool isActive;
  final double borderRadius;
  final Widget? contentWidget;
  final IconData? iconLeft;
  final Color iconLeftColor;
  final bool isSeeMore;
  final String? moreText;
  final String? subTitle;

  Widget _buildTitle() {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: MARGIN_SIZE_EXTRA_SMALL),
        child: Text(
          title,
          style: TextStyleApp.b2(),
        ),
      ),
    );
  }
  Widget _buildSubTitle() {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: MARGIN_SIZE_EXTRA_SMALL),
      child: Text(
        subTitle!,
        style: TextStyleApp.caption().copyWith(
          color: grayColor,
        )
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final bool isLeftIcon = iconLeft != null;
    final S l10n = S.current;
    return InkWell(
      onTap: rightAction ?? () {},
      child: Container(
        height: 70,
        margin: const EdgeInsets.only(bottom: MARGIN_SIZE_SMALL),
        child: Material(
          elevation: 2,
          borderRadius: BorderRadius.circular(RADIUS_SIZE_SMALL),
          color: whiteColor,
            child: Container(
              // margin: const EdgeInsets.only(left: MARGIN_SIZE_EXTRA_SMALL),
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Container(
                    margin: isSeeMore ? const EdgeInsets.only(right: MARGIN_SIZE_XXXLARGE) : const EdgeInsets.only(right: MARGIN_SIZE_XXLARGE),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        isLeftIcon
                          ? Container(
                            margin: const EdgeInsets.symmetric(horizontal: MARGIN_SIZE_SMALL),
                            child: Icon(iconLeft, color: iconLeftColor)
                          )
                          : const SizedBox(width: MARGIN_SIZE_DEFAULT),
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              contentWidget 
                                ?? _buildTitle(),
                              subTitle != null
                                ? _buildSubTitle()
                                : const SizedBox(),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  isSeeMore
                    ? Positioned(
                        bottom: 5,
                        right: 5,
                        child: Row(
                          children: [
                            Text(moreText ?? l10n.seeMore, style: TextStyleApp.caption().copyWith(
                              color: purpleColor,
                            )),
                            Icon(Icons.arrow_forward_ios_rounded, color: purpleColor, size: ICON_SIZE_EXTRA_SMALL),
                          ],
                        ),
                      )
                    : Positioned(
                      right: 5,
                      bottom: 0,
                      top: 0,
                      child: const Icon(Icons.arrow_forward_ios_rounded, color: grayColor),
                      ),
                ],
              ),
            )
        ),
      ),
    );
  }
}
