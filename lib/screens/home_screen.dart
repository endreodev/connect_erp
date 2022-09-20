import 'package:flutter/material.dart';
import '../bloc/bloc_atendimento/class/interface_atendimento.dart';
import '../widgets/drawer/drawer.dart';

class HomeScreen extends StatefulWidget {
  final IterfaceAtendimento? itenAtendimento;
  const HomeScreen({Key? key, this.itenAtendimento}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeSpam) {
      if (widget.itenAtendimento is IterfaceAtendimento) {
        Navigator.of(context).pushNamed('/AtendimentoItem', arguments: widget.itenAtendimento);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Home'),
        elevation: 10,
      ),
      drawer: const NavigationDrawerWidget(),
    );
  }
}
