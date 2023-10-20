
import 'package:flutter/cupertino.dart';

class ShopTile extends StatelessWidget {
  const ShopTile(this.shopName, {super.key});
  final String shopName;

  @override
  Widget build(BuildContext context) {
    return Text(shopName);
  }

}
