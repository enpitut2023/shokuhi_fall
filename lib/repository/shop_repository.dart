import 'package:ketchy/model/merch.dart';
import 'package:ketchy/model/shop.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'shop_repository.g.dart';

@riverpod
ShopRepository shopRepository(ShopRepositoryRef ref) => DummyShopRepository();

abstract class ShopRepository {
  Future<Shop> fetchShop(int shopId);

  Future<List<Shop>> fetchShopList();
}

class DummyShopRepository implements ShopRepository {
  @override
  Future<Shop> fetchShop(int shopId) async {
    return _ropia.copyWith(id: shopId);
  }

  @override
  Future<List<Shop>> fetchShopList() {
    return Future.value(
      [
        for (final name in ["ロピア", "トライアル", "カスミ"]) _ropia.copyWith(name: name),
      ],
    );
  }

  final Shop _ropia = const Shop(
    id: 0,
    name: 'ロピア',
    merchList: [
      Merch(
        id: 1,
        name: "豚小間切れ",
        minPrice: 89,
        maxPrice: 110,
        averagePrice: (110 + 89) / 2,
        description: "100gあたりの値段。多いほどグラム単価は安い",
      ),
      Merch(
        id: 2,
        name: "アボカド",
        minPrice: 98,
        maxPrice: 130,
        averagePrice: (130 + 98) / 2,
        description: "月曜日は安い",
      ),
    ],
  );
}
