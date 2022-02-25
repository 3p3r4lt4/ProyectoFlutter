import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:flxtech/core/theme/colors_app.dart';
import 'package:flxtech/core/values/dimensions.dart';
import 'package:flxtech/generated/l10n.dart';
import 'package:flxtech/presentation/controllers/circuit/circuits_controller.dart';
import 'package:flxtech/presentation/pages/clients/clients_listview.dart';
import 'package:flxtech/presentation/widgets/cards/card_if_no_content.dart';
import 'package:flxtech/presentation/widgets/scaffold_container.dart';


class ClientsPage extends StatelessWidget {
  
  const ClientsPage();
  
  @override
  Widget build(BuildContext context) {
    final S l10n = S.current;
    final circuitController = Provider.of<CircuitController>(context, listen: false);
    return ScaffoldContainer(
      l10n.clients,
      haveReturn: false,
      isCustomAppBar: true,
      rightIcon: Icons.people_outline_outlined,
      rightPressed: () {
        // FocusScope.of(context).requestFocus(FocusNode());
        // quoteController.handleCleanQuoter();
      },
      body: Container(
        margin: const EdgeInsets.only(
          left: MARGIN_SIZE_DEFAULT,
          right: MARGIN_SIZE_DEFAULT,
          top: MARGIN_SIZE_SMALL,
        ),
        child: Column(
          children: [
            const Divider(height: 1),

            context.select((CircuitController n) => n.isLoading)
              ? const CircularProgressIndicator(color: purpleColor)
              : circuitController.fetchCircuits.isNotEmpty
                      ? const ClientsListView()
                      : const CardIfNoContent(),
            
          ],
        ),
      ),
    );
  }

}