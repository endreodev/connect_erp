import 'package:connect_erp/widgets/button_drawer_widget/button_drawer_widget.dart';
import 'package:flutter/material.dart';
import '../../../classess/functions/snackbar.dart';

class SimulacaoScreen extends StatefulWidget {
  const SimulacaoScreen({Key? key}) : super(key: key);

  @override
  State<SimulacaoScreen> createState() => _SimulacaoScreenState();
}

class _SimulacaoScreenState extends State<SimulacaoScreen> {
  final valorController = TextEditingController();
  final entradaController = TextEditingController();
  final codigoController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  double cNomeValorBem = 0.00;

  String cFinanciamento = 'Selecione o Tipo de Financiamento';
  List<String> tiposdefinanciamento = [
    'Anual - 12,75%',
    'Anual - 12,25%',
    'Anual - 11,75%',
    'Semestral',
    'Mensal'
  ];

  String cTipoOperacao = 'Selecione o Tipo de Operação';
  List<String> listatiposdeOperacao = [
    'PF - Crédito Rural',
    'PJ - Crédito Rural',
    'PF - Não CR',
    'PJ - Não CR',
  ];

  String selectedParcela = 'Quantidade de Parcelas';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Simulação'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              const SizedBox(height: 15),
              const Text('Modalidade de Financiamento', style: TextStyle(fontSize: 16)),
              ButtonDrawerWidget(
                selected: cFinanciamento,
                list: tiposdefinanciamento,
                onChanged: (value) {
                  setState(() {
                    cFinanciamento = value!;
                    selectedParcela = '1';
                  });
                },
              ),
              const SizedBox(height: 15),
              const Text('Tipo de Financiamento', style: TextStyle(fontSize: 16)),
              ButtonDrawerWidget(
                selected: cTipoOperacao,
                list: listatiposdeOperacao,
                onChanged: (value) {
                  if (cFinanciamento != 'Selecione o Tipo de Financiamento') {
                    setState(() {
                      cTipoOperacao = value!;
                    });
                  } else {
                    SnackMenssageWarning('Selecione o Tipo de Financiamento');
                  }
                },
              ),
              const SizedBox(height: 15),
              const Text('Parcelas Financiamento', style: TextStyle(fontSize: 16)),
              generateParcelas(cFinanciamento),
              TextButton(
                child: Container(
                  height: 60,
                  width: 410,
                  decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.secondary,
                      borderRadius: BorderRadius.circular(10)),
                  child: const Center(
                    child: Text(
                      'Calcular Simulação',
                      style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  generateParcelas(String? string) {
    List<String> listaParcelas = [];

    switch (string) {
      case 'Anual - 12,75%':
        for (int i = 0; i < 6; i++) {
          if (i > 0) {
            listaParcelas.add(i.toString());
          }
        }
        break;
      case 'Anual - 12,25%':
        for (int i = 0; i < 5; i++) {
          if (i > 0) {
            listaParcelas.add(i.toString());
          }
        }
        break;
      case 'Anual - 11,75%':
        for (int i = 0; i < 4; i++) {
          if (i > 0) {
            listaParcelas.add(i.toString());
          }
        }
        break;
      case 'Semestral':
        for (int i = 0; i < 11; i++) {
          if (i > 0) {
            listaParcelas.add(i.toString());
          }
        }
        break;
      case 'Mensal':
        for (int i = 0; i < 61; i++) {
          if (i > 0) {
            listaParcelas.add(i.toString());
          }
        }

        break;
      default:
        for (int i = 0; i < 2; i++) {
          if (i > 0) {
            listaParcelas.add(i.toString());
          }
        }
        break;
    }

    return ButtonDrawerWidget(
      selected: selectedParcela,
      list: listaParcelas,
      onChanged: (value) {
        setState(() {
          selectedParcela = value!;
        });
      },
    );
  }
}
