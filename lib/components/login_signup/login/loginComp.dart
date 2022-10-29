import 'package:flutter/material.dart';
import '../../../colorscheme/color_schemes.g.dart';
import 'package:go_router/go_router.dart';
import '../shared.dart';

loginMobileCtn(GlobalKey<FormState> loginKey, BuildContext ctx) {
  return Container(
    decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(5)),
        color: Theme.of(ctx).colorScheme.surfaceVariant),
    padding: const EdgeInsets.all(30),
    width: 300,
    height: 440,
    child: loginForm(loginKey, ctx),
  );
}

Widget loginForm(GlobalKey<FormState> loginKey, BuildContext ctx) {
  return Form(
    key: loginKey,
    child: Column(
      children: [
        loginHeader(),
        const SizedBox(height: 20),
        emailField(),
        const SizedBox(height: 20),
        passField(),
        const SizedBox(height: 20),
        loginBtn(loginKey, ctx),
        const SizedBox(height: 20),
        gotoForgotPass(ctx),
        const SizedBox(height: 20),
        gotoSignUp(ctx),
      ],
    ),
  );
}

Widget loginHeader() {
  return Text(
    'Benvenuto',
    style: TextStyle(fontSize: 40, color: lightColorScheme.onSurfaceVariant),
  );
}

Widget loginBtn(GlobalKey<FormState> loginKey, BuildContext ctx) {
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
      'Accedi',
      style: TextStyle(color: lightColorScheme.onPrimary),
    ),
  );
}

Widget gotoForgotPass(BuildContext ctx) {
  return InkWell(
    child: Text(
      'Hai dimenticato la password?',
      style: TextStyle(color: Theme.of(ctx).colorScheme.onSurfaceVariant),
    ),
    onTap: () => ctx.go('/'),
  );
}

Widget gotoSignUp(BuildContext ctx) {
  return InkWell(
    child: Text(
      'Sei un nuovo utente?',
      style: TextStyle(color: Theme.of(ctx).colorScheme.onSurfaceVariant),
    ),
    onTap: () => ctx.go('/signup'),
  );
}
