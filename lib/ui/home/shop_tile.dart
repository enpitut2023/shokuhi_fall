import 'package:flutter/material.dart';

class ShopTile extends StatelessWidget {
  const ShopTile({
    super.key,
    required this.shopName,
    required this.onTap,
  });

  final String shopName;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      title: Text(shopName),
    );
  }
}
