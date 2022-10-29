import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'components/login_signup/login/loginComp.dart';
import 'components/login_signup/shared.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter Demo',
      home: LoginPage(title: 'Flutter Demo Home Page'),
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> loginKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.onInverseSurface,
      body: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
        if (constraints.maxWidth < 319) {}
        if (320 < constraints.maxWidth && constraints.maxWidth < 480) {
          return Center(
            child: loginMobileCtn(loginKey, context),
          );
        } else if (481 < constraints.maxWidth && constraints.maxWidth < 768) {
          return Center(
            child: loginMobileCtn(loginKey, context),
          );
        } else if (769 < constraints.maxWidth && constraints.maxWidth < 1024) {
          return const Text("laptop");
        } else if (1025 < constraints.maxWidth && constraints.maxWidth < 1200) {
          return const Text("desktop");
        } else if (constraints.maxWidth > 1201) {
          return const Text("bigger screen");
        } else {
          return const Text("mobile");
        }
      }),
    );
  }
}
