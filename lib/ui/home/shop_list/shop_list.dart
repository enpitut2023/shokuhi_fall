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

  return shopList..sort((b, a) {
    final lengthCompare = a.merchList.length.compareTo(b.merchList.length);
    if (lengthCompare != 0) {
      return lengthCompare;
    }
    final aSum = a.merchList.fold<double>(0, (sum, merch) => sum + (merch.maxPrice ?? 0));
    final bSum = b.merchList.fold<double>(0, (sum, merch) => sum + (merch.maxPrice ?? 0));
    return bSum.compareTo(aSum);
  });
}

class ShopList extends ConsumerWidget {
  const ShopList(
      {super.key, required this.merchIdList, required this.merchName});

  final List<String> merchIdList;
  final String merchName;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final shopList = ref.watch(shopListProvider(merchIdList));

    return Scaffold(
      appBar: AppBar(
        title: Text(merchName),
      ),
      body: AsyncValueWidget(
        value: shopList,
        builder: (shopList) => _whenData(context, shopList, merchIdList.length),
      ),
    );
  }


  Widget _whenData(BuildContext context, List<Shop> shopList, int merchCount) {
    return ListView.separated(
      separatorBuilder: (context, index) => const ListDivider(),
      itemCount: shopList.length,
      itemBuilder: (context, index) => ShopTile(
        shop: shopList[index],
        merchList: shopList[index].merchList,
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ShopDetail(shop: shopList[index]),
            ),
          );
        },
        tileColor: shopList[index].merchList.length != merchCount
            ? Colors.grey[300]
            : null,
      ),
    );
  }

}
