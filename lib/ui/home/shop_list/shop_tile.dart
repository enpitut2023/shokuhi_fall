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
    var sum = 0.0;
    for (final merch in merchList) {
      sum += merch.averagePrice();
    }

    return ListTile(
      onTap: onTap,
      title: Text(shop.name),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('内訳：'),
          for (final merch in merchList)
            Text('${merch.name} ${merch.averagePrice()}円'),
        ],
      ),
      trailing: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '合計金額: $sum円',
            style: const TextStyle(
              fontSize: 18, // テキストのサイズを大きくします。
              fontWeight: FontWeight.bold, // テキストの太さを太くします。
            ),
          ),
        ],
      ),
      isThreeLine: merchList.length >= 2,
      tileColor: tileColor,
    );
  }
}
