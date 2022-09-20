import 'package:dio/dio.dart';
import '../../../globais/global.dart';

class ServiceWsAPI {
  //

  static final String _url = urlBases;

  static final Map<String, String> _mapHeaders = {
    'Content-Type': 'application/json; charset=UTF-8',
    'Access-Control-Allow-Methods': '*',
    'Access-Control-Allow-Origin': '*',
    'Access-Control-Allow-Headers': '*',
    // 'Authorization': 'Bearer' +
  };

  static final BaseOptions _options = BaseOptions(
    baseUrl: _url,
    connectTimeout: 25000,
    receiveTimeout: 25000,
    headers: _mapHeaders,
  );

  Dio oApi = Dio(_options);

  //instancia da classe
  static ServiceWsAPI? _servinstance;

  ServiceWsAPI._();

  static get instance {
    _servinstance ??= ServiceWsAPI._();
    return _servinstance;
  }
}
