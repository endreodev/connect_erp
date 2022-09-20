import 'package:connect_erp/bloc/classes_generic/class_valid_form.dart';
import 'package:flutter/material.dart';
import '../service/login_service.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController pswController = TextEditingController();
  ValueNotifier<bool> loand = ValueNotifier<bool>(false);
  LoginService ologin = LoginService();
  ClassValidForm oValform = ClassValidForm();
  String fullName = '';

  Future<void> postLoginUser(BuildContext ctx) async {
    loand.value = true;

    final lret = await ologin.postLogin(nameController.text, pswController.text);

    if (lret) {
      Navigator.of(context).pushReplacementNamed('/home');
    }

    loand.value = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: const Icon(
        Icons.settings,
        size: 18,
      )),
      body: SingleChildScrollView(
        child: Center(
          child: Form(
            key: oValform.formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 80,
                ),
                Container(
                  height: 180,
                  width: 380,
                  padding: const EdgeInsets.all(8),
                  margin: const EdgeInsets.all(5),
                  child: Image.asset('assets/images/logo.jpg'),
                ),
                Container(
                  height: 100,
                  width: 380,
                  padding: const EdgeInsets.all(8),
                  margin: const EdgeInsets.all(5),
                  child: TextFormField(
                    controller: nameController,
                    onChanged: (String value) {},
                    validator: oValform.validateUsuario,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(50)),
                      ),
                      labelText: 'Usuario',
                    ),
                  ),
                ),
                Container(
                  height: 100,
                  width: 380,
                  padding: const EdgeInsets.all(8),
                  margin: const EdgeInsets.all(5),
                  child: TextFormField(
                    controller: pswController,
                    obscureText: true,
                    enableSuggestions: false,
                    autocorrect: false,
                    onChanged: (String value) {},
                    validator: oValform.validateSenha,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(50)),
                      ),
                      labelText: 'Senha',
                    ),
                  ),
                ),
                ValueListenableBuilder(
                  valueListenable: loand,
                  builder: (BuildContext context, value, Widget? child) {
                    return !loand.value
                        ? ElevatedButton(
                            onPressed: () {
                              if (oValform.onValideForm(context)) {
                                postLoginUser(context);
                              } else {
                                //mostra popapi
                                oValform.fwalert(context, 'Preencha todos os campos!', Colors.red);
                              }
                            },
                            child: Container(
                              height: 60,
                              width: 330,
                              margin: const EdgeInsets.all(5),
                              alignment: Alignment.center,
                              child: const Text(
                                'Acessar',
                                style: TextStyle(fontSize: 24),
                              ),
                            ),
                          )
                        : const CircularProgressIndicator();
                  },
                ),
              ],
            ),
          ),
        ),

        // : Scaffold(
        //     body: LoandScreen(),
        //   );
      ),
    );
  }
}
