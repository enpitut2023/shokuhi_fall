import 'package:flutter/material.dart';
import 'package:ketchy/model/merch.dart';

class MerchTile extends StatelessWidget {
  const MerchTile(this.merch, {super.key, this.onTap});

  final Merch merch;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final showPrice = merch.minPrice != null && merch.maxPrice != null;
    return ListTile(
      title: Text(merch.name),
      subtitle:
          (showPrice) ? Text('${merch.minPrice}円 ~ ${merch.maxPrice}円') : null,
      onTap: onTap,
    );
  }
}
