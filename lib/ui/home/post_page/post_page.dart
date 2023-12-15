import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ketchy/model/shop.dart';
import 'package:ketchy/repository/shop_repository.dart';
import 'package:ketchy/ui/shop_detail/add_merch_dialog.dart';
import 'package:ketchy/ui/widgets/async_value_widget.dart';
import 'package:ketchy/ui/widgets/list_divider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'post_page.g.dart';

@riverpod
Future<List<Shop>> shopList(ShopListRef ref) async {
  final shopList = await ref.read(shopRepositoryProvider).fetchShopList();
  return shopList;
}

class PostPageTitle extends StatelessWidget {
  const PostPageTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Text(
      "商品情報投稿",
    );
  }
}

class PostPageBody extends ConsumerWidget {
  const PostPageBody({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final shopList = ref.watch(shopListProvider);
    return AsyncValueWidget(
      value: shopList,
      builder: (shopList) => ListView.separated(
        itemCount: shopList.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text(shopList[index].name),
            subtitle: Text(shopList[index].address),
            onTap: () {
              showDialog(
                context: context,
                builder: (context) => AddMerchDialog(
                  shopId: shopList[index].id,
                  merchDetailId: null,
                ),
              );
            },
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return const ListDivider();
        },
      ),
    );
  }
}
