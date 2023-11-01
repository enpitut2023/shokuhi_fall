import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../model/merch.dart';

part 'merch_repository.g.dart';

@riverpod
MerchRepository merchRepository(MerchRepositoryRef ref) =>
    MerchRepositoryImpl();

abstract class MerchRepository {
  Future<Merch> fetchMerch(String merchId);

  Future<List<Merch>> fetchMerchList();

  Future<List<Merch>> fetchMerchListFromShop(String shopId);
}

class MerchRepositoryImpl implements MerchRepository {
  @override
  Future<Merch> fetchMerch(String merchId) async {
    // TODO: implement fetchMerchList
    throw UnimplementedError();
  }

  @override
  Future<List<Merch>> fetchMerchList() async {
    final snapshot =
        await FirebaseFirestore.instance.collection('merch_list').get();
    final List<Merch> list = [];
    for (var doc in snapshot.docs) {
      var merch = Merch(
        id: doc.id,
        name: doc['name'],
      );

      try {
        merch = merch.copyWith(
          description: doc['description'],
        );
      } catch (e) { // 存在しない場合は無視
        log(e.toString());
      }

      list.add(merch);
    }
    return list;
  }

  @override
  Future<List<Merch>> fetchMerchListFromShop(String shopId) {
    // TODO: implement fetchMerchListFromShop
    throw UnimplementedError();
  }
}
