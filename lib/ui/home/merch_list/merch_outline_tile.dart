import 'package:flutter/material.dart';
import 'package:ketchy/model/merch.dart';

class MerchOutlineTile extends StatelessWidget {
  const MerchOutlineTile(this.merch,
      {super.key, this.onTap, this.trailing, this.leading, this.tileColor});

  final MerchOutline merch;
  final VoidCallback? onTap;
  final Widget? trailing;
  final Widget? leading;
  final Color? tileColor;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text("${merch.name}(${merch.tag})"),
        //subtitle: Text(merch.description ?? ''), // 商品説明（「100gあたりの値段」など）
        onTap: onTap,
        trailing: trailing,
        leading: leading,
        tileColor: tileColor,
      ),
    );
  }
}
