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
    this.isWavefooter = false,
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
  final bool isWavefooter;

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
          : SafeArea(
            child: isWavefooter
              ? Container(
                color: whiteColor,
                height: double.maxFinite,
                width: double.maxFinite,
                child: CustomPaint(
                  painter: _WaveFooter(),
                  child: body,
                ),
              )
              : body,
          ),
    );
  }
}

class _WaveFooter extends CustomPainter {
  const _WaveFooter();


  @override
  void paint(Canvas canvas, Size size) {
    
    final Paint paint = Paint()
      ..color = primaryColor
      // ..blendMode = BlendMode.hardLight
      ..isAntiAlias = true
      ..style = PaintingStyle.fill
      ..strokeWidth = 20;

    final Path path = Path()
      ..lineTo(0, size.height*0.75)
      ..quadraticBezierTo(size.width*0.25, size.height*0.85, size.width*0.5, size.height*0.75)
      ..quadraticBezierTo(size.width*0.75, size.height*0.65, size.width, size.height*0.75)
      ..lineTo(size.width, size.height)
      ..lineTo(0.0, size.height);

    canvas.drawPath(path, paint);
    
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

  
}
