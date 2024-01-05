import 'package:flutter/material.dart';
import 'package:ketchy/model/merch.dart';

class MerchOutlineTile extends StatelessWidget {
  const MerchOutlineTile(this.merch, {super.key, this.onTap, this.trailing, this.tileColor});

  final MerchOutline merch;
  final VoidCallback? onTap;
  final Widget? trailing;
  final Color? tileColor;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text("${merch.name}(${merch.tag})"),
      //subtitle: Text(merch.description ?? ''), // 商品説明（「100gあたりの値段」など）
      onTap: onTap,
      trailing: trailing,
      tileColor: tileColor,
    );
  }
}
