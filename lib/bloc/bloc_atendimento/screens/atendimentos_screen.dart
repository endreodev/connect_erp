import 'package:connect_erp/bloc/bloc_atendimento/class/interface_atendimento.dart';
import 'package:flutter/material.dart';
import '../service/atendimento_service.dart';

class AtendimentosScreen extends StatefulWidget {
  const AtendimentosScreen({Key? key}) : super(key: key);

  @override
  State<AtendimentosScreen> createState() => _AtendimentosScreenState();
}

class _AtendimentosScreenState extends State<AtendimentosScreen> {
  // late AtendimentoManager manager;
  List<IterfaceAtendimento>? atendimentos;
  List<IterfaceAtendimento>? listaold;
  AtendimentoService oAPI = AtendimentoService();
  ValueNotifier<bool> listaloand = ValueNotifier<bool>(false);

  TextStyle stylesText = const TextStyle(color: Colors.black, fontWeight: FontWeight.bold);

  @override
  void initState() {
    //Aguarda carregamento
    WidgetsBinding.instance.addPostFrameCallback((timeSpam) async {
      listaloand.value = true;
      atendimentos = await oAPI.browser();
      listaold = atendimentos;
      listaloand.value = false;
      setState(() {});
    });

    super.initState();
  }

  void _runFilter(String enteredKeyword) {
    List<IterfaceAtendimento>? results = [];
    if (enteredKeyword.isEmpty) {
      // if the search field is empty or only contains white-space, we'll display all users
      results = atendimentos;
    } else {
      results = listaold
          ?.where((iten) =>
              iten.COTACAO.toString().toLowerCase().contains(enteredKeyword.toLowerCase()))
          .toList();
      // we use the toLowerCase() method to make it case-insensitive
    }

    // Refresh the UI
    setState(() {
      atendimentos = results;
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Atendimentos'),
        elevation: 10,
      ),
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              padding: const EdgeInsets.all(10),
              child: TextField(
                onChanged: (value) => _runFilter(value),
                decoration:
                    const InputDecoration(labelText: 'Pesquisar', suffixIcon: Icon(Icons.search)),
              ),
            ),
          ),
          Expanded(
            flex: 8,
            child: ValueListenableBuilder(
              valueListenable: listaloand,
              builder: (BuildContext context, value, Widget? child) {
                return !listaloand.value
                    ? ListView.builder(
                        itemCount: atendimentos?.length ?? 0,
                        itemBuilder: (BuildContext context, int index) {
                          IterfaceAtendimento atendimentoItem = atendimentos![index];
                          return Container(
                            padding: const EdgeInsets.all(4),
                            margin: const EdgeInsets.all(6),
                            decoration: BoxDecoration(
                              color: Theme.of(context).colorScheme.secondaryContainer,
                              borderRadius: BorderRadius.circular(25),
                            ),
                            child: ListTile(
                              title: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    'Cod Usr: ${atendimentoItem.CODUSUARIO} Nome: ${atendimentoItem.NOMEUSR}',
                                    style: stylesText,
                                  ),
                                  Text(
                                      '${atendimentoItem.NOME}   Cliente: ${atendimentoItem.CLIENTE} Loja: ${atendimentoItem.LOJA}'),
                                  Text(
                                    'Filial: ${atendimentoItem.FILIAL} Cotação: ${atendimentoItem.COTACAO}',
                                    style: stylesText,
                                  )
                                ],
                              ),
                              subtitle: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    'Cod Usr: ${atendimentoItem.CODUSUARIO} Nome: ${atendimentoItem.NOMEUSR}',
                                    style: stylesText,
                                  ),
                                ],
                              ),
                              onTap: () async {
                                var result = await Navigator.pushNamed(context, '/AtendimentoItem',
                                    arguments: atendimentoItem);

                                if (result != null) {
                                  setState(() {});
                                }
                              },
                            ),
                          );
                        },
                      )
                    : const Center(
                        child: SizedBox(
                          height: 100,
                          width: 200,
                          child: CircularProgressIndicator(),
                        ),
                      );
              },
            ),
          ),
        ],
      ),
    );
  }
}
