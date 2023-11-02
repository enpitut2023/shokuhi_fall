import 'package:flutter/material.dart';
import 'package:ketchy/model/merch.dart';

class MerchOutlineTile extends StatelessWidget {
  const MerchOutlineTile(this.merch, {super.key, this.onTap, this.trailing});

  final MerchOutline merch;
  final VoidCallback? onTap;
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(merch.name),
      subtitle: Text(merch.description ?? ''),
      onTap: onTap,
      trailing: trailing,
    );
  }
}
