import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ketchy/model/merch.dart';
import 'package:ketchy/ui/widgets/async_value_widget.dart';
import '../posted_merch/posted_merch_list.dart';
import 'merch_list.dart';

class MerchDetailTile extends ConsumerWidget {
  const MerchDetailTile(this.merch, this.shopId,
      {super.key, this.onTap, this.trailing});

  final MerchDetail merch;
  final String shopId;
  final VoidCallback? onTap;
  final Widget? trailing;


  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final postedMerchList = ref.watch(
      postedMerchListProvider(shopId: shopId, merchDetailId: merch.id),
    );
    final merchList = ref.watch(merchListProvider);

    return AsyncValueWidget(value: postedMerchList, builder: (postedMerchList) {
      return AsyncValueWidget(value: merchList, builder: (merchList) {
        return _whenPostedMerchData(postedMerchList, merchList);
      });
    });
  }

  Widget _whenPostedMerchData(List<PostedMerch> postedMerchList, List<MerchOutline> merchList) {

    var unit;
    for(final merchOutline in merchList) {
      if(merchOutline.id == merch.id) {
        unit = merchOutline.unit;
      }
    }

    final average_amout = postedMerchList.fold(0, (previousValue, element) => previousValue + element.amount) / postedMerchList.length;
    final merchAveragePrice = merch.averagePrice() * average_amout;

    return ListTile(
      title: Text('${'${merch.name}(${average_amout.toStringAsFixed(0)}'+unit})'),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('平均${merchAveragePrice.toStringAsFixed(2)}円'),
        ],
      ),
      onTap: onTap,
      trailing: trailing,
    );
  }
}
