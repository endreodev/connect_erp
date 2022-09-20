import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  final VoidCallback onTap;
  final String text;
  const ButtonWidget({Key? key, required this.onTap, required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 60,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: Colors.yellow[700],
          onSurface: Colors.yellow[700],
          elevation: 3,
          shadowColor: Colors.yellow[700],
        ),
        child: Text(
          text,
          style: const TextStyle(color: Colors.black),
        ),
        onPressed: onTap,
      ),
    );
  }
}
