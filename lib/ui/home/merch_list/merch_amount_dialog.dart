import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MerchAmountDialog extends StatefulWidget {
  const MerchAmountDialog({super.key, required this.merchName, required this.unit});

  final String unit;
  final String merchName;

  @override
  State<StatefulWidget> createState() {
    return _MerchAmountDialogState();
  }
}

class _MerchAmountDialogState extends State<MerchAmountDialog> {
  final textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('商品の量を入力してください'),
      content: TextField(
        controller: textController,
        keyboardType: TextInputType.number,
        inputFormatters: [
          FilteringTextInputFormatter.digitsOnly,
        ],
        decoration: InputDecoration(
          hintText: '${widget.merchName}(${widget.unit})',
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('キャンセル'),
        ),
        TextButton(
          onPressed: () {
            if (textController.text.isEmpty) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('量を入力してください')),
              );
              return;
            }
            final amount = int.parse(textController.text);
            if (amount <= 0) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('量は1以上で入力してください')),
              );
              return;
            }
            Navigator.pop(context, amount);
          },
          child: const Text('OK'),
        ),
      ],
    );
  }

  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }
}
