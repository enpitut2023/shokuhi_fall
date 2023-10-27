import 'package:flutter/material.dart';
import 'package:ketchy/ui/home/merch_list/merch_list.dart';
import 'package:ketchy/ui/home/shop_list/shop_list.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: MerchList(),
      ),
    );
  }
}
