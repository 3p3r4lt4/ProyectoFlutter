import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

import 'package:flxtech/core/router/routes.dart';
import 'package:flxtech/presentation/controllers/quote/quoter_controller.dart';

class AuthController extends ChangeNotifier {

  void handleSignIn(BuildContext context) {
      context.read<QuoteController>().loadQuantityFeedMap();
      context.read<QuoteController>().loadRangeFeedMap();
      context.read<QuoteController>().loadBagOfMinutesQuoteInitial();
      context.read<QuoteController>().loadServicesQuoteInitial();
      context.read<QuoteController>().loadServersEditingControllers();
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      Navigator.pushNamedAndRemoveUntil(
      context,
      Routes.MENU,
      (_) => false,
      );
    });
    notifyListeners();
  }

}