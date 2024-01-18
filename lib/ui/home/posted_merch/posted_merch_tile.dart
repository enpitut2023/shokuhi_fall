import 'package:flutter/material.dart';
import 'package:ketchy/model/merch.dart';

class PostedMerchTile extends StatelessWidget {
  const PostedMerchTile({super.key, required this.postedMerch});

  final PostedMerch postedMerch;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text('¥${postedMerch.price}'),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(postedMerch.date),
            Text('量：${postedMerch.amount}'),
            Text('説明：${postedMerch.description ?? ''}'),
          ],
        ),
        tileColor: Colors.white70,
      ),
    );
  }
}
