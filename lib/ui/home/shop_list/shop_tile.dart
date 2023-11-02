import 'package:flutter/material.dart';
import 'package:ketchy/model/merch.dart';

import '../../../model/shop.dart';

class ShopTile extends StatelessWidget {
  const ShopTile({
    super.key,
    required this.shop,
    this.onTap,
    this.merchList = const [],
  });

  final Shop shop;
  final VoidCallback? onTap;
  final List<MerchDetail> merchList;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      title: Text(shop.name),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          for(final merch in merchList)
            Text('${merch.name}: ${merch.minPrice}円〜${merch.maxPrice}円'),
        ],
      ),
      isThreeLine: merchList.length >= 2,
    );
  }
}
