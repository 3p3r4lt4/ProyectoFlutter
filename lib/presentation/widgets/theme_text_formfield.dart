import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flxtech/core/style/text_style_app.dart';
import 'package:flxtech/core/theme/colors_app.dart';
import 'package:flxtech/core/values/dimensions.dart';
import 'package:flxtech/generated/l10n.dart';

class ThemeTextFormField extends StatelessWidget {
  const ThemeTextFormField({
    this.textEditingController,
    this.hint,
    this.textInputAction = TextInputAction.next,
    this.validator,
    this.leftIcon,
    this.rightIcon,
    this.onRightTap,
    this.textInputType = TextInputType.name,
    this.obscureText = false,
    this.onChanged,
    this.onSubmitted,
    this.borderRadius = RADIUS_SIZE_SMALL,
    this.width,
    this.maxLines,
    this.hintColor = grayColor,
    this.leftWidget,
    this.inputFormatters,
    this.initialValue,
    this.color = grayColor,
    this.onTap,
    // this.width = MARGIN_SIZE_XXLARGE,
  });

  final TextEditingController? textEditingController;
  final String? hint;
  final TextInputType? textInputType;
  final IconData? leftIcon;
  final IconData? rightIcon;
  final String? Function(String?)? validator;
  final bool obscureText;
  final void Function()? onRightTap;
  final TextInputAction textInputAction;
  final void Function(String)? onChanged;
  final void Function(String)? onSubmitted;
  final double borderRadius;
  final double? width;
  final int? maxLines;
  final Color hintColor;
  final Widget? leftWidget;
  final List<TextInputFormatter>? inputFormatters;
  final String? initialValue;
  final Color color;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {

    final S l10n = S.current;

    final bool haveLeftIcon = leftIcon != null;
    final bool haveRightIcon = rightIcon != null;
    final bool haveLeftWidget = leftWidget != null;

    InputDecoration _buildInputDecoration() {
      return InputDecoration(
        alignLabelWithHint: true,
        border: InputBorder.none,
        contentPadding: EdgeInsets.only(
            top: 0, 
            bottom: 0, 
            left: haveRightIcon || haveLeftIcon 
              ? MARGIN_SIZE_SMALL 
              : haveLeftWidget
                ? MARGIN_SIZE_XXLARGE
                : MARGIN_SIZE_LARGE
            ),
        hintText: hint,
        isDense: true,
        hintMaxLines: 1,
        prefixIcon: haveLeftIcon ? Padding(
          padding: const EdgeInsetsDirectional.only(start: 12),
          child: Icon(leftIcon, color: color),
        ) : null ,
        hintStyle: TextStyleApp.b2().copyWith(
          fontSize: MARGIN_SIZE_DEFAULT,
          color: hintColor,
        ),
        
        suffixIcon: haveRightIcon ? GestureDetector(
          onTap: onRightTap ?? () {},
          child: Padding(
            padding: const EdgeInsetsDirectional.only(end: 12),
            child: Icon(rightIcon, color: whiteColor),
          ),
        ) : null ,
        
      );
    }

    Widget _buildInputTextFormfield() => TextFormField(

          onChanged: onChanged,
          onFieldSubmitted: onSubmitted,
          style: TextStyleApp.b1(),
          onTap: onTap,
          textInputAction: textInputAction,
          obscureText: obscureText,
          cursorColor: greenColor,
          maxLines: maxLines,
          initialValue: initialValue,
          inputFormatters: inputFormatters,
          validator: validator ?? (String? value) {
            return value!.isEmpty ? l10n.required : null;
          },
          keyboardType: textInputType,
          decoration: _buildInputDecoration(),
        );

    return Stack(
      children: [
        Material(
            borderRadius: BorderRadius.circular(borderRadius),
            color: Colors.transparent,
            child: Container(
              child: _buildInputTextFormfield(),
              width: width,
              decoration: BoxDecoration(
                color: whiteColor,
                border: Border.all(
                  width: 0.3,
                  color: color,
                ),
                borderRadius: BorderRadius.circular(borderRadius),
              ),
              margin: const EdgeInsets.symmetric(vertical: MARGIN_SIZE_EXTRA_SMALL, horizontal: MARGIN_SIZE_EXTRA_SMALL),
              // padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          ),
        ),
        
        Positioned(
          left: 5,
          top: 5,
          child: haveLeftWidget
            ? leftWidget!
            : const SizedBox(),
        )

      ],
    );
  }
}
