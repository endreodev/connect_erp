import 'package:flutter/material.dart';
import '../../main.dart';

void SnackMenssageWarning(String cMenssage) {
  final snackBar = SnackBar(
    backgroundColor: Colors.amber.shade400,
    content: Text(
      cMenssage,
      style: const TextStyle(color: Colors.black),
    ),
    // action: SnackBarAction(
    //   label: 'Fechar',
    //   onPressed: () {
    //     // Some code to undo the change.
    //   },
    // ),
  );

  ScaffoldMessenger.of(navigatiorKey.currentContext!).showSnackBar(snackBar);
}

void SnackMenssageError(String cMenssage) {
  final snackBar = SnackBar(
    backgroundColor: Colors.redAccent.shade400,
    content: Text(cMenssage),
    // action: SnackBarAction(
    //   label: 'Fechar',
    //   onPressed: () {
    //     // Some code to undo the change.
    //   },
    // ),
  );

  ScaffoldMessenger.of(navigatiorKey.currentContext!).showSnackBar(snackBar);
}

void SnackMenssageSuccess(String cMenssage) {
  final snackBar = SnackBar(
    backgroundColor: Colors.green.shade400,
    content: Text(cMenssage),
    // action: SnackBarAction(
    //   label: 'Fechar',
    //   onPressed: () {
    //     // Some code to undo the change.
    //   },
    // ),
  );

  ScaffoldMessenger.of(navigatiorKey.currentContext!).showSnackBar(snackBar);
}

void activeModalBottomSheet() {
  showModalBottomSheet(
    context: navigatiorKey.currentContext!,
    isScrollControlled: true,
    builder: (BuildContext ctx) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Text('Aguarde... ',
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
              )),
          SizedBox(
            height: 20,
          ),
          CircularProgressIndicator(),
        ],
      );
    },
  );
}
