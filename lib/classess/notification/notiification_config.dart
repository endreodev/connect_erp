import 'dart:io';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../functions/showdialog.dart';

class ConfigureNotification {
  ConfigureNotification();

  inicializeNotification() async {
    //Realiza a inicializacao do Firebase
    await Firebase.initializeApp();

    //Recupera a instanvia do Messaging
    FirebaseMessaging messaging = FirebaseMessaging.instance;

    //Solicita Permissoes para o usuario
    NotificationSettings settings = await messaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );

    //imprime as permissões
    debugPrint('User granted permission: ${settings.authorizationStatus}');

    //Verifica as permissões
    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      debugPrint('usuario permitiu ${settings.authorizationStatus}');
      _startnotfication(messaging);
    } else if (settings.authorizationStatus == AuthorizationStatus.provisional) {
      debugPrint('usuario permitiu ${settings.authorizationStatus}');
      _startnotfication(messaging);
    } else {
      //
      debugPrint('usuario não permitiu ${settings.authorizationStatus}');
    }
  }

  //Metodo de captura do tokem
  void _startnotfication(FirebaseMessaging messaging) async {
    //Pega o Token do dispositivo e evia a chave da WEb
    String? tokenNotifier = await messaging.getToken(
          vapidKey:
              'BD98KFHlx6KCr79Xnvz4I_jNAFTvIMMGMb4FBLTHL3GFZ4pJY-uo7ANYjfSGvL5zi8huCfhd5u78m3HAt2h0utU',
        ) ??
        '';

    if (tokenNotifier != '') {
      await postDevicetoken(tokenNotifier);
    }

    //em primeiro plano
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      debugPrint('recebi mensagem com app aberto ');
      debugPrint('dados ${message.data}');

      if (message.data.isNotEmpty) {
        message.data['router'];
        message.data['id'];
      }

      //Verifica se tem notificação ou somente dados
      if (message.notification != null) {
        showMyDialog(message);

        debugPrint('A mensagem contem notificação: ${message.notification!.title}');
        debugPrint('A mensagem contem notificação: ${message.notification!.body}');
      }
    });

    //Em segundo plano
    FirebaseMessaging.onBackgroundMessage(_firebaseMessaginBackground);

    //Terminate
    var notification = await FirebaseMessaging.instance.getInitialMessage();
    if (notification != null) {
      showMyDialog(notification);
    }
  }
}

Future<void> _firebaseMessaginBackground(RemoteMessage message) async {
  debugPrint('Handling a background message ${message.messageId}');
  debugPrint('mensagem em background ${message.data}');
  debugPrint('mensagem em background ${message.notification!.title}');
  //Caso queira implementar algo em bacground
}

//Realiza o envio do tokem para a api que sera controlado os dispositivos
Future<void> postDevicetoken(String cToken) async {
  //Abre instancia de preferencia
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String? prefsToken = prefs.getString('prefsToken') ?? '';
  bool? sendToken = prefs.getBool('sendToken') ?? false;
  DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();

  debugPrint(cToken);

  if (prefsToken != cToken || (prefsToken == cToken && sendToken == false)) {
    if (Platform.isAndroid) {
      AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
      debugPrint('Running on ${androidInfo.model}'); // e.g. "Moto G (4)"
    }

    if (Platform.isIOS) {
      IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
      debugPrint('Running on ${iosInfo.utsname.machine}'); // e.g. "iPod7,1"
    }

    if (kIsWeb) {
      WebBrowserInfo webBrowserInfo = await deviceInfo.webBrowserInfo;
      debugPrint('Running on ${webBrowserInfo.userAgent}');
    }

    //Enviar aqui os dados da plataforma
    //Function enviar
  }
}
