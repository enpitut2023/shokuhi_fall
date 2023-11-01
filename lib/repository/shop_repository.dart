import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ketchy/model/merch.dart';
import 'package:ketchy/model/shop.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'shop_repository.g.dart';

@riverpod
ShopRepository shopRepository(ShopRepositoryRef ref) => ShopRepositoryImpl();

abstract class ShopRepository {
  Future<Shop> fetchShop(String shopId);

  Future<List<Shop>> fetchShopList();

  Future<List<Shop>> fetchShopListFromMerch(String merchId);
}

class ShopRepositoryImpl implements ShopRepository {
  @override
  Future<Shop> fetchShop(String shopId) async {
    final snapshot = await FirebaseFirestore.instance
        .collection('march_list')
        .doc(shopId)
        .get();
    log(snapshot.data().toString());
    return const Shop(id: "id", name: "name", merchList: []);
  }

  @override
  Future<List<Shop>> fetchShopList() async {
    final snapshot =
        await FirebaseFirestore.instance.collection('shop_list').get();
    final List<Shop> list = [];
    for (var doc in snapshot.docs) {
      // TODO: docからデータを取得してShopを作成
      final shop = Shop(
        id: "1",
        name: doc['shop_name'],
        merchList: [],
      );
      list.add(shop);
    }
    return list;
  }

  @override
  Future<List<Shop>> fetchShopListFromMerch(String merchId) async {
    final List<Shop> list = [];

    for (final shopId in [
      '64F4jTheLRdoPay7Odma',
      'IW2LwCdI1ikKTEHsS4JK',
      'OUIISO2PdczSx3KHC1Fo',
      'fbLR0cv4pl8M8qEwsCU0'
    ]) {
      final shopSnapshot =
          FirebaseFirestore.instance.collection('shop_list').doc(shopId);
      final snapshot = await shopSnapshot.collection('merch_list').get();
      for (final doc in snapshot.docs) {
        if (merchId == doc.id) {
          final merchSnapshot =
              await shopSnapshot.collection('merch_list').doc(merchId).get();
          list.add(
            Shop(
              id: doc.id,
              name: (await shopSnapshot.get())['shop_name'],
              merchList: [
                Merch(
                  id: merchId,
                  name: merchSnapshot['name'],
                  minPrice: double.parse(merchSnapshot['minPrice'].toString()),
                  maxPrice: double.parse(merchSnapshot['maxPrice'].toString()),
                  averagePrice: 0,
                  description: '',
                ),
              ],
            ),
          );
        }
      }
    }

    return list;
  }
}

class DummyShopRepository implements ShopRepository {
  @override
  Future<Shop> fetchShop(String shopId) async {
    return _ropia.copyWith(id: shopId);
  }

  @override
  Future<List<Shop>> fetchShopList() {
    return Future.value(
      [
        for (final name in ["ロピア", "トライアル", "カスミ"]) _ropia.copyWith(name: name),
        _idealShop,
      ],
    );
  }

  final Shop _idealShop = const Shop(
    id: "0",
    name: '理想の店',
    merchList: [
      Merch(
        id: "1",
        name: "豚小間切れ",
        minPrice: 1,
        maxPrice: 10,
        averagePrice: 5,
        description: "100gあたりの値段。多いほどグラム単価は安い",
      ),
      Merch(
        id: "1",
        name: "5円",
        minPrice: 1,
        maxPrice: 1,
        averagePrice: 1,
        description: "5円なのに1円",
      ),
    ],
  );

  final Shop _ropia = const Shop(
    id: "0",
    name: 'ロピア',
    merchList: [
      Merch(
        id: "1",
        name: "豚小間切れ",
        minPrice: 89,
        maxPrice: 110,
        averagePrice: (110 + 89) / 2,
        description: "100gあたりの値段。多いほどグラム単価は安い",
      ),
      Merch(
        id: "2",
        name: "アボカド",
        minPrice: 98,
        maxPrice: 130,
        averagePrice: (130 + 98) / 2,
        description: "月曜日は安い",
      ),
    ],
  );

  @override
  Future<List<Shop>> fetchShopListFromMerch(String merchName) {
    return fetchShopList();
  }
}
