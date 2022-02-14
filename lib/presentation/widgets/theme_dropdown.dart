import 'package:flutter/material.dart';

import 'package:flxtech/core/theme/colors_app.dart';
import 'package:flxtech/core/values/dimensions.dart';

class ThemeDropDown extends StatelessWidget {
  const ThemeDropDown({
    required this.listItems,
    required this.valueSelected,
    required this.onChanged,
    this.itemHeight,
    this.isExpanded = false,
    this.hint,
    this.onTap,
    this.onlyItemInRow = false,
    this.paddingHorizontal = PADDING_SIZE_EXTRA_SMALL,
  });

  final List<DropdownMenuItem> listItems;
  final String valueSelected;
  final void Function(dynamic) onChanged;
  final double? itemHeight;
  final bool isExpanded;
  final String? hint;
  final void Function()? onTap;
  final bool onlyItemInRow;
  final double paddingHorizontal;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: paddingHorizontal),
        margin: onlyItemInRow 
          ? const EdgeInsets.only(
              right: MARGIN_SIZE_SMALL,
              top: MARGIN_SIZE_SMALL,
              bottom: MARGIN_SIZE_SMALL,
            )
          : const EdgeInsets.symmetric(vertical: MARGIN_SIZE_SMALL),
        decoration: BoxDecoration(
          border: Border.all(
            color: purpleColor,
          ),
          borderRadius: BorderRadius.circular(RADIUS_SIZE_SMALL),
        ),
        child: DropdownButton(
          hint: hint != null ? Text(hint!) : null,
          isExpanded: isExpanded,
          itemHeight: itemHeight,
          isDense: true,
          value: valueSelected,
          onChanged: onChanged,
          items: listItems,
          underline: const SizedBox(),
          icon: Icon(
            Icons.arrow_forward_ios_sharp,
            size: ICON_SIZE_SMALL,
          ),
        ),
      ),
    );
  }
}
