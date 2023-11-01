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
    final instance = FirebaseFirestore.instance;
    final shopSnapshot = await instance.collection('shop_list').get();

    for (final shopDoc in shopSnapshot.docs) {
      final merchSnapshot = await instance.collection('shop_list').doc(shopDoc.id).collection('merch_list').get();
      for (final merchDoc in merchSnapshot.docs) {
        if (merchId == merchDoc.id) {
          list.add(
            Shop(
              id: merchDoc.id,
              name: shopDoc['shop_name'],
              merchList: [
                Merch(
                  id: merchId,
                  name: merchDoc['name'],
                  minPrice: double.parse(merchDoc['minPrice'].toString()),
                  maxPrice: double.parse(merchDoc['maxPrice'].toString()),
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
