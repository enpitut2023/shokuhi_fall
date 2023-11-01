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
      final merch = Merch(
        id: doc.id,
        name: doc['name'],
        minPrice: 1, // TODO: 価格を取得する
        maxPrice: 1,
        averagePrice: 1,
        description: '',
      );
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
