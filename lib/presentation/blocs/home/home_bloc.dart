import 'dart:async';

import 'package:i_order/di/locator.dart';
import 'package:i_order/presentation/screens/screens.dart';
import 'package:i_order/domain/models/bloc/base.dart';
import 'package:i_order/domain/models/bloc/bloc_provider.dart';
import 'package:i_order/presentation/blocs/blocs.dart';
import 'package:i_order/presentation/navigation/routes.dart';

class HomeBloc implements Bloc {
  BlocProvider _selectedWidget;

  final _screenController = StreamController<BlocProvider>();

  Stream<BlocProvider> get screenStream => _screenController.stream;

  void selectSubScreen(int index) {
    final route = (index == 0)
        ? Routes.ORDER : (index == 1)
        ? Routes.HISTORY
        : Routes.PROFILE;

    switch (route) {
      case Routes.ORDER:
        _selectedWidget = BlocProvider(
          bloc: locator<OrderBloc>(),
          child: OrderScreen(),
        );
        _screenController.sink.add(_selectedWidget);
        break;

      case Routes.HISTORY:
        _selectedWidget = BlocProvider(
          bloc: locator<HistoryBloc>(),
          child: HistoryScreen(),
        );
        _screenController.sink.add(_selectedWidget);
        break;
    }
  }

  @override
  void dispose() {
    _screenController.close();
  }
}