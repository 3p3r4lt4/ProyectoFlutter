import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';

import 'package:flxtech/core/router/routes.dart';

class AuthController extends ChangeNotifier {

  void handleSignIn(BuildContext context) {
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      print('success login');
      Navigator.pushNamedAndRemoveUntil(
      context,
      Routes.QUOTER,
      (_) => false,
      );
    });
    notifyListeners();
  }

}