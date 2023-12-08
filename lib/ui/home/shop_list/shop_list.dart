import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ketchy/model/shop.dart';
import 'package:ketchy/repository/shop_repository.dart';
import 'package:ketchy/ui/home/shop_list/shop_tile.dart';
import 'package:ketchy/ui/shop_detail/shop_detail.dart';
import 'package:ketchy/ui/widgets/async_value_widget.dart';
import 'package:ketchy/ui/widgets/list_divider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'shop_list.g.dart';

@riverpod
Future<List<Shop>> shopList(ShopListRef ref, List<String> merchIdList) async {
  final shopList = await ref
      .read(shopRepositoryProvider)
      .fetchShopListFromMerchList(merchIdList);

  return shopList
    ..sort((b, a) {
      final lengthCompare = a.merchList.length.compareTo(b.merchList.length);
      if (lengthCompare != 0) {
        return lengthCompare;
      }
      final aSum = a.merchList
          .fold<double>(0, (sum, merch) => sum + merch.averagePrice());
      final bSum = b.merchList
          .fold<double>(0, (sum, merch) => sum + merch.averagePrice());
      return bSum.compareTo(aSum);
    });
}

@riverpod
class ShowUnfilledShop extends _$ShowUnfilledShop {
  @override
  bool build() => false;

  void toggle() {
    state = !state;
  }
}

class ShopList extends ConsumerWidget {
  const ShopList(
      {super.key, required this.merchIdList, required this.merchName});

  final List<String> merchIdList;
  final String merchName;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final shopList = ref.watch(shopListProvider(merchIdList));
    final showUnfilledShop = ref.watch(showUnfilledShopProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text(merchName),
      ),
      body: AsyncValueWidget(
        value: shopList,
        builder: (shopList) => _whenData(
          context,
          shopList,
          merchIdList.length,
          showUnfilledShop,
          () {
            ref.read(showUnfilledShopProvider.notifier).toggle();
          },
        ),
      ),
    );
  }

  Widget _whenData(
    BuildContext context,
    List<Shop> shopList,
    int merchCount,
    bool showUnfilledShop,
    VoidCallback toggleShowUnfilledShop,
  ) {
    final filledShopList =
        shopList.where((shop) => shop.merchList.length == merchCount).toList();
    final unfilledShopList =
        shopList.where((shop) => shop.merchList.length != merchCount).toList();

    return ListView(
      children: [
        for (final shop in filledShopList)
          ShopTile(
            shop: shop,
            merchList: shop.merchList,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ShopDetail(shop: shop),
                ),
              );
            },
          ),
        ListTile(
          leading: showUnfilledShop
              ? const Icon(Icons.arrow_drop_down)
              : const Icon(Icons.arrow_right),
          title: const Text('商品が足りないお店'),
          onTap: toggleShowUnfilledShop,
        ),
        if (showUnfilledShop)
          for (final shop in unfilledShopList)
            ShopTile(
              shop: shop,
              merchList: shop.merchList,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ShopDetail(shop: shop),
                  ),
                );
              },
            ),
      ],
    );
  }
}
