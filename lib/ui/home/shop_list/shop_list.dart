import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ketchy/model/shop.dart';
import 'package:ketchy/repository/shop_repository.dart';
import 'package:ketchy/ui/home/shop_list/shop_tile.dart';
import 'package:ketchy/ui/shop_detail/shop_detail.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'shop_list.g.dart';

@riverpod
Future<List<Shop>> shopList(ShopListRef ref) =>
    ref.read(shopRepositoryProvider).fetchShopList();

class ShopList extends ConsumerWidget {
  const ShopList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final shopList = ref.watch(shopListProvider);
    return shopList.when(
      data: (data) => _whenData(context, data),
      error: (error, stackTrace) => _whenError(error, stackTrace),
      loading: () => _whenLoading(),
    );
  }

  Widget _whenData(BuildContext context, List<Shop> shopList) {
    return ListView(
      children: [
        for (final shop in shopList)
          ShopTile(
            shopName: shop.name,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ShopDetail(shop:shop),
                ),
              );
            },
          ),
      ],
    );
  }

  Widget _whenError(Object error, StackTrace stackTrace) {
    return Column(
      children: [
        SelectableText(error.toString()),
        SelectableText(stackTrace.toString()),
      ],
    );
  }

  Widget _whenLoading() {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}
