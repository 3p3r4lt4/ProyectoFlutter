import 'package:flutter/material.dart';

import 'package:flxtech/core/style/text_style_app.dart';
import 'package:flxtech/generated/l10n.dart';
import 'package:flxtech/presentation/widgets/scaffold_container.dart';

class ContactPage extends StatelessWidget {
  const ContactPage();

  @override
  Widget build(BuildContext context) {
    final S l10n = S.current;
    return ScaffoldContainer(
      l10n.contact,
      body: Center(
        child: Text(
          l10n.contact,
          style: TextStyleApp.b1(),
        ),
      ),
    );
  }
}