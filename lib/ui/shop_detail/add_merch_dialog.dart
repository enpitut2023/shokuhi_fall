import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:ketchy/model/merch.dart';
import 'package:ketchy/repository/merch_outline_repository.dart';
import 'package:ketchy/repository/shop_repository.dart';
import 'package:ketchy/ui/widgets/async_value_widget.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:uuid/uuid.dart';
import 'package:url_launcher/url_launcher.dart';

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
      amount: 0,
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
    if (merchId == null) return null;
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

class AddMerchDialog extends ConsumerWidget {
  AddMerchDialog(
      {required this.shopId, required this.merchDetailId, super.key});

  final String shopId;
  final String? merchDetailId;
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedMerchOutlineProviderWithId =
        selectedMerchOutlineProvider(merchDetailId);
    final userMerch = ref.watch(userMerchProvider);
    final userMerchNotifier = ref.read(userMerchProvider.notifier);
    final selectedMerchOutline = ref.watch(selectedMerchOutlineProviderWithId);
    final selectedMerchOutlineNotifier =
        ref.read(selectedMerchOutlineProviderWithId.notifier);
    final merchOutlineList = ref.watch(merchOutlineListProvider);
    final tagList = ref.watch(tagListProvider);
    final selectedTag = ref.watch(selectedTagProvider);
    final selectedTagNotifier = ref.read(selectedTagProvider.notifier);

    return AlertDialog(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text('価格情報を投稿'),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: OutlinedButton(
              onPressed: () {
                final url = Uri.parse('https://docs.google.com/forms/d/1jui3GkT1v9ssCBggm_QK0LSjAhdD-NKwvbdkM9IGEjc/viewform?edit_requested=true');
                launchUrl(url);
              },
              child: const Text('商品追加依頼'),
            ),
          ),
        ],
      ),
      content: Form(
        key: formKey,
        child: Column(
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
              builder: (data) => DropdownButton(
                icon: const Icon(Icons.tag),
                value: selectedMerchOutline,
                items: data
                    .map(
                      (e) => DropdownMenuItem(
                        value: e,
                        child: Text(e.name),
                      ),
                    )
                    .toList(),
                onChanged: (val) {
                  selectedMerchOutlineNotifier.set(val);
                  if (val == null) return;
                  userMerchNotifier.update(
                    userMerch.copyWith(merchDetailId: val.id),
                  );
                },
              ),
            ),
            TextFormField(
              decoration: const InputDecoration(
                labelText: '価格',
              ),
              keyboardType: TextInputType.number,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              onChanged: (value) {
                userMerchNotifier
                    .update(userMerch.copyWith(price: double.parse(value)));
              },
              validator: (value) {
                if (value == null || value.isEmpty || value == '0') {
                  return '価格を入力してください';
                }
                if (int.parse(value) >= 100000) {
                  return '価格が高すぎます';
                }
                return null;
              },
            ),
            TextFormField(
              decoration: InputDecoration(
                labelText: '量（${selectedMerchOutline?.unit ?? ""}）',
              ),
              keyboardType: TextInputType.number,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              onChanged: (value) {
                userMerchNotifier
                    .update(userMerch.copyWith(amount: int.parse(value)));
              },
              validator: (value) {
                if (value == null || value.isEmpty || value == '0') {
                  return '量を入力してください';
                }
                if (int.parse(value) >= 100000) {
                  return '量が多すぎます';
                }
                return null;
              },
            ),
            TextFormField(
              decoration: const InputDecoration(
                labelText: '説明',
              ),
              onChanged: (value) {
                userMerchNotifier
                    .update(userMerch.copyWith(description: value));
              },
            ),
          ],
        ),
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
            if (formKey.currentState?.validate() != true) {
              return;
            }
            if (selectedMerchOutline == null) {
              Fluttertoast.showToast(
                msg: '商品を選択してください',
                toastLength: Toast.LENGTH_SHORT,
              );
              return;
            }
            ScaffoldMessenger.of(context)
                .showSnackBar(const SnackBar(content: Text('追加しました')));
            userMerchNotifier.addMerchToRepository(shopId);
            Navigator.of(context).pop();
          },
          child: const Text('投稿'),
        ),
      ],
    );
  }
}
