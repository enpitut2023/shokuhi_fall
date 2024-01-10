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

part 'shop_detail.g.dart';

@riverpod
Future<List<MerchDetail>> merchDetailList(MerchDetailListRef ref,
    {required String shopId}) async {
  final repository = ref.read(shopRepositoryProvider);
  return await repository.fetchMerchDetailList(shopId);
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

    final size = MediaQuery.of(context).size;
    final aspect = size.width / size.height;

    return Scaffold(
      appBar: AppBar(
        title: Text(shop.name),
      ),
      body: aspect > 1
          ? Row(children: [
              Expanded(
                child: ListView(
                  children: _shopDetailListChildren(
                      merchDetailList, dayOfWeek, context),
                ),
              ),
              Expanded(child: MapWidget(shop.longitude, shop.latitude)),
            ])
          : ListView(
              children: [
                SizedBox.fromSize(
                  size: size / 2,
                  child: MapWidget(shop.longitude, shop.latitude),
                ),
                for (final child in _shopDetailListChildren(
                  merchDetailList,
                  dayOfWeek,
                  context,
                ))
                  child,
              ],
            ),
    );
  }

  List<Widget> _shopDetailListChildren(
    AsyncValue<List<MerchDetail>> merchDetailList,
    String dayOfWeek,
    BuildContext context,
  ) {
    return [
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
                    color: dayOfWeek == dow ? Colors.black : Colors.grey,
                  ),
                ),
              ),
              Text(
                shop.open[dow] == '00:00' && shop.close[dow] == '00:00'
                    ? '24時間営業'
                    : '${shop.open[dow]} - ${shop.close[dow] == '00:00' ? '24:00' : shop.close[dow]}',
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
      const ListTile(
        title: Text('商品一覧'),
      ),
      const Divider(),
      AsyncValueWidget(
        value: merchDetailList,
        builder: (data) {
          data.sort((a, b) {
            final containsA = shop.merchList.indexWhere((element) => element.id == a.id);
            final containsB = shop.merchList.indexWhere((element) => element.id == b.id);
            if (containsA != -1 && containsB == -1) {
              return -1;
            } else if (containsA == -1 && containsB != -1) {
              return 1;
            } else {
              return a.name.compareTo(b.name);
            }
          });
          return Column(
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
          );
        },
      ),
    ];
  }
}
