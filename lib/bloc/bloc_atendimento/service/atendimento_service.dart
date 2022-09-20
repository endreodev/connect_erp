import 'package:connect_erp/bloc/bloc_atendimento/class/interface_atendimento_liberacao.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../classess/functions/snackbar.dart';
import '../../../globais/global.dart';
import '../../service_ws/servicews.dart';
import '../class/interface_atendimento.dart';

class AtendimentoService {
  Future<List<IterfaceAtendimento>> browser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString("token") ?? '';

    List<IterfaceAtendimento> atendimentoslista = <IterfaceAtendimento>[];
    Dio oFWRest = ServiceWsAPI.instance.oApi;

    oFWRest.options.headers.addAll({'Authorization': 'Bearer $token'});

    try {
      Response response = await oFWRest.get(patchAtendimento);

      if (response.data['DATA'] != null) {
        response.data['DATA'].forEach((v) {
          atendimentoslista.add(IterfaceAtendimento.fromJson(v));
        });
      }

      return atendimentoslista;
    } on DioError catch (e) {
      if (e.response != null) {
        print(e.response!.data);
        print(e.response!.headers);
        print(e.response!.requestOptions);
      } else {
        // Something happened in setting up or sending the request that triggered an Error
        print(e.requestOptions);
        print(e.message);
      }

      SnackMenssageWarning(e.message);

      return atendimentoslista;
    }
  }

  Future postLiberacao(int cRecno, int index) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString("token") ?? '';
    Dio oFWRest = ServiceWsAPI.instance.oApi;

    oFWRest.options.headers.addAll({'Authorization': 'Bearer $token'});
    List<InterfaceAtendimentoLiberacao> lliberacao = <InterfaceAtendimentoLiberacao>[];
    String cLibera = '/rest/APILiberacao/LiberaAtendimento';
    String cRecusa = '/rest/APILiberacao/RecusaAtendimento';
    String cPatch = '';

    try {
      Map body = {"RECNO": cRecno};

      index == 1 ? cPatch = cLibera : cPatch = cRecusa;

      Response response = await oFWRest.post(cPatch, data: body);

      lliberacao.add(InterfaceAtendimentoLiberacao.fromJson(response.data));
      SnackMenssageSuccess(lliberacao[0].MENSAGEM.toString());
      await Future.delayed(const Duration(seconds: 3));

      return true;
    } on DioError catch (e) {
      SnackMenssageWarning(e.message);

      return false;
    }
  }
}
