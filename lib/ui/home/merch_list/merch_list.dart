import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ketchy/ui/home/merch_list/merch_tile.dart';
import 'package:ketchy/ui/shop_detail/shop_detail.dart';

import '../../../model/merch.dart';
import '../shop_list/shop_list.dart';

class MerchList extends ConsumerWidget {
  const MerchList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    const Merch merch = Merch(
      id: 111,
      name: 'qawsedrftg',
      minPrice: 1,
      maxPrice: 100,
      averagePrice: 9,
      description: 'oe',
    );

    return ListView(
      children:  [
        MerchTile(
        merch,onTap:(){ Navigator.push(context,
            MaterialPageRoute(
              builder: (context) => Text(""),
            ));
        }
        )
      ],
    );
  }
}
