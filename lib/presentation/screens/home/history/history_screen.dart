import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:i_order/tools/theme/main_theme.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("History"),
      ),
      body: Container(
        color: MainTheme.backgroundColor,
      ),
    );
  }
}
