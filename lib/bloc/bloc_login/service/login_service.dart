import 'package:connect_erp/bloc/bloc_login/service/logintoken_service.dart';
import 'package:connect_erp/bloc/service_ws/servicews.dart';
import 'package:dio/dio.dart';
import '../../../classess/functions/snackbar.dart';
import '../../../globais/global.dart';
import '../repository/repository_login.dart';

class LoginService {
  Future postLogin(String name, String psw) async {
    //Retorna instacia de appi
    Dio oFWRest = ServiceWsAPI.instance.oApi;
    InterfaceLogin oLoginRest = InterfaceLogin();

    try {
      Response response = await oFWRest.post(
        patchToken,
        data: {},
        queryParameters: {'grant_type': 'password', 'password': psw, 'username': name},
      );

      oLoginRest = InterfaceLogin.fromJson(response.data);
      LoginToken().Save(oLoginRest);

      isLoggedIn = true;
      return true;
    } on DioError catch (e) {
      if (e.response != null) {
        if (e.response!.statusCode! >= 400 || e.response!.statusCode! <= 499) {
          oLoginRest = InterfaceLogin.fromJson(e.response!.data);
          SnackMenssageWarning(oLoginRest.message.toString());
        }

        return false;
      } else {
        if (e.message.contains('Connection failed')) {
          SnackMenssageWarning('Falha na conexão com servidor.');
        } else {
          SnackMenssageWarning(e.message);
        }
      }
      return false;
    }
  }
}
