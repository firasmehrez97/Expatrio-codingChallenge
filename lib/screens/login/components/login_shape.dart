import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import 'login_form.dart';

class LoginShape extends StatelessWidget {
  const LoginShape({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: [
            Positioned(
              bottom: 0,
              child: Container(
                width: MediaQuery.of(context).size.width,
                alignment: Alignment.bottomCenter,
                child: Lottie.asset("assets/login-background.json", width: 350),
              ),
            ),
            Positioned.fill(
                child: Container(color: Colors.white.withOpacity(0.8))),
            const Positioned.fill(child: LoginForm()),
          ],
        ),
      ),
    );
  }
}
