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

  Future<List<Shop>> fetchShopListFromMerchList(List<String> merchIdList);
}

class ShopRepositoryImpl implements ShopRepository {
  @override
  Future<Shop> fetchShop(String shopId) async {
    final snapshot = await FirebaseFirestore.instance
        .collection('march_list')
        .doc(shopId)
        .get();
    log(snapshot.data().toString());
    final shopJson = snapshot.data();
    if (shopJson == null) {
      throw Exception('shop not found');
    } else {
      shopJson['id'] = shopId;
      shopJson['merchList'] = [];
    }
    return Shop.fromJson(shopJson);
  }

  @override
  Future<List<Shop>> fetchShopList() async {
    final snapshot =
        await FirebaseFirestore.instance.collection('shop_list').get();
    final List<Shop> list = [];
    for (var doc in snapshot.docs) {
      final shopJson = doc.data()
        ..['id'] = doc.id
        ..['merchList'] = [];
      final shop = Shop.fromJson(shopJson);
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
      final merchDoc = await instance
          .collection('shop_list')
          .doc(shopDoc.id)
          .collection('merch_list')
          .doc(merchId)
          .get();
      if (!merchDoc.exists) continue;
      final shopJson = shopDoc.data()
        ..['id'] = shopDoc.id
        ..['merchList'] = [];
      final shop = Shop.fromJson(shopJson);

      list.add(
        shop.copyWith(
          merchList: [
            MerchDetail(
              id: merchId,
              name: merchDoc['name'],
              // 文字列型とnum型が混じっているので、一旦文字列型に変換してからnum型に変換
              minPrice: double.parse(merchDoc['minPrice'].toString()),
              maxPrice: double.parse(merchDoc['maxPrice'].toString()),
            ),
          ],
        ),
      );
    }

    return list;
  }

  @override
  Future<List<Shop>> fetchShopListFromMerchList(
      List<String> merchIdList) async {
    final List<Shop> list = [];
    final instance = FirebaseFirestore.instance;
    final shopSnapshot = await instance.collection('shop_list').get();

    for (final shopDoc in shopSnapshot.docs) {
      final List<MerchDetail> merchList = [];
      for (final merchId in merchIdList) {
        final merchDoc = await instance
            .collection('shop_list')
            .doc(shopDoc.id)
            .collection('merch_list')
            .doc(merchId)
            .get();
        if (!merchDoc.exists) continue;

        merchList.add(
          MerchDetail(
            id: merchId,
            name: merchDoc['name'],
            // 文字列型とnum型が混じっているので、一旦文字列型に変換してからnum型に変換
            minPrice: double.parse(merchDoc['minPrice'].toString()),
            maxPrice: double.parse(merchDoc['maxPrice'].toString()),
          ),
        );
      }
      final shopJson = shopDoc.data()
        ..['id'] = shopDoc.id
        ..['merchList'] = [];
      final shop = Shop.fromJson(shopJson);
      list.add(
        shop.copyWith(
          merchList: merchList,
        ),
      );
    }

    return list;
  }
}
