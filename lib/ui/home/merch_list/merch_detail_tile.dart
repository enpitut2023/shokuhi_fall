import 'package:flutter/material.dart';
import 'package:ketchy/model/merch.dart';

class MerchDetailTile extends StatelessWidget {
  const MerchDetailTile(this.merch,
      {super.key, this.onTap, this.trailing});

  final MerchDetail merch;
  final VoidCallback? onTap;
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(merch.name),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('平均${merch.averagePrice()}円'),
        ],
      ),
      onTap: onTap,
      trailing: trailing,
    );
  }
}
