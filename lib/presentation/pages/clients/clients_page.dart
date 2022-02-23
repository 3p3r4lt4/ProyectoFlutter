import 'package:flutter/material.dart';
import 'package:flxtech/core/style/text_style_app.dart';
import 'package:flxtech/generated/l10n.dart';
import 'package:flxtech/presentation/widgets/scaffold_container.dart';

class ClientsPage extends StatelessWidget {
  const ClientsPage();

  @override
  Widget build(BuildContext context) {
    final S l10n = S.current;
    return ScaffoldContainer(
      l10n.servers,
      body: Center(
        child: Text(
          l10n.clients,
          style: TextStyleApp.b1(),
        ),
      ),
    );
  }
}