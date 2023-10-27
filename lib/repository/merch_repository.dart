import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../model/merch.dart';

part 'merch_repository.g.dart';

@riverpod
MerchRepository merchRepository(MerchRepositoryRef ref) =>
    MerchRepositoryImpl();

abstract class MerchRepository {
  Future<Merch> fetchMerch(int merchId);

  Future<List<Merch>> fetchMerchList();

  Future<List<Merch>> fetchMerchListFromShop(int shopId);
}

class MerchRepositoryImpl implements MerchRepository {
  @override
  Future<Merch> fetchMerch(int merchId) async {
    // TODO: implement fetchMerchList
    throw UnimplementedError();
  }

  @override
  Future<List<Merch>> fetchMerchList() async {
    return [
      for (final name in ["りんご", "みかん", "バナナ"])
        Merch(
          id: 1,
          name: name,
          minPrice: 100,
          maxPrice: 100,
          averagePrice: 100,
          description: '',
        ),
    ];
  }

  @override
  Future<List<Merch>> fetchMerchListFromShop(int shopId) {
    // TODO: implement fetchMerchListFromShop
    throw UnimplementedError();
  }
}
