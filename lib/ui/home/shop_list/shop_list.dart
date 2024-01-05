import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ketchy/model/merch.dart';
import 'package:ketchy/model/shop.dart';
import 'package:ketchy/repository/shop_repository.dart';
import 'package:ketchy/ui/home/shop_list/shop_tile.dart';
import 'package:ketchy/ui/shop_detail/shop_detail.dart';
import 'package:ketchy/ui/widgets/async_value_widget.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'shop_list.g.dart';

@riverpod
Future<List<Shop>> shopList(
    ShopListRef ref, List<MerchOutline> merchList) async {
  final merchIdList = merchList.map((e) => e.id).toList();
  var shopList = await ref
      .read(shopRepositoryProvider)
      .fetchShopListFromMerchList(merchIdList);

  var newShopList = <Shop>[];
  for (final shop in shopList) {
    var newMerchList = <MerchDetail>[];
    for (final merch in shop.merchList) {
      final index = merchIdList.indexOf(merch.id);
      if (index != -1) {
        newMerchList.add(
          merch.copyWith(
            amount: merchList[index].amount,
            unit: merchList[index].unit,
          ),
        );
      }
    }
    newShopList.add(shop.copyWith(merchList: newMerchList));
  }

  return newShopList
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
  const ShopList({super.key, required this.merchList, required this.merchName});

  final List<MerchOutline> merchList;
  final String merchName;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final shopList = ref.watch(shopListProvider(merchList));
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
          merchList.length,
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
