import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ketchy/repository/merch_repository.dart';
import 'package:ketchy/ui/home/merch_list/merch_tile.dart';
import 'package:ketchy/ui/home/shop_list/shop_list.dart';
import 'package:ketchy/ui/widgets/async_value_widget.dart';
import 'package:ketchy/ui/widgets/list_divider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../model/merch.dart';

part 'merch_list.g.dart';

@riverpod
Future<List<Merch>> merchList(MerchListRef ref) async {
  return ref.read(merchRepositoryProvider).fetchMerchList();
}

@riverpod
class SelectedMerchList extends _$SelectedMerchList {
  @override
  List<Merch> build() => [];

  void add(Merch merch) {
    state = [...state, merch];
  }

  void remove(Merch merch) {
    state = state.where((element) => element.id != merch.id).toList();
  }

  void toggle(Merch merch) {
    if (state.contains(merch)) {
      remove(merch);
    } else {
      add(merch);
    }
  }
}

class MerchList extends ConsumerWidget {
  const MerchList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final merchList = ref.watch(merchListProvider);
    final selectedMerchList = ref.watch(selectedMerchListProvider);
    final selectedMerchListNotifier =
        ref.read(selectedMerchListProvider.notifier);
    return Scaffold(
      appBar: AppBar(
        title: Text('商品一覧: ${selectedMerchList.length}件選択中'),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ShopList(
                    merchIdList: selectedMerchList.map((e) => e.id).toList(),
                    merchName: selectedMerchList.map((e) => e.name).join(','),
                  ),
                ),
              );
            },
          ),
        ],
      ),
      body: AsyncValueWidget(
        value: merchList,
        builder: (data) => ListView.separated(
          separatorBuilder: (context, index) => const ListDivider(),
          itemCount: data.length,
          itemBuilder: (context, index) => MerchTile(
            data[index],
            onTap: () => selectedMerchListNotifier.toggle(data[index]),
            trailing: Checkbox(
              value: selectedMerchList.contains(data[index]),
              onChanged: (value) =>
                  selectedMerchListNotifier.toggle(data[index]),
            ),
          ),
        ),
      ),
    );
  }
}
