import 'package:flutter/material.dart';
import '../class/interface_atendimento.dart';
import '../service/atendimento_service.dart';

class AtendimentoItemScreen extends StatefulWidget {
  final IterfaceAtendimento? itenAtendimento;

  const AtendimentoItemScreen({Key? key, this.itenAtendimento}) : super(key: key);

  @override
  State<AtendimentoItemScreen> createState() => _AtendimentoItemScreenState();
}

class _AtendimentoItemScreenState extends State<AtendimentoItemScreen> {
  int selectedIndex = 1;
  bool isloand = false;
  AtendimentoService oAtendimento = AtendimentoService();
  ValueNotifier<bool> loand = ValueNotifier<bool>(false);

  inputLine(double wid, double hei, String campo, String conteudo) {
    return Center(
      child: Container(
        width: (400 / 100) * wid,
        height: (70 / 100) * hei,
        padding: const EdgeInsets.all(1),
        margin: const EdgeInsets.all(2),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(8)),
          color: Theme.of(context).colorScheme.secondaryContainer,
        ),
        child: ListTile(
          title: Text(campo),
          subtitle: Text(conteudo),
        ),
      ),
    );
  }

  Future<void> postLiberacaoAtendimento(recno, index) async {
    loand.value = true;
    final lret = await oAtendimento.postLiberacao(recno, index);

    if (lret) {
      Navigator.pop(context, lret);
    }

    if (!lret) {
      loand.value = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: loand,
      builder: (BuildContext context, value, Widget? child) {
        if (loand.value) {
          return Scaffold(
            body: Container(
              color: Colors.white,
              child: Center(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: const [CircularProgressIndicator(), Text('Aguarde..')]),
              ),
            ),
          );
        } else {
          return Scaffold(
            appBar: AppBar(
              elevation: 2,
              centerTitle: true,
              title: Text('Cotação ${widget.itenAtendimento!.COTACAO}'),
            ),
            body: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  inputLine(
                      096, 100, 'NUMERO ATENDIMENTO', widget.itenAtendimento!.NUMATEND.toString()),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      inputLine(40, 100, 'Filial', widget.itenAtendimento!.FILIAL.toString()),
                      inputLine(56, 100, 'Filial Atendimento',
                          widget.itenAtendimento!.FILIALATENDIMENTO.toString()),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      inputLine(30, 100, 'Cliente',
                          '${widget.itenAtendimento!.CLIENTE.toString()}  ${widget.itenAtendimento!.LOJA.toString()}'),
                      inputLine(66, 100, 'Nome', widget.itenAtendimento!.NOME.toString()),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      inputLine(40, 100, 'Chassi Interno',
                          widget.itenAtendimento!.CHASSIINTERNO.toString()),
                      inputLine(56, 100, 'Usuario', widget.itenAtendimento!.NOMEUSR.toString()),
                    ],
                  ),
                  inputLine(096, 250, 'Observação', widget.itenAtendimento!.OBS.toString()),
                ],
              ),
            ),
            bottomNavigationBar: Container(
              width: 100,
              child: NavigationBar(
                onDestinationSelected: (int index) async {
                  await postLiberacaoAtendimento(widget.itenAtendimento!.RECNO, index);
                },
                selectedIndex: selectedIndex,
                destinations: <Widget>[
                  Container(
                    width: 100,
                    color: Colors.red,
                    child: const NavigationDestination(
                      icon: Icon(
                        Icons.remove_circle,
                        color: Colors.black,
                      ),
                      label: 'Reprovar',
                    ),
                  ),
                  const NavigationDestination(
                    icon: Icon(Icons.add_task_sharp),
                    label: 'Aprovar',
                  ),
                ],
              ),
            ),
          );
        }
      },
    );
  }
}
