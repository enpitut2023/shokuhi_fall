import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ketchy/ui/home/shop_tile.dart';

class ShopList extends StatelessWidget {
  const ShopList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        for (final shopName in ["ロピア", "トライアル"]) ShopTile(shopName),
      ],
    );
  }
}
