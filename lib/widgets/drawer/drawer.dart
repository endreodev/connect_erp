import 'package:flutter/material.dart';
import '../../globais/global.dart';

class NavigationDrawerWidget extends StatefulWidget {
  const NavigationDrawerWidget({Key? key}) : super(key: key);

  @override
  State<NavigationDrawerWidget> createState() => _NavigationDrawerWidgetState();
}

class _NavigationDrawerWidgetState extends State<NavigationDrawerWidget> {
  final padding = const EdgeInsets.symmetric(horizontal: 20);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(children: [
        UserAccountsDrawerHeader(
          currentAccountPicture: Container(
            padding: const EdgeInsets.all(10),
            //margin: EdgeInsets.all(0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(50),
            ),
            child: Image.asset(
              'assets/images/user1.jpg',
            ),
          ),
          accountEmail: Text('mario@example.com'),
          accountName: Text(
            'Conecta ERP',
            style: TextStyle(fontSize: 24.0),
          ),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.secondary,
          ),
        ),
        Expanded(
          flex: 4,
          child: Column(
            children: [
              buildMenuItem(
                  icon: Icons.add_task_rounded, title: 'Atendimentos.', nameRouter: '/Atendimento'),
              // buildMenuItem(icon: Icons.calculate, title: 'Simulacao', nameRouter: '/Simulacao'),
              // buildMenuItem(icon: Icons.abc_outlined, title: 'Sol. Armazem', nameRouter: '/login'),
            ],
          ),
        ),
        Expanded(
          flex: 1,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              buildMenuItem(
                  icon: Icons.door_back_door_outlined, title: 'Logof', nameRouter: '/login'),
              const SizedBox(
                height: 10,
              )
            ],
          ),
        )
      ]),
    );
  }

  //função sair
  logoff() async {
    isLoggedIn = false;
    Navigator.pushReplacementNamed(context, '/login');
  }

  void selectedItem(BuildContext context, String index) {
    if (index == '/login') {
      logoff();
    } else {
      Navigator.of(context).pop();
      Navigator.of(context).pushNamed(index);
    }
  }

  Widget buildMenuItem({
    required IconData icon,
    required String title,
    required String nameRouter,
    VoidCallback? onClicked,
  }) {
    return Padding(
      padding: const EdgeInsets.all(7),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
                onPrimary: Theme.of(context).colorScheme.onPrimary,
                primary:
                    Theme.of(context).colorScheme.outline //Theme.of(context).colorScheme.secondary,
                )
            .copyWith(
          elevation: ButtonStyleButton.allOrNull(8),
        ),
        onPressed: () {},
        child: ListTile(
          leading: Icon(icon, size: 35),
          title: Text(title),
          //subtitle: Text(subtitle),
          trailing: const Icon(Icons.arrow_right),
          onTap: () => selectedItem(context, nameRouter),
        ),
      ),
    );
  }
}
