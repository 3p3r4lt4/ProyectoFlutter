import 'package:get_it/get_it.dart';
import 'package:flutter/widgets.dart' show WidgetsFlutterBinding;

import 'package:flxtech/presentation/controllers/auth/auth_controller.dart';
import 'package:flxtech/presentation/controllers/menu/menu_controller.dart';
import 'package:flxtech/presentation/controllers/quote/quoter_controller.dart';

final sl = GetIt.instance;

Future<void> init() async {
  WidgetsFlutterBinding.ensureInitialized();
  // * Presenter
  // to plain Login
  sl.registerFactory(
    () => AuthController(),
  );
  // to plain menu
  sl.registerFactory(
    () => MenuController(),
  );
  // to plain products
  sl.registerFactory(
    () => QuoteController(),
  );

  // * Data
  
  // * Network

  // * Local

  // * Domain use case

}