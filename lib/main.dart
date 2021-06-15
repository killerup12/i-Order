import 'package:flutter/material.dart' hide Router;
import 'package:i_order/presentation/navigation/router.dart';
import 'package:i_order/presentation/navigation/routes.dart';

import 'di/locator.dart';


void main() async {

  await initLocator();

  runApp(ICocker());
}

class ICocker extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print(Routes.SPLASH);
    return  MaterialApp(
          debugShowCheckedModeBanner: false,
          title: "i-Cocker",
          navigatorKey: locator(),
          initialRoute: Routes.SPLASH,
          onGenerateRoute: locator<Router>().onGenerateRoute
        );
  }
}
