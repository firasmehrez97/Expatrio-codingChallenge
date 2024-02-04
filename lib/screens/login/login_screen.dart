import 'package:coding_challenge/screens/login/components/login_shape.dart';
import 'package:flutter/material.dart';
import 'components/login_help_button.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: LoginShape(),
      floatingActionButton:
          Padding(padding: EdgeInsets.all(16.0), child: LoginHelpButton()),
    );
  }
}
