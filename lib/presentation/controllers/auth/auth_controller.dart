import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

import 'package:flxtech/presentation/controllers/circuit/circuits_controller.dart';
import 'package:flxtech/core/router/routes.dart';
import 'package:flxtech/presentation/controllers/quote/quoter_controller.dart';

class AuthController extends ChangeNotifier {

  bool isLoading = false;

  void handleSignIn(BuildContext context) async {
    isLoading = true;
    notifyListeners();
      context.read<QuoteController>().loadQuantityFeedMap();
      context.read<QuoteController>().loadRangeFeedMap();
      context.read<QuoteController>().loadBagOfMinutesQuoteInitial();
      context.read<QuoteController>().loadServicesQuoteInitial();
      context.read<QuoteController>().loadServersEditingControllers();
      await context.read<CircuitController>().loadAllCircuits(context);
      context.read<CircuitController>().calculateSubTotalTop();
      context.read<CircuitController>().calculateTotalMinutesTop();
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      Navigator.pushNamedAndRemoveUntil(
      context,
      Routes.MENU,
      (_) => false,
      );
    });
    isLoading = false;
    notifyListeners();
  }

}