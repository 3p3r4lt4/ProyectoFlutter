import 'dart:ui';
import 'package:flutter/material.dart';

class CardBlurred extends StatelessWidget {
  final List<Widget> children;
  final EdgeInsetsGeometry margin;
  final EdgeInsetsGeometry padding;
  final double borderRadius;
  final double elevation;
  final List<Color>? colors;
  final CrossAxisAlignment? crossAxisAlignment;

  CardBlurred({
    required this.children,
    this.margin = const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5),
    this.padding = const EdgeInsets.all(15),
    this.borderRadius = 5.0,
    this.elevation = 5.0,
    this.colors,
    this.crossAxisAlignment,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      child: ClipRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
          child: Container(
            padding: padding,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(borderRadius),
              gradient: LinearGradient(
                  colors: colors ??
                      [
                        Colors.white.withOpacity(0.8),
                        Colors.grey.shade100.withOpacity(0.8)
                      ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight),
              // color: ,
            ),
            child: Column(
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
