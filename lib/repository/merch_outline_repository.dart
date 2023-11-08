import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../model/merch.dart';

part 'merch_outline_repository.g.dart';

@riverpod
MerchOutlineRepository merchOutlineRepository(MerchOutlineRepositoryRef ref) =>
    MerchOutlineRepositoryImpl();

abstract class MerchOutlineRepository {

  Future<List<MerchOutline>> fetchMerchOutlineList();

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
}
