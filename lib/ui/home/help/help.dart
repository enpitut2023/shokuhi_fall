import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HelpDialog extends StatelessWidget {
  const HelpDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('ヘルプ'),
      content: SingleChildScrollView(
        child: ListBody(
          children: <Widget>[
            const Text('商品を選んで検索する手順を説明します。'),
            const Text(''),
            const Text('① まずは商品一覧から購入したい商品を選んでください。'),
            Image.asset(
              'images/merch_help1.jpeg',
            ),
            const Text(''),
            const Text('② 商品をクリックすると下のような画面が表示されるので、その商品の購入したい量を入力してください。'),
            Image.asset(
              'images/merch_help2.jpeg',
            ),
            const Text(''),
            const Text('③ 最後に、右下の「お店を探す」ボタンをクリックすることでお店ごとの商品の価格を調べることができます。'),
            Image.asset(
              'images/merch_help3.jpeg',
            ),
          ],
        ),
      ),
      actions: <Widget>[
        TextButton(
          child: const Text('閉じる'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}