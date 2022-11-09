import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../colorscheme/color_schemes.g.dart';
import '../shared.dart';

Widget signUpForm(GlobalKey<FormState> signUpKey, BuildContext ctx) {
  return Form(
    key: signUpKey,
    child: Column(children: [
      signUpHeader(),
      const SizedBox(height: 20),
      signUpNome(),
      const SizedBox(height: 20),
      signUpCognome(),
      const SizedBox(height: 20),
      emailField(),
      const SizedBox(height: 20),
      passField(),
      const SizedBox(height: 20),
      signUpBtn(signUpKey, ctx),
      const SizedBox(height: 20),
      gotoLogin(ctx),
    ]),
  );
}

Widget signUpHeader() {
  return Text(
    'Benvenuto',
    style: TextStyle(fontSize: 40, color: lightColorScheme.onSurfaceVariant),
  );
}

Widget signUpNome() {
  return const TextField(
    decoration: InputDecoration(
      labelText: 'Nome',
      border: OutlineInputBorder(),
      floatingLabelBehavior: FloatingLabelBehavior.auto,
    ),
  );
}

Widget signUpCognome() {
  return const TextField(
    decoration: InputDecoration(
      labelText: 'Cognome',
      border: OutlineInputBorder(),
      floatingLabelBehavior: FloatingLabelBehavior.auto,
    ),
  );
}

Widget signUpBtn(GlobalKey<FormState> loginKey, BuildContext ctx) {
  return ElevatedButton(
    style: ButtonStyle(
        backgroundColor:
            MaterialStatePropertyAll<Color>(Theme.of(ctx).colorScheme.primary),
        minimumSize:
            MaterialStateProperty.all(const Size(double.infinity, 50))),
    onPressed: () {
      ctx.go('/home');
    },
    child: Text(
      'Registrati',
      style: TextStyle(color: lightColorScheme.onPrimary),
    ),
  );
}

Widget gotoLogin(BuildContext ctx) {
  return InkWell(
    child: const Text('Hai gia un account?'),
    onTap: () => GoRouter.of(ctx).go('/'),
  );
}
