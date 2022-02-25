import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:flxtech/core/values/dimensions.dart';
import 'package:flxtech/generated/l10n.dart';
import 'package:flxtech/presentation/widgets/cards/card_container.dart';

class CardIfNoContent extends StatelessWidget {
  const CardIfNoContent();

  @override
  Widget build(BuildContext context) {
    final S l10n = S.current;
    return CardContainer(
        margin: const EdgeInsets.symmetric(vertical: MARGIN_SIZE_DEFAULT, horizontal: MARGIN_SIZE_DEFAULT),
        padding: const EdgeInsets.symmetric(horizontal: PADDING_SIZE_SMALL, vertical: PADDING_SIZE_XXLARGE),
        children: [
          SvgPicture.asset(
            'assets/icons/computer.svg',
            height: ICON_SIZE_XXLARGE,
          ),
          const SizedBox(height: MARGIN_SIZE_EXTRA_SMALL),
          Text(
            l10n.noRecordFound,
            textAlign: TextAlign.center,
          )
        ],
      );
  }
}