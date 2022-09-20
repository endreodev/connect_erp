import 'package:flutter/material.dart';

class SimulacaoValores extends StatefulWidget {
  const SimulacaoValores({Key? key}) : super(key: key);

  @override
  State<SimulacaoValores> createState() => _SimulacaoValoresState();
}

class _SimulacaoValoresState extends State<SimulacaoValores> {
  final valorController = TextEditingController();
  final entradaController = TextEditingController();
  final codigoController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  double cNomeValorBem = 0.00;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            const SizedBox(height: 5),
            const Text('Valor do Bem', style: TextStyle(fontSize: 16)),
            Container(
              padding: const EdgeInsets.all(8),
              child: TextFormField(
                controller: valorController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Preencha o campo ';
                  }
                  return null;
                },
                keyboardType: TextInputType.number,
                style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: BorderSide(),
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    gapPadding: 1.0,
                  ),
                ),
              ),
              height: 100,
            ),
            const SizedBox(height: 5),
            const Text('Valor do Bem', style: TextStyle(fontSize: 16)),
            Container(
              padding: const EdgeInsets.all(8),
              child: TextFormField(
                controller: valorController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Preencha o campo ';
                  }
                  return null;
                },
                keyboardType: TextInputType.number,
                style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: BorderSide(),
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    gapPadding: 1.0,
                  ),
                ),
              ),
              height: 100,
            ),
            const SizedBox(height: 5),
            const Text('Valor Financiado', style: TextStyle(fontSize: 16)),
            Container(
              padding: const EdgeInsets.all(8),
              child: TextFormField(
                controller: valorController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Preencha o campo ';
                  }
                  return null;
                },
                keyboardType: TextInputType.number,
                style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: BorderSide(),
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    gapPadding: 1.0,
                  ),
                ),
              ),
              height: 100,
            ),
            TextButton(
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Theme.of(context).colorScheme.secondary),
                ),
                child: Container(
                  height: 60,
                  width: 400,
                  child: const Center(
                      child: Text('Calcular Simulação',
                          style: TextStyle(color: Colors.white, fontSize: 16))),
                ),
                onPressed: () {
                  Navigator.pop(context);
                })
          ],
        ),
      ),
    );
  }
}
