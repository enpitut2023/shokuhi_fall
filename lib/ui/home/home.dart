import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ketchy/ui/home/help/help.dart';
import 'package:ketchy/ui/home/merch_list/merch_list.dart';
import 'package:ketchy/ui/home/post_page/post_page.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:url_launcher/url_launcher.dart';

part 'home.g.dart';

@riverpod
class SelectedBottomNavigationItemIndex
    extends _$SelectedBottomNavigationItemIndex {
  @override
  int build() => 0;

  void set(int index) {
    state = index;
  }
}

class Home extends ConsumerWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final index = ref.watch(selectedBottomNavigationItemIndexProvider);
    final notifier =
        ref.read(selectedBottomNavigationItemIndexProvider.notifier);
    return Scaffold(
      appBar: AppBar(
        title: (index == 0) ? const MerchListTitle() : const PostPageTitle(),
        actions: [
          if (index == 0)
            IconButton(
              icon: const Icon(Icons.help),
              color: Colors.deepOrange.withOpacity(0.8),
              onPressed: () {
                _showHelpDialog(context);
              },
            ),
          if (index == 0) const MerchListAction(),
          if (index == 1)
            OutlinedButton(
              onPressed: () {
                // お店追加依頼の処理
                final url = Uri.parse(
                    'https://docs.google.com/forms/d/11si3OVqnCS0hlz_KKaeEdpBA3BoqMKROcE95jsaCj5I/viewform?edit_requested=true');
                launchUrl(url);
              },
              child: const Text('お店追加依頼'),
            ),
        ],
      ),
      floatingActionButton: (index == 0) ? const MerchListFab() : null,
      body: (index == 0) ? const MerchListBody() : const PostPageBody(),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '商品一覧',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.post_add),
            label: '商品情報投稿',
          ),
        ],
        currentIndex: index,
        onTap: (index) {
          notifier.set(index);
        },
      ),
    );
  }

  Future<void> _showHelpDialog(BuildContext context) async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return const HelpDialog();
      },
    );
  }
}
