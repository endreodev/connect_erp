import 'package:connect_erp/bloc/bloc_atendimento/class/interface_atendimento.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../classess/functions/snackbar.dart';
import '../../service_ws/servicews.dart';

class AtendimentoItemService {
  static Future<List<IterfaceAtendimento>> browser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString("token") ?? '';
    List<IterfaceAtendimento> atendimentoslista = <IterfaceAtendimento>[];
    Dio oFWRest = ServiceWsAPI.instance.oApi;
    oFWRest.options.headers.addAll({'Authorization': 'Bearer $token'});
    try {
      Response response = await oFWRest.get('/APILiberacao/LiberaAtendimento');

      if (response.data != null) {
        atendimentoslista.add(IterfaceAtendimento.fromJson(response.data));
      }

      return atendimentoslista;
    } on DioError catch (e) {
      // The request was made and the server responded with a status code
      // that falls out of the range of 2xx and is also not 304.

      if (e.response != null) {
        print(e.response!.data);
        print(e.response!.headers);
        print(e.response!.requestOptions);
      } else {
        print(e.requestOptions);
        print(e.message);

        if (e.message.contains('Connection failed')) {
          SnackMenssageWarning('Falha na conexão com servidor.');
        } else {
          SnackMenssageWarning(e.message);
        }
      }

      return atendimentoslista;
    }
  }
}
