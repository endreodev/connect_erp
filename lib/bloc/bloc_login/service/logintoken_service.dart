import 'package:connect_erp/bloc/bloc_login/repository/repository_login.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginToken {
  LoginToken();

  Future Save(InterfaceLogin oLogin) async {
    final SharedPreferences share = await SharedPreferences.getInstance();

    await share.setString('token', oLogin.access_token.toString());
    await share.setString('refresh', oLogin.refresh_token.toString());
    await share.setInt('expire', oLogin.expires_in!);
  }
}
