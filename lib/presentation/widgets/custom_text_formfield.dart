import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flxtech/core/style/text_style_app.dart';
import 'package:flxtech/core/theme/colors_app.dart';
import 'package:flxtech/core/values/dimensions.dart';
import 'package:flxtech/generated/l10n.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
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
    this.hintColor,
    this.leftWidget,
    this.inputFormatters,
    this.initialValue,
    this.onTap,
    this.label,
    this.readOnly = false,
    this.isDense = false,
    this.labelColor,
    this.prefxColor,
    this.sufxColor,
    this.fieldColor,
    this.fieldBorderColor,
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
  final void Function()? onTap;
  final TextInputAction textInputAction;
  final void Function(String)? onChanged;
  final void Function(String)? onSubmitted;
  final double borderRadius;
  final double? width;
  final int? maxLines;
  final Color? hintColor;
  final Widget? leftWidget;
  final List<TextInputFormatter>? inputFormatters;
  final String? initialValue;
  final String? label;
  final bool readOnly;
  final bool isDense;
  final Color? labelColor; 
  final Color? prefxColor; 
  final Color? sufxColor;
  final Color? fieldColor;
  final Color? fieldBorderColor;

  @override
  Widget build(BuildContext context) {

    final S l10n = S.current;

    final bool haveLeftIcon = leftIcon != null;
    final bool haveRightIcon = rightIcon != null;
    final bool haveLeftWidget = leftWidget != null;

    InputDecoration _buildInputDecoration() {
      return InputDecoration(
        
        alignLabelWithHint: true,
        labelText: label,
        labelStyle: TextStyle(
          color: labelColor ?? darkColor,
        ),
        border: InputBorder.none,
        contentPadding: EdgeInsets.only(
            top: MARGIN_SIZE_SMALL, 
            bottom: MARGIN_SIZE_SMALL, 
            left: haveRightIcon || haveLeftIcon 
              ? MARGIN_SIZE_SMALL 
              : haveLeftWidget
                ? MARGIN_SIZE_XXLARGE
                : MARGIN_SIZE_LARGE
            ),
        hintText: hint,
        isDense: isDense,
        hintMaxLines: 1,
        prefixIcon: haveLeftIcon ? Padding(
          padding: const EdgeInsetsDirectional.only(start: 12),
          child: Icon(leftIcon, color: grayColor),
        ) : null ,
        hintStyle: TextStyleApp.b1().copyWith(
          color: hintColor ?? grayColor,
        ),
        suffixIcon: haveRightIcon ? GestureDetector(
          onTap: onRightTap ?? () {},
          child: Padding(
            padding: const EdgeInsetsDirectional.only(end: 12),
            child: Icon(rightIcon, color: purpleColor),
          ),
        ) : null ,
        
      );
    }

    Widget _buildInputTextFormfield() => TextFormField(

          onChanged: onChanged,
          onTap: onTap,
          readOnly: readOnly,
          controller: textEditingController,
          onFieldSubmitted: onSubmitted,
          style: TextStyleApp.b1(),
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
        Container(
          margin: const EdgeInsets.symmetric(horizontal: MARGIN_SIZE_LARGE, vertical: MARGIN_SIZE_SMALL),
          child: Material(
              elevation: 2,
              borderRadius: BorderRadius.circular(borderRadius),
              color: Colors.white,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: PADDING_SIZE_DEFAULT),
                child: _buildInputTextFormfield(),
                width: width,
                decoration: BoxDecoration(
                  color: fieldColor ?? whiteColor,
                  border: Border.all(
                    width: 0.05,
                    color: fieldBorderColor ?? grayColor,
                  ),
                  borderRadius: BorderRadius.circular(borderRadius),
                ),
                margin: const EdgeInsets.all(0),
            ),
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
