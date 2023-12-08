import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../model/merch.dart';

part 'merch_outline_repository.g.dart';

@riverpod
MerchOutlineRepository merchOutlineRepository(MerchOutlineRepositoryRef ref) =>
    MerchOutlineRepositoryImpl();

abstract class MerchOutlineRepository {

  Future<List<MerchOutline>> fetchMerchOutlineList();

  Future<MerchOutline> fetchMerchOutline(String merchId);

  Future<void> addMerchOutline(MerchOutline merchOutline);

}

class MerchOutlineRepositoryImpl implements MerchOutlineRepository {

  @override
  Future<List<MerchOutline>> fetchMerchOutlineList() async {
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
  Future<void> addMerchOutline(MerchOutline merchOutline) {
    return FirebaseFirestore.instance
        .collection('merch_list')
        .add(merchOutline.toJson());
  }

  @override
  Future<MerchOutline> fetchMerchOutline(String merchId) async {
    final snapshot =
        await FirebaseFirestore.instance.collection('merch_list').doc(merchId).get();
    if(!snapshot.exists){
      throw Exception('merchId: $merchId は存在しません');
    }
    final json = snapshot.data()?..['id'] = snapshot.id;
    return MerchOutline.fromJson(json!);
  }
}
