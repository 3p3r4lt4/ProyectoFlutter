import 'package:flxtech/core/values/dimensions.dart';
import 'package:shimmer/shimmer.dart';
import 'package:flutter/material.dart';

import 'package:flxtech/core/theme/colors_app.dart';
import 'package:flxtech/presentation/widgets/cards/card_blurred.dart';

class ItemsRowLoader extends StatelessWidget {
  const ItemsRowLoader();
  @override
  Widget build(BuildContext context) {
    return CardBlurred(children: <Widget>[
      Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Shimmer.fromColors(
            baseColor: grayColor,
            highlightColor: grayDarkColor,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 38.0,
                    height: 38.0,
                    color: Colors.white,
                  ),
                  SizedBox(width: 10),
                  Flexible(
                    fit: FlexFit.loose,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          width: 160,
                          height: 18.0,
                          color: Colors.white,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: PADDING_SIZE_EXTRA_SMALL),
                        ),
                        Container(
                          width: 160,
                          height: 12.0,
                          color: Colors.white,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: MARGIN_SIZE_SMALL),
                  Flexible(
                    fit: FlexFit.loose,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            const Icon(
                              Icons.fiber_manual_record,
                              color: grayDarkColor,
                            ),
                            const SizedBox(width: MARGIN_SIZE_EXTRA_SMALL),
                            Container(
                              width: MARGIN_SIZE_XXLARGE,
                              height: 12.0,
                              color: Colors.white,
                            )
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    ], 
    margin: EdgeInsets.symmetric(vertical: MARGIN_SIZE_EXTRA_SMALL));
  }
}
