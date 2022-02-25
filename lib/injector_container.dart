import 'package:get_it/get_it.dart';
import 'package:flutter/widgets.dart' show WidgetsFlutterBinding;

import 'package:flxtech/presentation/controllers/auth/auth_controller.dart';
import 'package:flxtech/presentation/controllers/menu/menu_controller.dart';
import 'package:flxtech/presentation/controllers/quote/quoter_controller.dart';
import 'package:flxtech/presentation/controllers/circuit/circuits_controller.dart';

import 'package:flxtech/data/repositories/circuit_repository_impl.dart';
import 'package:flxtech/data/datasource/remote/clients_remote_datasource.dart';

import 'package:flxtech/domain/repositories/circuit_repository.dart';
import 'package:flxtech/domain/usecase/get_circuits_all.dart';

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
  // to plain quoter
  sl.registerFactory(
    () => QuoteController(),
  );
  // to plain circuit and client
  sl.registerFactory(
    () => CircuitController(
      getCircuitsAll: sl(),
    ),
  );

  // * Data
  sl.registerLazySingleton<CircuitRepository>(() => CircuitRepositoryImpl(remoteDataSource: sl()));
  // * Network
  sl.registerLazySingleton<CircuitsRemoteDataSource>(() => CircuitsRemoteDataSourceImpl());
  // * Local

  // * Domain use case
  sl.registerFactory<GetCircuitsAll>(() => GetCircuitsAll(circuitRepository: sl()));

}