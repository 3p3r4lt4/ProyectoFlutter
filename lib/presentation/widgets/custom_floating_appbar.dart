import 'package:flutter/material.dart';

import 'package:flxtech/core/theme/colors_app.dart';
import 'package:flxtech/core/values/dimensions.dart';

class CustomFloatingAppBar extends StatelessWidget {
  const CustomFloatingAppBar({
    required this.title,
    this.rightPressed,
    this.haveReturn = false,
    required this.tolTip,
  });
  final String title;
  final double barHeight = BAR_HEIGHT;
  final void Function()? rightPressed;
  final bool haveReturn;
  final String tolTip;

  Widget _getRightButton() => IconButton(
    icon: Icon(Icons.help_outline_rounded, color: whiteColor),
    onPressed: rightPressed,
    tooltip: tolTip,
  );

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    final double statusbarHeight = MediaQuery.of(context).padding.top;
    return Container(
      height: statusbarHeight + barHeight,
      width: width,
      padding: EdgeInsets.only(top: statusbarHeight),
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [primaryColor, primaryColor]),
      ),
      child: Stack(
        children: <Widget>[
          Align(
            alignment: Alignment.centerLeft,
            child: IconButton(
              icon: Icon(Icons.arrow_back, color: Colors.white),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: _getRightButton(),
          ),
        ],
      ),
    );
  }
}
