import 'package:flutter/material.dart';

import 'package:flxtech/core/style/text_style_app.dart';
import 'package:flxtech/core/theme/colors_app.dart';
import 'package:flxtech/core/values/dimensions.dart';
import 'package:flxtech/presentation/widgets/custom_floating_appbar.dart';

class ScaffoldContainer extends StatelessWidget {
  const ScaffoldContainer(
    this.title, {
    this.isCustomAppBar = false,
    this.isCustomFloatingAppBar = false,
    this.rightPressed,
    this.haveReturn = true,
    this.colorAppBar = primaryColor,
    this.toltip = 'help',
    this.rightIcon = Icons.help_outline_rounded,
    this.titleColor = whiteColor,
    required this.body,
  });
  final bool isCustomAppBar;
  final bool isCustomFloatingAppBar;
  final void Function()? rightPressed;
  final bool haveReturn;
  final String title;
  final Color colorAppBar;
  final String toltip;
  final IconData rightIcon;
  final Color titleColor;
  final double barHeight = BAR_HEIGHT;
  final Widget body;

  PreferredSize _buildCustomAppBar(BuildContext context) {
    final double heightStatusBar = MediaQuery.of(context).padding.top;
    return PreferredSize(
      preferredSize: Size(double.maxFinite, BAR_HEIGHT),
      child: Stack(
        children: [
          Container(
              margin: EdgeInsets.only(top: heightStatusBar),
              alignment: Alignment.center,
              child: Text(
                title,
                style: TextStyleApp.b1(),
              ),
              color: colorAppBar),
          haveReturn
              ? Positioned(
                  left: MARGIN_SIZE_EXTRA_SMALL,
                  bottom: MARGIN_SIZE_EXTRA_SMALL,
                  child: IconButton(
                      onPressed: () => Navigator.of(context).pop(),
                      icon: const Icon(Icons.arrow_back, color: whiteColor)),
                )
              : const SizedBox(),
          rightPressed != null
              ? Positioned(
                  right: MARGIN_SIZE_EXTRA_SMALL,
                  bottom: MARGIN_SIZE_EXTRA_SMALL,
                  child: IconButton(
                    icon: Icon(rightIcon, color: titleColor),
                    onPressed: rightPressed,
                    tooltip: toltip,
                  ),
                )
              : const SizedBox(),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final double heightStatusBar = MediaQuery.of(context).padding.top;
    return Scaffold(
      appBar: isCustomAppBar ? _buildCustomAppBar(context) : null,
      body: isCustomFloatingAppBar
          ? Stack(
              children: <Widget>[
                CustomFloatingAppBar(
                  title: title,
                  rightPressed: rightPressed,
                  haveReturn: haveReturn,
                  toltip: toltip,
                ),
                Container(
                  padding:
                      EdgeInsets.only(top: heightStatusBar + barHeight / 2),
                  child: body,
                ),
              ],
            )
          : SafeArea(child: body),
    );
  }
}
