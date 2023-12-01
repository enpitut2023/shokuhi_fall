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

  Future<void> addMerchToShop(
      String shopId, String merchDetailId, PostedMerch postedMerch);

  Future<List<MerchOutline>> fetchMerchIdList();

  Future<List<MerchDetail>> fetchMerchDetailList(String shopId);

  Future<List<PostedMerch>> fetchPostedMerchList(
      String shopId, String merchDetailId);
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
      final merchDetailJson = merchDoc.data()!;
      merchDetailJson['id'] = merchId;

      list.add(
        shop.copyWith(
          merchList: [
            MerchDetail.fromJson(merchDetailJson),
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
        final merchDetailJson = merchDoc.data()!;
        merchDetailJson['id'] = merchId;
        merchList.add(
          MerchDetail.fromJson(merchDetailJson),
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

  @override
  Future<void> addMerchToShop(
      String shopId, String merchDetailId, PostedMerch postedMerch) async {
    final merchDetailDocRef = FirebaseFirestore.instance
        .collection('shop_list')
        .doc(shopId)
        .collection('merch_list')
        .doc(merchDetailId);
    await merchDetailDocRef
        .collection('posted_merch_list')
        .doc(postedMerch.id)
        .set(postedMerch.toJson());

    final merchDetailDoc = await merchDetailDocRef.get();

    double sumPrice = postedMerch.price;
    int count = 1;
    if (merchDetailDoc.exists) {
      final merchDetailJson = merchDetailDoc.data()!;
      sumPrice += merchDetailJson['sumPrice'];
      count += merchDetailJson['count'] as int;
    }

    final merchOutlineDocRef = await FirebaseFirestore.instance
        .collection('merch_list')
        .doc(merchDetailId)
        .get();
    var name = "";
    if (merchOutlineDocRef.exists) {
      name = merchOutlineDocRef.data()!['name'];
    }

    merchDetailDocRef.set(
      MerchDetail(
        id: merchDetailId,
        name: name,
        sumPrice: sumPrice,
        count: count,
      ).toJson(),
    );
  }

  @override
  Future<List<MerchOutline>> fetchMerchIdList() async {
    final snapshot =
        await FirebaseFirestore.instance.collection('merch_list').get();
    final List<MerchOutline> list = [];
    for (final doc in snapshot.docs) {
      if (doc.exists) {
        final json = doc.data();
        json['id'] = doc.id;
        list.add(MerchOutline.fromJson(json));
      }
    }
    return list;
  }

  @override
  Future<List<PostedMerch>> fetchPostedMerchList(
      String shopId, String merchDetailId) {
    final instance = FirebaseFirestore.instance;
    return instance
        .collection('shop_list')
        .doc(shopId)
        .collection('merch_list')
        .doc(merchDetailId)
        .collection('posted_merch_list')
        .get()
        .then(
      (snapshot) {
        final List<PostedMerch> list = [];
        for (final doc in snapshot.docs) {
          final json = doc.data();
          list.add(PostedMerch.fromJson(json));
        }
        return list;
      },
    );
  }

  @override
  Future<List<MerchDetail>> fetchMerchDetailList(String shopId) async {
    final snapshot = await FirebaseFirestore.instance
        .collection('shop_list')
        .doc(shopId)
        .collection('merch_list')
        .get();
    final List<MerchDetail> list = [];
    for (final doc in snapshot.docs) {
      if (doc.exists) {
        final json = doc.data();
        json['id'] = doc.id;
        list.add(MerchDetail.fromJson(json));
      }
    }
    return list;
  }
}
