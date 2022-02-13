import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'package:flxtech/generated/l10n.dart';
import 'package:flxtech/presentation/pages/auth/signin_page.dart';

void main() {
  runApp(const FLXTech());
}

class FLXTech extends StatelessWidget {
  const FLXTech();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SignInPage(),
      localizationsDelegates: [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
    );
  }
}