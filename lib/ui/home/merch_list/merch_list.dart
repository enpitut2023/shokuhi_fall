import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ketchy/repository/merch_repository.dart';
import 'package:ketchy/ui/home/merch_list/merch_tile.dart';
import 'package:ketchy/ui/home/shop_list/shop_list.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../model/merch.dart';

part 'merch_list.g.dart';

@riverpod
Future<List<Merch>> merchList(MerchListRef ref, {String? shopId}) async {
  if (shopId == null) {
    return ref.read(merchRepositoryProvider).fetchMerchList();
  } else {
    return ref.read(merchRepositoryProvider).fetchMerchListFromShop(shopId);
  }
}

class MerchList extends ConsumerWidget {
  const MerchList({super.key, this.shopId});

  final String? shopId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final merchList = ref.watch(merchListProvider(shopId: shopId));

    return Scaffold(
      appBar: AppBar(
        title: const Text('商品一覧'),
      ),
      body: merchList.when(
        data: (data) => _whenData(context, data),
        error: (error, stackTrace) => _whenError(error, stackTrace),
        loading: () => _whenLoading(),
      ),
    );
  }

  Widget _whenData(BuildContext context, List<Merch> merchList) {
    return ListView(
      children: [
        for (final merch in merchList)
          MerchTile(
            merch,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ShopList(
                    merchId: merch.id,
                    merchName: merch.name,
                  ),
                ),
              );
            },
          )
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
