import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ketchy/model/shop.dart';
import 'package:ketchy/repository/shop_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'merch_tile.dart';

part 'shop_detail.g.dart';

@riverpod
Future<Shop> shopDetail(ShopDetailRef ref, {required int shopId}) async {
  final repository = ref.read(shopRepositoryProvider);
  return repository.fetchShop(shopId);
}

class ShopDetail extends ConsumerWidget {
  const ShopDetail({super.key, required this.shopId});

  final int shopId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final shop = ref.watch(shopDetailProvider(shopId: shopId));
    return shop.when(
      data: (data) => _whenData(context, data),
      error: (error, stackTrace) => _whenError(error, stackTrace),
      loading: () => _whenLoading(),
    );
  }

  Widget _whenData(BuildContext context, Shop shop) {
    return Scaffold(
      appBar: AppBar(
        title: Text(shop.name),
      ),
      body: ListView(
        children: [
          for (final merch in shop.merchList) MerchTile(merch),
        ],
      ),
    );
  }

  Widget _whenError(Object error, StackTrace stackTrace) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("エラー"),
      ),
      body: Column(
        children: [
          SelectableText(error.toString()),
          SelectableText(stackTrace.toString()),
        ],
      ),
    );
  }

  Widget _whenLoading() {
    return Scaffold(
      appBar: AppBar(
        title: const Text("ロード中"),
      ),
      body: const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
