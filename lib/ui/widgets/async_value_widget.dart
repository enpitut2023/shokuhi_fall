
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AsyncValueWidget<T> extends StatelessWidget {
  final AsyncValue<T> value;
  final Widget Function(T) builder;

  const AsyncValueWidget({
    super.key,
    required this.value,
    required this.builder,
  });

  @override
  Widget build(BuildContext context) {
    return value.when(
      data: builder,
      loading: () => _whenLoading(),
      error: _whenError,
    );
  }

  Widget _whenError(Object error, StackTrace stackTrace) {
    return Column(
      children: [
        SelectableText(error.toString()),
        SelectableText(stackTrace.toString()),
      ],
    );
  }

  Widget _whenLoading() {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }

}