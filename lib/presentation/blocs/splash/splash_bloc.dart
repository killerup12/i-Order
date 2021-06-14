
import 'package:i_order/presentation/navigation/navigation_manager.dart';
import 'package:i_order/presentation/navigation/routes.dart';

import '../base.dart';

class SplashBloc implements Bloc {
  final NavigationManager navigationManager;

  SplashBloc(this.navigationManager);

  void goToNextPage() {
    Future.delayed(Duration(seconds: 1), () {
      navigationManager.pushRouteWithReplacement(Routes.HOME);
    });
  }

  @override
  void dispose() {}
}