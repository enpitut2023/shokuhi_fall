import 'package:flutter/material.dart';
import 'package:ketchy/model/merch.dart';

import '../../../model/shop.dart';

class ShopTile extends StatelessWidget {
  const ShopTile({
    super.key,
    required this.shop,
    this.merchName,
    this.onTap,
  });

  final Shop shop;
  final VoidCallback? onTap;
  final String? merchName;

  @override
  Widget build(BuildContext context) {
    Merch? merch;
    for(final m in shop.merchList) {
      if (m.name == merchName) {
        merch = m;
        break;
      }
    }

    return ListTile(
      onTap: onTap,
      title: Text(shop.name),
      subtitle: Text('$merchName: ${merch?.minPrice}円〜${merch?.maxPrice}円'),
    );
  }
}
