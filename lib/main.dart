import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';

import 'package:flxtech/generated/l10n.dart';
import 'package:flxtech/core/router/pages.dart';
import 'package:flxtech/presentation/controllers/auth/auth_controller.dart';
import 'package:flxtech/presentation/controllers/circuit/circuits_controller.dart';
import 'package:flxtech/presentation/controllers/quote/quoter_controller.dart';
import 'package:flxtech/presentation/controllers/menu/menu_controller.dart';
import 'package:flxtech/presentation/pages/auth/sign_in_page.dart';
import 'package:flxtech/injector_container.dart' as di;

void main() async {
  await di.init();
  runApp(const FLXTech());
}

class FLXTech extends StatelessWidget {
  const FLXTech();

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<AuthController>(create: (_) => di.sl<AuthController>()),
        ChangeNotifierProvider<QuoteController>(create: (_) => di.sl<QuoteController>()),
        ChangeNotifierProvider<MenuController>(create: (_) => di.sl<MenuController>()),
        ChangeNotifierProvider<CircuitController>(create: (_) => di.sl<CircuitController>()),
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