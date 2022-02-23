import 'package:flutter/widgets.dart';

import 'package:flxtech/core/router/routes.dart';
import 'package:flxtech/presentation/pages/auth/sign_in_page.dart';
import 'package:flxtech/presentation/pages/menu/user_menu.dart';
import 'package:flxtech/presentation/pages/quote/quoter_page.dart';

abstract class Pages {
  static const String INITIAL = Routes.SIGN_IN;

  static final Map<String, Widget Function(BuildContext)> routes = {

    Routes.SIGN_IN: (_) => const SignInPage(),
    Routes.QUOTER: (_) => const QuoterPage(),
    Routes.MENU: (_) => const UserMenu(),
  };
}
    