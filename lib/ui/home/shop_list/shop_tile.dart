import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
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
    var sum = 0.0;
    for (final merch in merchList) {
      sum += merch.averagePrice() * (merch.amount ?? 0);
    }
    final now = DateTime.now();
    final dayOfWeek = DateFormat('EEEE').format(now);

    return Card(
      child: ListTile(
        onTap: onTap,
        title: Text(
          shop.name,
          style: const TextStyle(
            fontWeight: FontWeight.w400, // テキストの太さを太くします。
          )
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(shop.open[dayOfWeek] == '00:00' &&
                    shop.close[dayOfWeek] == '00:00'
                ? '営業時間: 24時間営業'
                : '営業時間: ${shop.open[dayOfWeek]!} - ${shop.close[dayOfWeek]!}'),
            const Text('内訳：'),
            for (final merch in merchList)
              Text(
                  '${merch.name}(${merch.amount}${merch.unit}) ${(merch.averagePrice() * (merch.amount ?? 0)).toStringAsFixed(2)}円'),
          ],
        ),
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '合計金額: ${sum.toStringAsFixed(2)}円',
              style: const TextStyle(
                fontSize: 18, // テキストのサイズを大きくします。
                fontWeight: FontWeight.bold, // テキストの太さを太くします。
              ),
            ),
          ],
        ),
        isThreeLine: merchList.length >= 2,
        tileColor: Colors.white70,
      ),
    );
  }
}
