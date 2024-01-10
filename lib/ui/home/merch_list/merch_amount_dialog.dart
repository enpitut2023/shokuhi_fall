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
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('商品の量を入力してください'),
      content: Form(
        key: formKey,
        child: TextFormField(
          controller: textController,
          keyboardType: TextInputType.number,
          inputFormatters: [
            FilteringTextInputFormatter.digitsOnly,
          ],
          decoration: InputDecoration(
            hintText: '${widget.merchName}(${widget.unit})',
          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return '量を入力してください';
            }
            if (int.parse(value) <= 0) {
              return '量は1以上で入力してください';
            }
            return null;
          }
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
            if (formKey.currentState?.validate() != true) {
              return;
            }
            final amount = int.parse(textController.text);
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
