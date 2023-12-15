import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:ketchy/model/merch.dart';
import 'package:ketchy/repository/merch_outline_repository.dart';
import 'package:ketchy/repository/shop_repository.dart';
import 'package:ketchy/ui/widgets/async_value_widget.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:uuid/uuid.dart';

part 'add_merch_dialog.g.dart';

@riverpod
class UserMerch extends _$UserMerch {
  @override
  PostedMerch build() {
    final now = DateTime.now();
    final date = DateFormat('yyyy/MM/dd').format(now);
    return PostedMerch(
      id: const Uuid().v4(),
      merchDetailId: '',
      date: date,
      price: 0,
    );
  }

  void update(PostedMerch newEntity) {
    state = newEntity;
  }

  void addMerchToRepository(String shopId) {
    final repository = ref.read(shopRepositoryProvider);
    repository.addMerchToShop(shopId, state.merchDetailId, state);
  }

  Future<List<MerchOutline>> fetchMerchOutlineList() async {
    final repository = ref.read(shopRepositoryProvider);
    return await repository.fetchMerchIdList();
  }
}

@riverpod
Future<List<String>> tagList(TagListRef ref) async {
  final repository = ref.read(shopRepositoryProvider);
  final merchList = await repository.fetchMerchIdList();
  final List<String> tagList = merchList.map((e) => e.tag).toSet().toList();
  tagList.add('');
  return tagList;
}

@riverpod
class SelectedMerchOutline extends _$SelectedMerchOutline {
  @override
  MerchOutline? build(String? merchId) {
    if(merchId == null) return null;
    final provider = ref.read(merchOutlineRepositoryProvider);
    provider.fetchMerchOutline(merchId).then((value) => state = value);
    return null;
  }

  void set(MerchOutline? merch) {
    state = merch;
  }
}

@riverpod
class SelectedTag extends _$SelectedTag {
  @override
  String build() => '';

  void set(
      String tag, SelectedMerchOutlineProvider selectedMerchOutlineProvider) {
    final notifier = ref.read(selectedMerchOutlineProvider.notifier);
    notifier.state = null;
    state = tag;
  }
}

@riverpod
Future<List<MerchOutline>> merchOutlineList(MerchOutlineListRef ref) async {
  final repository = ref.read(shopRepositoryProvider);
  final tag = ref.watch(selectedTagProvider);
  final merchList = await repository.fetchMerchIdList();
  // tagでフィルターをかける
  final filteredList = tag.isEmpty
      ? merchList
      : merchList.where((element) => element.tag == tag).toList();
  return filteredList;
}

@riverpod
class SearchText extends _$SearchText {
  @override
  String build() => '';

  void set(String text) {
    state = text;
  }
}

class AddMerchDialog extends ConsumerWidget {
  const AddMerchDialog(
      {required this.shopId, required this.merchDetailId, super.key});

  final String shopId;
  final String? merchDetailId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedMerchOutlineProviderWithId =
        selectedMerchOutlineProvider(merchDetailId);
    final userMerch = ref.watch(userMerchProvider);
    final userMerchNotifier = ref.read(userMerchProvider.notifier);
    final selectedMerchOutline = ref.watch(selectedMerchOutlineProviderWithId);
    final selectedMerchOutlineNotifier =
        ref.read(selectedMerchOutlineProviderWithId.notifier);
    final searchKeyword = ref.watch(searchTextProvider);
    final searchKeywordNotifier = ref.read(searchTextProvider.notifier);

    final merchOutlineList = ref.watch(merchOutlineListProvider);
    final tagList = ref.watch(tagListProvider);
    final selectedTag = ref.watch(selectedTagProvider);
    final selectedTagNotifier = ref.read(selectedTagProvider.notifier);

    return AlertDialog(
      title: const Text('商品を追加'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          AsyncValueWidget(
            value: tagList,
            builder: (data) => DropdownButton(
              value: selectedTag,
              items: data
                  .map((e) => DropdownMenuItem(
                        value: e,
                        child: Text(e.isNotEmpty ? e : "未選択"),
                      ))
                  .toList(),
              onChanged: (tag) {
                selectedTagNotifier.set(
                  tag ?? '',
                  selectedMerchOutlineProviderWithId,
                );
              },
            ),
          ),
          AsyncValueWidget(
            value: merchOutlineList,
            builder: (data) => ListView(
              children: [
                // キーワード検索用のTextField
                TextField(
                  decoration: const InputDecoration(
                    labelText: 'キーワードを検索',
                    prefixIcon: Icon(Icons.search),
                  ),
                  onChanged: (value) {
                    searchKeywordNotifier.set(value);
                  },
                ),
                // 検索結果を表示するリスト
                for (final merchOutline in data
                    .where((element) => element.name.contains(searchKeyword)))
                  ListTile(
                    title: Text(merchOutline.name),
                    subtitle: Text(merchOutline.tag),
                    onTap: () {
                      selectedMerchOutlineNotifier.set(merchOutline);
                    },
                    selected: selectedMerchOutline == merchOutline,
                  ),
              ],
            ),
          ),
          TextField(
            decoration: const InputDecoration(
              labelText: '価格',
            ),
            keyboardType: TextInputType.number,
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            onChanged: (value) {
              userMerchNotifier
                  .update(userMerch.copyWith(price: double.parse(value)));
            },
          ),
          TextField(
            decoration: const InputDecoration(
              labelText: '説明',
            ),
            onChanged: (value) {
              userMerchNotifier.update(userMerch.copyWith(description: value));
            },
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text('キャンセル'),
        ),
        TextButton(
          onPressed: () {
            if (selectedMerchOutline == null) {
              ScaffoldMessenger.of(context)
                  .showSnackBar(const SnackBar(content: Text('商品を選択してください')));
              return;
            }
            if (userMerch.price == 0) {
              ScaffoldMessenger.of(context)
                  .showSnackBar(const SnackBar(content: Text('価格を入力してください')));
              return;
            }

            ScaffoldMessenger.of(context)
                .showSnackBar(const SnackBar(content: Text('追加しました')));
            userMerchNotifier.addMerchToRepository(shopId);
            Navigator.of(context).pop();
          },
          child: const Text('追加'),
        ),
      ],
    );
  }
}
