import 'package:flutter/material.dart';

class ClassValidForm {
  final formKey = GlobalKey<FormState>();

  String? validateCampo(String? value) {
    if (value!.isEmpty) {
      return "O nome não pode ser vazio";
    } else {
      return null;
    }
  }

  String? validateEmail(String? value) {
    if (value!.isEmpty) {
      return "O nome não pode ser vazio";
    } else if (value.contains('@')) {
      return "Este não é um email valido";
    } else {
      return null;
    }
  }

  String? validateUsuario(String? value) {
    if (value!.isEmpty) {
      return "O nome n�o pode ser vazio";
    } else if (value.length < 3) {
      return "Nome muito curto";
    } else {
      return null;
    }
  }

  String? validateSenha(String? value) {
    if (value!.isEmpty) {
      return "A senha não pode ser vazio";
    } else {
      return null;
    }
  }

  void onChange(value) {
    value = value!.toLowerCase();
  }

  onValideForm(ctx) {
    // Validate returns true if the form is valid, or false otherwise.
    if (formKey.currentState!.validate()) {
      return true;
    } else {
      return false;
    }
  }

  void fwalert(BuildContext ctx, String cmsg, Color cor) {
    ScaffoldMessenger.of(ctx).showSnackBar(
      SnackBar(
        backgroundColor: cor,
        content: Text(
          cmsg.toString().toUpperCase(),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
