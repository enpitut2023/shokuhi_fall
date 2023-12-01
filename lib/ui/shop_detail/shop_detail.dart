import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:ketchy/model/merch.dart';
import 'package:ketchy/model/shop.dart';
import 'package:ketchy/repository/shop_repository.dart';
import 'package:ketchy/ui/home/posted_merch/posted_merch_list.dart';
import 'package:ketchy/ui/widgets/async_value_widget.dart';
import 'package:ketchy/ui/widgets/map_widget.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../home/merch_list/merch_detail_tile.dart';
import 'add_merch_dialog.dart';

part 'shop_detail.g.dart';

@riverpod
Future<List<MerchDetail>> merchDetailList(MerchDetailListRef ref,
    {required String shopId}) async {
  final repository = ref.read(shopRepositoryProvider);
  return await repository.fetchMerchIdList(shopId);
}

class ShopDetail extends ConsumerWidget {
  const ShopDetail({super.key, required this.shop});

  final Shop shop;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final now = DateTime.now();
    final dayOfWeek = DateFormat('EEEE').format(now);
    final merchDetailList = ref.watch(
      merchDetailListProvider(shopId: shop.id),
    );

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
                              fontWeight:
                              dayOfWeek == dow ? FontWeight.bold : FontWeight.normal,
                              color:
                                  dayOfWeek == dow ? Colors.black : Colors.grey,
                            ),
                          ),
                        ),
                        Text(
                          shop.open[dow] == '00:00' && shop.close[dow] == '00:00' ?
                            '24時間営業' :
                            '${shop.open[dow]} - ${shop.close[dow] == '00:00' ? '24:00' : shop.close[dow]}',
                          style: TextStyle(
                            fontWeight:
                              dayOfWeek == dow ? FontWeight.bold : FontWeight.normal,
                              color: dayOfWeek == dow ? Colors.black : Colors.grey,
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
                AsyncValueWidget(
                  value: merchDetailList,
                  builder: (data) => Column(
                    children: [
                      for (final merch in data)
                        MerchDetailTile(
                          merch,
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => PostedMerchList(
                                  shopId: shop.id,
                                  merchDetailId: merch.id,
                                  merchName: merch.name,
                                ),
                              ),
                            );
                          },
                        ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Expanded(child: MapWidget(shop.longitude, shop.latitude)),
        ],
      ),
    );
  }
}
