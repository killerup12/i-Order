import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:i_order/domain/models/menu_item.dart';

class MenuItemCard extends StatelessWidget {
  const MenuItemCard({Key key,
    this.menuItem,
  }) : super(key: key);

  final MenuItem menuItem;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(11),
        color: Colors.white
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Image.asset(menuItem.image),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(menuItem.name),
              Text(menuItem.description),
              Text("Price: ${menuItem.price}\$")
            ],
          )
        ],
      ),
    );
  }
}
