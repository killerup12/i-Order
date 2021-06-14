import 'package:flutter/material.dart';
import 'package:i_order/di/locator.dart';
import 'package:i_order/presentation/blocs/splash/splash_bloc.dart';
import 'package:i_order/tools/theme/MainTheme.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key key}) : super(key: key);

  static const String APP_LOGO = "assets/images/app_logo.png";

  @override
  Widget build(BuildContext context) {
    locator<SplashBloc>().goToNextPage();

    return Scaffold(
      backgroundColor: MainTheme.backgroundColor,
      body: Center(
        child: Container(
          height: MediaQuery.of(context).size.width/1.5,
            child: Image.asset(APP_LOGO)
        ),
      ),
    );
  }
}
