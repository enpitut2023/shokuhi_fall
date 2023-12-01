import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:ketchy/model/merch.dart';
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
class SelectedMerchOutline extends _$SelectedMerchOutline {
  @override
  MerchOutline? build() => null;

  void set(MerchOutline? merch) {
    state = merch;
  }
}

@riverpod
Future<List<MerchOutline>> merchOutlineList(MerchOutlineListRef ref) async {
  final repository = ref.read(shopRepositoryProvider);
  return await repository.fetchMerchIdList();
}

class AddMerchDialog extends ConsumerWidget {
  const AddMerchDialog({required this.shopId, super.key});

  final String shopId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userMerch = ref.watch(userMerchProvider);
    final userMerchNotifier = ref.read(userMerchProvider.notifier);
    final selectedMerchDetail = ref.watch(selectedMerchOutlineProvider);
    final selectedMerchDetailNotifier =
        ref.read(selectedMerchOutlineProvider.notifier);
    final merchDetailList = ref.watch(merchOutlineListProvider);

    return AlertDialog(
      title: const Text('商品を追加'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          AsyncValueWidget(
            value: merchDetailList,
            builder: (data) => DropdownButton(
              icon: const Icon(Icons.tag),
              value: selectedMerchDetail,
              items: data
                  .map(
                    (e) => DropdownMenuItem(
                      value: e,
                      child: Text(e.name),
                    ),
                  )
                  .toList(),
              onChanged: (val) {
                selectedMerchDetailNotifier.set(val);
                if (val == null) return;
                userMerchNotifier.update(
                  userMerch.copyWith(merchDetailId: val.id),
                );
              },
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