import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ketchy/model/shop.dart';
import 'package:ketchy/repository/shop_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'merch_tile.dart';

class ShopDetail extends ConsumerWidget {
  const ShopDetail({super.key, required this.shop});

  final Shop shop;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
}
