import 'dart:io';
import 'package:coding_challenge/screens/tax/tax_screen.dart';
import 'package:coding_challenge/shared/utils/extensions/theme_data_extension.dart';
import 'package:coding_challenge/shared/widgets/bottom_modal.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class LoginService {
  static const String baseUrl = 'https://dev-api.expatrio.com';

  Future<bool> login(
      String email, String password, BuildContext context) async {
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text(
      "Trying to login...",
    )));

    try {
      final requestBodydata = {"email": email, "password": password};

      final requestResponse = await http.post(
        Uri.parse("$baseUrl/auth/login"),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(requestBodydata),
      );

      final requestResponseBody = json.decode(requestResponse.body);

      if (requestResponse.statusCode == 200) {
        if (context.mounted) {
          ScaffoldMessenger.of(context).removeCurrentSnackBar();
          _showSuccessfulBottomSheet(context);
        }
        return true;
      } else {
        if (context.mounted) {
          ScaffoldMessenger.of(context).removeCurrentSnackBar();
          _showErrorBottomSheet(context, requestResponseBody['message']);
        }
        return false;
      }
    } on SocketException catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).removeCurrentSnackBar();
        _showErrorBottomSheet(context,
            "Unable to communicate with the server. Check your internet connection and retry! Error: $e");
      }
      return false;
    }
  }

  void _showSuccessfulBottomSheet(BuildContext context) {
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

  void _showErrorBottomSheet(BuildContext context, String errorMessage) {
    ButtomModal(
        context: context,
        heightFactor: 0.4,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Icon(
                Icons.error_outline,
                color: Colors.red,
                size: 80,
              ),
              const SizedBox(height: 16),
              const Text(
                'Login failure',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              Text(errorMessage),
              const SizedBox(height: 16),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).colors.primary,
                  ),
                  onPressed: () async {
                    Navigator.pop(context);
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
                      'OK',
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  )),
            ],
          ),
        ));
  }
}
