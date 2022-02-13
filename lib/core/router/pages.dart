import 'package:flutter/widgets.dart';

import 'package:flxtech/core/router/routes.dart';
import 'package:flxtech/presentation/pages/auth/signin_page.dart';
import 'package:flxtech/presentation/pages/quote/quoter_page.dart';

abstract class Pages {
  static const String INITIAL = Routes.SIGNIN;

  static final Map<String, Widget Function(BuildContext)> routes = {

    Routes.SIGNIN: (_) => const SignInPage(),
    Routes.QUOTER: (_) => const QuoterPage(),
  };
}
    