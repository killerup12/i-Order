import 'package:flutter/material.dart';
import 'package:i_order/domain/models/bloc/bloc_provider.dart';
import 'package:i_order/presentation/blocs/blocs.dart';
import 'package:i_order/tools/theme/main_theme.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  static const String ORDER_ICON = "assets/images/order_icon.png";
  static const String HISTORY_ICON = "assets/images/history_icon.png";
  // static const String PROFILE_ICON = "assets/images/profile_icon.png";

  HomeBloc bloc;

  int _currentTabIndex = 0;

  @override
  void initState() {
    super.initState();
    bloc = BlocProvider.of<HomeBloc>(context);
    bloc.selectSubScreen(_currentTabIndex);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: bloc.screenStream,
        builder: (context, snapshot) => snapshot.data,
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: MainTheme.bottomNavigationColor,
        currentIndex: _currentTabIndex,
        onTap: _onTap,
        selectedFontSize: 11,
        unselectedFontSize: 11,
        items: [
          BottomNavigationBarItem(
            icon: Image.asset(ORDER_ICON, height: 60),
            activeIcon: Image.asset(ORDER_ICON, height: 60),
            label: "Order"
          ),
          BottomNavigationBarItem(
              icon: Image.asset(HISTORY_ICON, height: 60),
              activeIcon: Image.asset(HISTORY_ICON, height: 60),
              label: "History"
          ),
          // BottomNavigationBarItem(
          //     icon: Image.asset(PROFILE_ICON, height: 60),
          //     activeIcon: Image.asset(PROFILE_ICON, height: 60),
          //     label: "Profile"
          // )
        ],

      ),
    );
  }

  void _onTap(int index) {
    setState(() {
      _currentTabIndex = index;
      bloc.selectSubScreen(_currentTabIndex);
    });
  }
}

