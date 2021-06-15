import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:i_order/di/locator.dart';
import 'package:i_order/presentation/blocs/bloc_provider.dart';
import 'package:i_order/presentation/blocs/blocs.dart';
import 'package:i_order/presentation/navigation/routes.dart';
import 'package:i_order/presentation/screens/home/home_screen.dart';
import 'package:i_order/presentation/screens/screens.dart';
import 'package:i_order/tools/exceptions/navigator_exceptions.dart';

class Router {
  Route<dynamic> onGenerateRoute(RouteSettings routeSettings) {
    final route = routeSettings.name;
    final args = routeSettings.arguments;

    switch (route) {

      case Routes.SPLASH:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            bloc: locator<SplashBloc>(),
            child: SplashScreen(),
          ),
          settings: routeSettings
        );

      case Routes.HOME:
        return MaterialPageRoute(
            builder: (context) => BlocProvider(
              bloc: locator<HomeBloc>(),
              child: HomeScreen(),
            ),
          settings: routeSettings
        );

      default:
        throw RouteNotFoundException(route);
    }
  }
}

Future<String> login = getFutureLog();

Future<String> getFutureLog() async {
  return "login";
}