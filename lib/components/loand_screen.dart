import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class LoandScreen extends StatefulWidget {
  const LoandScreen({Key? key}) : super(key: key);

  @override
  State<LoandScreen> createState() => _LoandScreenState();
}

class _LoandScreenState extends State<LoandScreen> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const [
            CircularProgressIndicator(),
            Text('Aguarde'),
          ],
        ),
      ),
    );
  }
}
