import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../model/merch.dart';

part 'merch_repository.g.dart';

@riverpod
MerchRepository merchRepository(MerchRepositoryRef ref) =>
    MerchRepositoryImpl();

abstract class MerchRepository {
  Future<MerchOutline> fetchMerch(String merchId);

  Future<List<MerchOutline>> fetchMerchList();

  Future<List<MerchOutline>> fetchMerchListFromShop(String shopId);
}

class MerchRepositoryImpl implements MerchRepository {
  @override
  Future<MerchOutline> fetchMerch(String merchId) async {
    // TODO: implement fetchMerchList
    throw UnimplementedError();
  }

  @override
  Future<List<MerchOutline>> fetchMerchList() async {
    final snapshot =
        await FirebaseFirestore.instance.collection('merch_list').get();
    final List<MerchOutline> list = [];
    for (var doc in snapshot.docs) {
      final json = doc.data()..['id'] = doc.id;
      var merch = MerchOutline.fromJson(json);
      list.add(merch);
    }
    return list;
  }

  @override
  Future<List<MerchOutline>> fetchMerchListFromShop(String shopId) {
    // TODO: implement fetchMerchListFromShop
    throw UnimplementedError();
  }
}
