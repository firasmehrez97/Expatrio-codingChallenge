import 'package:coding_challenge/screens/login/services/login_service.dart';
import 'package:coding_challenge/shared/decorations/input_decoration.dart';
import 'package:coding_challenge/shared/utils/extensions/theme_data_extension.dart';
import 'package:coding_challenge/shared/validators/validators.dart';
import 'package:flutter/material.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final LoginService _loginService = LoginService();
  late bool _isPasswordVisible;

  final TextEditingController _emailController =
      TextEditingController(text: 'tito+bs792@expatrio.com');
  final TextEditingController _passwordController =
      TextEditingController(text: 'nemampojma');

  @override
  void initState() {
    _isPasswordVisible = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();

    InputDecoration passwordInputDecoration = InputDecoration(
      contentPadding: const EdgeInsets.symmetric(vertical: 4, horizontal: 12),
      focusedBorder: const OutlineInputBorder(
        borderSide: BorderSide(color: Colors.black),
        borderRadius: BorderRadius.all(Radius.circular(8)),
      ),
      enabledBorder: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(8)),
      ),
      errorBorder: const OutlineInputBorder(
        borderSide: BorderSide(color: Colors.black),
        borderRadius: BorderRadius.all(Radius.circular(8)),
      ),
      focusedErrorBorder: const OutlineInputBorder(
        borderSide: BorderSide(color: Colors.black),
        borderRadius: BorderRadius.all(Radius.circular(8)),
      ),
      suffixIcon: IconButton(
        icon: Icon(
          _isPasswordVisible ? Icons.visibility_off : Icons.visibility,
          color: Theme.of(context).colors.primary,
        ),
        onPressed: () {
          setState(() {
            _isPasswordVisible = !_isPasswordVisible;
          });
        },
      ),
    );

    return Padding(
      padding: const EdgeInsets.all(48),
      child: Form(
        key: formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 60),
            SizedBox(
              width: 250,
              child: Image.asset("assets/2019_XP_logo_white.png"),
            ),
            const SizedBox(height: 36),
            const Row(
              children: [
                Icon(Icons.email_outlined),
                SizedBox(width: 4),
                Text(
                  "EMAIL ADDRESS",
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            TextFormField(
              keyboardType: TextInputType.emailAddress,
              validator: Validators.validateEmail,
              textAlignVertical: TextAlignVertical.center,
              style: const TextStyle(fontSize: 16),
              textInputAction: TextInputAction.done,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              decoration: emailInputDecoration,
              controller: _emailController,
              onChanged: (value) {},
            ),
            const SizedBox(height: 32),
            const Row(
              children: [
                Icon(Icons.lock_outlined),
                SizedBox(width: 4),
                Text(
                  "Password",
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            TextFormField(
              keyboardType: TextInputType.visiblePassword,
              obscureText: !_isPasswordVisible,
              validator: Validators.validatePassword,
              textAlignVertical: TextAlignVertical.center,
              style: const TextStyle(fontSize: 16),
              controller: _passwordController,
              textInputAction: TextInputAction.done,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              decoration: passwordInputDecoration,
              onChanged: (value) {},
            ),
            const SizedBox(height: 16),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).colors.primary,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                ),
                onPressed: () async {
                  if (formKey.currentState!.validate()) {
                    await _loginService.login(_emailController.text,
                        _passwordController.text, context);
                  }
                },
                child: Container(
                  height: 32,
                  width: MediaQuery.of(context).size.width,
                  alignment: Alignment.center,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(500)),
                  ),
                  child: const Text("Login", style: TextStyle(fontSize: 18)),
                )),
          ],
        ),
      ),
    );
  }
}
