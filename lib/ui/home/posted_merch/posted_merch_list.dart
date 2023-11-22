import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ketchy/model/merch.dart';
import 'package:ketchy/ui/home/posted_merch/posted_merch_tile.dart';
import 'package:ketchy/ui/widgets/async_value_widget.dart';
import 'package:ketchy/ui/widgets/list_divider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../repository/shop_repository.dart';

part 'posted_merch_list.g.dart';

@riverpod
Future<List<PostedMerch>> postedMerchList(PostedMerchListRef ref,
    {required String shopId, required String merchDetailId}) async {
  final repository = ref.read(shopRepositoryProvider);
  return await repository.fetchPostedMerchList(shopId, merchDetailId);
}

class PostedMerchList extends ConsumerWidget {
  const PostedMerchList(
      {super.key,
      required this.shopId,
      required this.merchDetailId,
      required this.merchName});

  final String shopId;
  final String merchDetailId;
  final String merchName;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final postedMerchList = ref.watch(
      postedMerchListProvider(shopId: shopId, merchDetailId: merchDetailId),
    );

    return Scaffold(
      appBar: AppBar(
        title: Text('投稿一覧 $merchName'),
      ),
      body: AsyncValueWidget(
        value: postedMerchList,
        builder: (postedMerchList) {
          if (postedMerchList.isEmpty) {
            return const Center(child: Text('投稿がありません'));
          }
          return ListView.separated(
            itemCount: postedMerchList.length,
            itemBuilder: (context, index) {
              final postedMerch = postedMerchList[index];
              return PostedMerchTile(postedMerch: postedMerch);
            },
            separatorBuilder: (context, i) => const ListDivider(),
          );
        },
      ),
    );
  }
}
