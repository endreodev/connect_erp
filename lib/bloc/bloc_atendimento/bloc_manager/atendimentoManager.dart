import 'dart:async';

import 'package:connect_erp/bloc/bloc_atendimento/class/interface_atendimento.dart';
import 'package:connect_erp/bloc/bloc_atendimento/service/atendimento_service.dart';

class AtendimentoManager {
  final StreamController<int> atendimentosControllerCount = StreamController<int>();

//   Stream<int> get atendimentosCount => atendimentosControllerCount.stream;

//   Stream<List<IterfaceAtendimento>> get atendimentosListView async* {
//     yield await AtendimentoService.browser();
//   }

//   AtendimentoManager() {
//     atendimentosListView.listen((list) => atendimentosControllerCount.add(list.length));
//   }
}
