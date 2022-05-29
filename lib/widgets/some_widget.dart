import 'package:flutter/material.dart';

/// Имитация поля ввода
class SomeWidget extends StatelessWidget {
  const SomeWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10000),
        color: Colors.amber,
      ),
    );
  }
}
