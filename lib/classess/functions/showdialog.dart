import 'dart:convert';
import 'package:flutter/material.dart';
import '../../bloc/bloc_atendimento/class/interface_atendimento.dart';
import '../../main.dart';

void showMyDialog(notific) {
  List<IterfaceAtendimento> Atendimentoslista = <IterfaceAtendimento>[];

  Widget okButton = OutlinedButton(
    onPressed: () {
      Map<String, dynamic> valueMap = json.decode(notific.data['atendimento']);

      Atendimentoslista.add(IterfaceAtendimento.fromJson(valueMap));

      Navigator.of(navigatiorKey.currentContext!)
          .pushNamed('/home', arguments: Atendimentoslista[0]);
    },
    child: const Text('Ver'),
  );

  Widget oCloseButton = OutlinedButton(
    onPressed: () => Navigator.pop(navigatiorKey.currentContext!),
    child: const Text('Fechar'),
  );

  AlertDialog alerta = AlertDialog(
    title: Text(
      notific.notification!.title.toString(),
      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
    ),
    content: Text(
      notific.notification!.body.toString(),
      style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
    ),
    actions: [
      oCloseButton,
      okButton,
    ],
  );

  showDialog(
      context: navigatiorKey.currentContext!,
      builder: (BuildContext context) {
        return alerta;
      });
}
