import 'package:flutter/material.dart';
import 'package:ketchy/model/merch.dart';

class MerchTile extends StatelessWidget {
  const MerchTile(this.merch,
      {super.key, this.onTap, this.trailing});

  final Merch merch;
  final VoidCallback? onTap;
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    final showPrice = merch.minPrice != null && merch.maxPrice != null;
    return ListTile(
      title: Text(merch.name),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (merch.description != null) Text(merch.description!),
          if (showPrice) Text('${merch.minPrice}円 ~ ${merch.maxPrice}円'),
        ],
      ),
      onTap: onTap,
      trailing: trailing,
    );
  }
}
