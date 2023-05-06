import 'package:flutter/material.dart';

class OptionButton extends StatelessWidget {
  const OptionButton(this.text, this.onTap, {Key? key}) : super(key: key);

  final String text;
  final void Function(String selectedAnswer) onTap;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        onTap(text);
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color.fromARGB(255, 53, 2, 77),
      ),
      child: Text(
        text,
        textAlign: TextAlign.center,
      ),
    );
  }
}
