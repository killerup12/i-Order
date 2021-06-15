import 'package:flutter/material.dart';
import 'package:i_order/domain/models/menu.dart';
import 'package:i_order/domain/models/menu_item.dart';
import 'package:i_order/domain/models/widgets/menu_item_card.dart';
import 'package:i_order/tools/theme/main_theme.dart';

class OrderScreen extends StatelessWidget {
  OrderScreen({Key key}) : super(key: key) {
    menu.forEach((element) {
      menuCards.add(Padding(
        padding: const EdgeInsets.all(8.0),
        child: MenuItemCard(
          menuItem: element,
        ),
      ));
    });
  }

  final List<MenuItem> menu = Menu.menu;
  final List<Widget> menuCards = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Order"),
      ),
      body: Container(
        color: MainTheme.backgroundColor,
        child: Column(
          children: menuCards,
        )
      ),
    );
  }
}
