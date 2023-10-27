import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ketchy/ui/home/merch_list/merch_tile.dart';
import 'package:ketchy/ui/home/shop_list/shop_list.dart';

import '../../../model/merch.dart';

class MerchList extends ConsumerWidget {
  const MerchList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    const Merch merch = Merch(
      id: 111,
      name: '豚小間切れ',
      minPrice: 1,
      maxPrice: 110,
      averagePrice: 9,
      description: 'oe',
    );

    return ListView(
      children: [
        MerchTile(
          merch,
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ShopList(merchName: merch.name),
              ),
            );
          },
        )
      ],
    );
  }
}
