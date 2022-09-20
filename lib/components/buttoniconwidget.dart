import 'package:flutter/material.dart';

class ButtonIconWidget extends StatelessWidget {
  final IconData icon;
  final VoidCallback? onTap;
  const ButtonIconWidget({
    Key? key,
    this.onTap,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(icon),
      onPressed: onTap,
    );
  }
}
