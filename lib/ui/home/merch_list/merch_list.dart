import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ketchy/repository/merch_outline_repository.dart';
import 'package:ketchy/ui/home/merch_list/merch_amount_dialog.dart';
import 'package:ketchy/ui/home/merch_list/merch_outline_tile.dart';
import 'package:ketchy/ui/home/shop_list/shop_list.dart';
import 'package:ketchy/ui/widgets/async_value_widget.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../model/merch.dart';

part 'merch_list.g.dart';

@riverpod
Future<List<MerchOutline>> merchList(MerchListRef ref) async {
  final merchList =
      await ref.read(merchOutlineRepositoryProvider).fetchMerchOutlineList();
  merchList.sort((a, b) => a.tag.compareTo(b.tag));
  final tag = ref.watch(selectedTagProvider);
  if (tag == null) {
    return merchList;
  } else {
    final taggedList =
        merchList.where((element) => element.tag == tag).toList();
    final selectedMerchList = ref.watch(selectedMerchListProvider);
    for (final merch in selectedMerchList) {
      if (!taggedList.contains(merch)) {
        taggedList.add(merch);
      }
    }
    return taggedList;
  }
}

@riverpod
Future<List<String>> tagList(TagListRef ref) async {
  final merchList =
      await ref.read(merchOutlineRepositoryProvider).fetchMerchOutlineList();
  final List<String> tagList = merchList.map((e) => e.tag).toSet().toList();
  tagList.insert(0, 'null');
  return tagList;
}

@riverpod
class SelectedMerchList extends _$SelectedMerchList {
  @override
  List<MerchOutline> build() => [];

  void add(MerchOutline merch) {
    state = [...state, merch];
  }

  void remove(MerchOutline merch) {
    state = state.where((element) => element.id != merch.id).toList();
  }

  void toggle(MerchOutline merch, BuildContext context) {
    if (state
            .firstWhere((element) => element.id == merch.id,
                orElse: () =>
                    const MerchOutline(id: "-1", name: "", tag: "", unit: ""))
            .id !=
        "-1") {
      remove(merch);
    } else {
      // いい感じにダイアログを出して、amountを入力させる
      showDialog(
        context: context,
        builder: (context) =>
            MerchAmountDialog(merchName: merch.name, unit: merch.unit),
      ).then((amount) {
        if (amount == null) {
          throw Exception('amount is null');
        }
        add(merch.copyWith(amount: amount));
      });
    }
  }
}

@riverpod
class SelectedTag extends _$SelectedTag {
  @override
  String? build() => null;

  void set(String? tag) {
    state = tag;
  }
}

class MerchListTitle extends ConsumerWidget {
  const MerchListTitle({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedMerchList = ref.watch(selectedMerchListProvider);
    return Text('商品一覧: ${selectedMerchList.length}件選択中');
  }
}

class MerchListAction extends ConsumerWidget {
  const MerchListAction({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedTag = ref.watch(selectedTagProvider);
    final selectedTagNotifier = ref.read(selectedTagProvider.notifier);
    return AsyncValueWidget(
      value: ref.watch(tagListProvider),
      builder: (data) => DropdownButton(
        icon: const Icon(Icons.tag),
        value: selectedTag,
        items: data
            .map(
              (e) => DropdownMenuItem(
                value: (e != 'null') ? e : null,
                child: Text((e != 'null') ? e : '全て'),
              ),
            )
            .toList(),
        onChanged: (val) {
          selectedTagNotifier.set(val);
        },
      ),
    );
  }
}

class MerchListFab extends ConsumerWidget {
  const MerchListFab({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedMerchList = ref.watch(selectedMerchListProvider);
    return FloatingActionButton.extended(
      icon: const Icon(Icons.search),
      label: const Text('お店を探す'),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ShopList(
              merchList: selectedMerchList,
              merchName: selectedMerchList
                  .map((e) => '${e.name}(${e.amount}${e.unit})')
                  .join(','),
            ),
          ),
        );
      },
      isExtended: true,
    );
  }
}

class MerchListBody extends ConsumerWidget {
  const MerchListBody({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final merchList = ref.watch(merchListProvider);
    final selectedMerchList = ref.watch(selectedMerchListProvider);
    final selectedMerchListNotifier =
        ref.read(selectedMerchListProvider.notifier);

    return AsyncValueWidget(
      value: merchList,
      builder: (data) {
        return ListView.separated(
          separatorBuilder: (context, index) {
            if (index != data.length - 1 &&
                data[index].tag != data[index + 1].tag) {
              return ListTile(
                title: Text(data[index + 1].tag),
              );
            }
            return const SizedBox();
          },
          itemCount: data.length,
          itemBuilder: (context, index) {
            final selectedMerch = selectedMerchList
                .where((element) => element.id == data[index].id)
                .firstOrNull;
            return MerchOutlineTile(
              data[index],
              onTap: () {
                selectedMerchListNotifier.toggle(data[index], context);
              },
              trailing: Text(
                (selectedMerch != null)
                    ? ('${selectedMerch.amount} ${selectedMerch.unit}')
                    : '',
                style: const TextStyle(
                  fontSize: 18, // テキストのサイズを大きくします。
                  fontWeight: FontWeight.bold, // テキストの太さを太くします。
                ),
              ),
              leading: (selectedMerch != null)
                  ? IconButton(
                      icon: const Icon(Icons.check),
                      onPressed: () {
                        selectedMerchListNotifier.remove(data[index]);
                      },
                    )
                  : null,
              tileColor: (selectedMerch != null)
                  ? Theme.of(context).primaryColor
                  : Colors.white70,
            );
          },
        );
      },
    );
  }
}
