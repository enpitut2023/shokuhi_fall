
import 'package:flutter/material.dart';
import 'package:ketchy/model/merch.dart';

import '../../../model/shop.dart';

class ShopTile extends StatelessWidget {
  const ShopTile({
    super.key,
    required this.shop,
    this.onTap,
    this.merchList = const [],
    this.tileColor,
  });

  final Shop shop;
  final VoidCallback? onTap;
  final List<MerchDetail> merchList;
  final Color? tileColor;

  @override
  Widget build(BuildContext context) {
    var sum = 0;
    for (final merch in merchList) {
      sum += merch.maxPrice as int;
    }

    return ListTile(
      onTap: onTap,
      title: Text(shop.name),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('合計金額: $sum円'),
        ],
      ),
      isThreeLine: merchList.length >= 2,
      tileColor: tileColor,
    );
  }
}
