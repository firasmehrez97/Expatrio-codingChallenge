import 'package:coding_challenge/shared/utils/extensions/theme_data_extension.dart';
import 'package:coding_challenge/shared/validators/validators.dart';
import 'package:flutter/material.dart';

import '../../../shared/widgets/bottom_modal.dart';
import '../../tax/tax_screen.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
/*   final _formKey = GlobalKey<FormState>();
  String _email = '';
  String _password = '';
  bool _loading = false; */

  @override
  Widget build(BuildContext context) {
    InputDecoration inputDecoration = const InputDecoration(
      contentPadding: EdgeInsets.symmetric(vertical: 4, horizontal: 12),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.black),
        borderRadius: BorderRadius.all(Radius.circular(8)),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(8)),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.black),
        borderRadius: BorderRadius.all(Radius.circular(8)),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.black),
        borderRadius: BorderRadius.all(Radius.circular(8)),
      ),
    );

    return Padding(
      padding: const EdgeInsets.all(48),
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
            decoration: inputDecoration,
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
            validator: Validators.validatePassword,
            textAlignVertical: TextAlignVertical.center,
            style: const TextStyle(fontSize: 16),
            textInputAction: TextInputAction.done,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            decoration: inputDecoration,
            // obscureText: !authState.passwordVisible,

            onChanged: (value) {},
          ),
          const SizedBox(height: 16),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Theme.of(context).colors.primary,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
              ),
              onPressed: () {
                _showSuccessful();
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
    );
  }

  void _showSuccessful() {
    ButtomModal(
        context: context,
        heightFactor: 0.4,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(
                Icons.check_circle,
                color: Theme.of(context).colors.primary,
                size: 80,
              ),
              const SizedBox(height: 16),
              const Text(
                'Successful login',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              const Text('You will be redirected to your dashboard'),
              const SizedBox(height: 16),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).colors.primary,
                  ),
                  onPressed: () async {
                    Navigator.pop(context);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const TaxScreen()),
                    );
                  },
                  child: Container(
                    height: 24,
                    width: 250,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Theme.of(context).colors.primary,
                      borderRadius:
                          const BorderRadius.all(Radius.circular(100)),
                    ),
                    child: const Text(
                      'Got it ',
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  )),
            ],
          ),
        ));
  }
}
