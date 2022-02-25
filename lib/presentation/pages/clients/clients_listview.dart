import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:flxtech/core/theme/colors_app.dart';
import 'package:flxtech/core/values/dimensions.dart';
import 'package:flxtech/domain/entities/circuit.dart';
import 'package:flxtech/presentation/controllers/circuit/circuits_controller.dart';
import 'package:flxtech/presentation/widgets/cards/item_custom_row_card.dart';


class ClientsListView extends StatelessWidget {
  const ClientsListView();

  @override
  Widget build(BuildContext context) {
    return Consumer<CircuitController>(builder: (context, controller, _) {
      final fetchedCircuits = controller.fetchCircuits;
      return Expanded(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
          child: Container(
            child: ListView(
                    shrinkWrap: true,
                    physics: const BouncingScrollPhysics(),
                    children: [
                      Wrap(
                        runSpacing: 0,
                        spacing: MARGIN_SIZE_EXTRA_SMALL,
                        children: List.generate(fetchedCircuits.length, (index) {
                          String key = fetchedCircuits.keys.elementAt(index);
                          Circuit? circuit = fetchedCircuits[key];
                          return ItemRowCustomCard(
                            title: circuit!.organizationName,
                            isSeeMore: true,
                            iconLeft: Icons.person,
                            iconLeftColor: primaryColor,
                            // rightAction: () =>
                            //     _navClientDetail(fetchedCircuits[key]!, context),
                          );
                        }),
                      ),
                      const SizedBox(height: MARGIN_SIZE_DEFAULT),
                    ],
                  ),
          ),
        ),
      );
    });
  }

  // void _navClientDetail(Circuit circuit, BuildContext context) {
  //   Navigator.of(context).push(MaterialPageRoute(builder: (context) {
  //     return ClientDetailScreen(client);
  //   }));
  // }
}
