import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class InputTextWidget extends StatelessWidget {
  final String label;
  final IconData icon;
  final bool obscure;
  final String? initalValue;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final void Function(String value) onChanged;
  const InputTextWidget(
      {Key? key,
      required this.label,
      required this.icon,
      required this.onChanged,
      this.initalValue,
      required this.obscure,
      this.validator,
      this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return /*Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: */
        Column(
      children: [
        TextFormField(
          controller: controller,
          initialValue: initalValue,
          validator: validator,
          onChanged: onChanged,
          obscureText: obscure,
          keyboardType: TextInputType.text,
          //style: TextStyles.input,
          decoration: InputDecoration(
              contentPadding: EdgeInsets.zero,
              labelText: label,
              //  labelStyle: TextStyles.input,
              icon: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 18),
                    child: Icon(
                      icon,
                      color: Colors.yellow[700],
                    ),
                  ),
                  Container(
                    width: 1,
                    height: 48,
                    color: Colors.grey[800],
                  )
                ],
              ),
              border: InputBorder.none),
        ),
        const Divider(height: 1, thickness: 1, color: Colors.black)
      ],
      //),
    );
  }
}

class InputTextWidgetForm extends StatelessWidget {
  final String label;

  final TextInputType? keybordeNamber;
  final bool obscure;
  final bool lEdite;
  final String? initalValue;
  final int? sizeFont;
  final bool? lalingcenter;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final void Function(String value) onChanged;
  const InputTextWidgetForm({
    Key? key,
    required this.label,
    required this.onChanged,
    this.initalValue,
    required this.lEdite,
    required this.obscure,
    this.validator,
    this.controller,
    this.sizeFont,
    this.keybordeNamber,
    this.lalingcenter = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return /*Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: */
        Column(
      children: [
        TextFormField(
          controller: controller,
          initialValue: initalValue,
          validator: validator,
          onChanged: onChanged,
          obscureText: obscure,
          textAlign: (lalingcenter!) ? TextAlign.center : TextAlign.left,
          keyboardType: (keybordeNamber == null)
              ? TextInputType.text
              : TextInputType.number,
          readOnly: lEdite,
          style: const TextStyle(fontSize: 28),
          decoration: InputDecoration(
              contentPadding: EdgeInsets.zero,
              labelText: label,
              labelStyle: const TextStyle(fontSize: 13),
              icon: Row(
                mainAxisSize: MainAxisSize.min,
                children: const [],
              ),
              border: InputBorder.none),
        ),
        const Divider(height: 1, thickness: 1, color: Colors.black)
      ],
      //),
    );
  }
}
