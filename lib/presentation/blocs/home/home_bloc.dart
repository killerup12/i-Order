import 'dart:async';

import 'package:i_order/di/locator.dart';
import 'package:i_order/presentation/screens/screens.dart';
import 'package:i_order/domain/models/bloc/base.dart';
import 'package:i_order/domain/models/bloc/bloc_provider.dart';
import 'package:i_order/presentation/blocs/blocs.dart';
import 'package:i_order/presentation/navigation/routes.dart';

class HomeBloc implements Bloc {
  final _screenController = StreamController<BlocProvider>();

  Stream<BlocProvider> get screenStream => _screenController.stream;

  void selectSubScreen(int index) {
    final route = (index == 0)
        ? Routes.ORDER : (index == 1)
        ? Routes.HISTORY
        : Routes.PROFILE;

    switch (route) {
      case Routes.ORDER:
        _screenController.sink.add(BlocProvider<OrderBloc>(
          bloc: locator<OrderBloc>(),
          child: OrderScreen(),
        ));
        break;

      case Routes.HISTORY:
        _screenController.sink.add(BlocProvider<HistoryBloc>(
          bloc: locator<HistoryBloc>(),
          child: HistoryScreen(),
        ));
        break;
    }
  }

  @override
  void dispose() {
    _screenController.close();
  }
}