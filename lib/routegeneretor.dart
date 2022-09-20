import 'package:connect_erp/screens/home_screen.dart';
import 'package:connect_erp/bloc/bloc_login/screen/login_screen.dart';
import 'package:flutter/material.dart';
import 'bloc/bloc_atendimento/class/interface_atendimento.dart';
import 'bloc/bloc_simulacao/screens/simulacao_screens.dart';
import 'globais/global.dart';
import 'bloc/bloc_atendimento/screens/atendimentoitem_screen.dart';
import 'bloc/bloc_atendimento/screens/atendimentos_screen.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    print(isLoggedIn);

    if (!isLoggedIn) {
      return MaterialPageRoute(builder: (_) => const LoginScreen());
    }

    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case '/home':
        if (args is IterfaceAtendimento) {
          return MaterialPageRoute(builder: (_) => HomeScreen(itenAtendimento: args));
        } else {
          return MaterialPageRoute(builder: (_) => const HomeScreen());
        }
      case '/Atendimento':
        return MaterialPageRoute(builder: (_) => const AtendimentosScreen());
      case '/AtendimentoItem':
        if (args is IterfaceAtendimento) {
          return MaterialPageRoute(builder: (_) => AtendimentoItemScreen(itenAtendimento: args));
        }
        return _errorRoute();
      case '/Simulacao':
        return MaterialPageRoute(builder: (_) => const SimulacaoScreen());
      //case '/clienteNome':
      //  if (args is Map) {
      //    return MaterialPageRoute(builder: (_) => const MyClienteName());
      //  }
      //  return _errorRoute();
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Pagina não encontrada'),
        ),
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text('404 - PAGINAL ENCONTRADA'),
            Text('Verifique com o suporte.'),
            Text('endreo.cba@gmail.com'),
            Text('(65) 9 8171-9837'),
          ],
        )),
      );
    });
  }
}
