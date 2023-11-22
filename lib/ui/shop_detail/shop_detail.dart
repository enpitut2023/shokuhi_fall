import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:ketchy/model/shop.dart';
import 'package:ketchy/ui/shop_detail/add_merch_dialog.dart';
import 'package:ketchy/ui/widgets/map_widget.dart';

import '../home/merch_list/merch_detail_tile.dart';

class ShopDetail extends ConsumerWidget {
  const ShopDetail({super.key, required this.shop});

  final Shop shop;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final now = DateTime.now();
    final dayOfWeek = DateFormat('EEEE').format(now);

    return Scaffold(
      appBar: AppBar(
        title: Text(shop.name),
      ),
      body: Row(
        children: [
          Expanded(
            child: ListView(
              children: [
                ListTile(
                  title: const Text('住所'),
                  subtitle: Text(shop.address),
                ),
                ListTile(
                  title: const Text('電話番号'),
                  subtitle: Text(shop.tel),
                ),
                const ListTile(title: Text('営業時間')),
                for (final dow in [
                  "Monday",
                  "Tuesday",
                  "Wednesday",
                  "Thursday",
                  "Friday",
                  "Saturday",
                  "Sunday"
                ])
                  Padding(
                    padding: const EdgeInsets.only(left: 16.0),
                    child: Row(
                      children: [
                        SizedBox(
                          width: 80,
                          child: Text(
                            '$dow: ',
                            style: TextStyle(
                              color:
                                  dayOfWeek == dow ? Colors.red : Colors.black,
                            ),
                          ),
                        ),
                        Text(
                          '${shop.open[dow]} - ${shop.close[dow] == '00:00' ? '24:00' : shop.close[dow]}',
                          style: TextStyle(
                            color: dayOfWeek == dow ? Colors.red : Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                if (shop.comments.isNotEmpty)
                  const ListTile(
                    title: Text('コメント'),
                  ),
                for (final comment in shop.comments.entries)
                  Padding(
                    padding: const EdgeInsets.only(left: 16.0),
                    child: Text('- ${comment.value}'),
                  ),
                ListTile(
                  title: const Text('選択した商品一覧'),
                  trailing: IconButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) => AddMerchDialog(
                          shopId: shop.id,
                        ),
                      );
                    },
                    icon: const Icon(Icons.add),
                  ),
                ),
                const Divider(),
                for (final merch in shop.merchList) MerchDetailTile(merch),
              ],
            ),
          ),
          Expanded(child: MapWidget(shop.longitude, shop.latitude)),
        ],
      ),
    );
  }
}
