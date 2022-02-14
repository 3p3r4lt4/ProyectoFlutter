import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';

import 'package:flxtech/generated/l10n.dart';
import 'package:flxtech/core/router/pages.dart';
import 'package:flxtech/presentation/controllers/auth/auth_controller.dart';
import 'package:flxtech/presentation/controllers/quote/quoter_controller.dart';
import 'package:flxtech/presentation/pages/auth/signin_page.dart';

void main() {
  runApp(const FLXTech());
}

class FLXTech extends StatelessWidget {
  const FLXTech();

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<AuthController>(create: (_) => AuthController()),
        ChangeNotifierProvider<QuoteController>(create: (_) => QuoteController()),
      ],
      child: MaterialApp(
        home: SignInPage(),
        debugShowCheckedModeBanner: false,
        routes: Pages.routes,
        localizationsDelegates: [
          S.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        supportedLocales: S.delegate.supportedLocales,
      ),
    );
  }
}