import 'package:flutter/widgets.dart' hide Router;
import 'package:get_it/get_it.dart';
import 'package:i_order/presentation/blocs/blocs.dart';
import 'package:i_order/presentation/navigation/navigation_manager.dart';
import 'package:i_order/presentation/navigation/navigation_manager_impl.dart';
import 'package:i_order/presentation/navigation/router.dart';

final locator = GetIt.instance;

Future<void> initLocator() async {
  _initNavigation();
  _initBlocs();
  _initUtils();
}

void _initNavigation() {
  locator.registerLazySingleton<GlobalKey<NavigatorState>>(
          () => GlobalKey<NavigatorState>());

  locator.registerLazySingleton<NavigationManager>(
          () => NavigationManagerImpl(navigatorKey: locator()));

  locator.registerLazySingleton<Router>(() => Router());
}

void _initBlocs() {
  locator.registerFactory<SplashBloc>(() => SplashBloc(
    locator()
  ));

  locator.registerFactory<HomeBloc>(() => HomeBloc());

  locator.registerFactory<OrderBloc>(() => OrderBloc());

  locator.registerFactory<HistoryBloc>(() => HistoryBloc());
}

void _initUtils() {
}