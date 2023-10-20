import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ketchy/ui/home/shop_list.dart';
import 'package:ketchy/ui/home/shop_tile.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return const ProviderScope(
      child: Scaffold(
        body: Center(
          child: ShopList(),
        ),
      ),
    );
  }
}
