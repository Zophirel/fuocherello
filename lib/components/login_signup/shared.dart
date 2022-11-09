import 'package:flutter/material.dart';

Widget emailField() {
  return const TextField(
    decoration: InputDecoration(
      floatingLabelBehavior: FloatingLabelBehavior.auto,
      labelText: 'E-mail',
      border: OutlineInputBorder(),
    ),
  );
}

Widget passField() {
  return const TextField(
    obscureText: true,
    decoration: InputDecoration(
      floatingLabelBehavior: FloatingLabelBehavior.auto,
      labelText: 'Password',
      border: OutlineInputBorder(),
    ),
  );
}
