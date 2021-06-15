import 'package:flutter/material.dart';
import 'package:i_order/domain/models/menu.dart';
import 'package:i_order/domain/models/menu_item.dart';
import 'package:i_order/domain/models/widgets/menu_item_card.dart';
import 'package:i_order/tools/theme/main_theme.dart';

class OrderScreen extends StatefulWidget {
  static const BASKET_ICON = "assets/images/basket_icon.png";

  OrderScreen({Key key}) : super(key: key);

  static final List<MenuItem> basket = [];

  @override
  _OrderScreenState createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  final List<Widget> menuCards = [];

  @override
  void initState() {
    super.initState();
    Menu.menu.forEach((element) {
      menuCards.add(Padding(
        padding: const EdgeInsets.all(8.0),
        child: MenuItemCard(
          menuItem: element,
        ),
      ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Order"),
        actions: [
          IconButton(
              icon: Stack(
                children: [
                  Image.asset(OrderScreen.BASKET_ICON),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      (OrderScreen.basket.length != 0)
                          ? Container(
                        height: 15,
                        width: 15,
                        decoration: BoxDecoration(
                          color: Colors.red,
                          shape: BoxShape.circle,
                        ),
                        child: Center(child: Padding(
                          padding: const EdgeInsets.all(1),
                          child: Text(
                            "${OrderScreen.basket.length}",
                            style: TextStyle(
                                fontSize: 11
                            ),
                          ),
                        )),
                      )
                          : Container() ,
                    ],
                  )
                ],
              ),
              onPressed: () => openBasket(context))
        ],
      ),
      body: Container(
        color: MainTheme.backgroundColor,
        child: Column(
          children: menuCards,
        )
      ),
    );
  }

  void openBasket(BuildContext context) {
    //todo add action
  }
}
