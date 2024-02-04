import 'dart:convert';
import 'dart:io';
import 'package:coding_challenge/shared/utils/extensions/theme_data_extension.dart';
import 'package:coding_challenge/shared/widgets/bottom_modal.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:coding_challenge/screens/tax/model/tax_country.dart';
import 'package:flutter/foundation.dart';

class TaxService {
  static const String _baseUrl = 'https://dev-api.expatrio.com';
  static const storage = FlutterSecureStorage();

  static Future<TaxModel?> getTaxData() async {
    try {
      var clientId = await storage.read(key: "userId");
      String? accessToken = await storage.read(key: "accessToken");
      final response = await http.get(
        Uri.parse("$_baseUrl/v3/customers/$clientId/tax-data"),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': accessToken!,
        },
      );
      if (response.statusCode == 200) {
        return TaxModel.fromJson(json.decode(response.body));
      } else {
        return null;
      }
    } on Exception catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
    return null;
  }

  static Future<void> updateData(
      TaxModel taxModel, BuildContext context) async {
    var clientId = await storage.read(key: "userId");
    String? accessToken = await storage.read(key: "accessToken");
    try {
      final response = await http.put(
        Uri.parse("$_baseUrl/v3/customers/$clientId/tax-data"),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': accessToken.toString(),
        },
        body: jsonEncode(taxModel),
      );

      if (response.statusCode == 200) {
        if (!context.mounted) return;
        _showSuccessfulBottomSheet(context);
      } else {
        if (context.mounted) {
          _showErrorBottomSheet(context, response.body);
        }
      }
    } on SocketException {}
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
              'Tax data updated successfully',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
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
                  Navigator.pop(context);
                  Navigator.pop(context);
                },
                child: Container(
                  height: 24,
                  width: 250,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Theme.of(context).colors.primary,
                    borderRadius: const BorderRadius.all(Radius.circular(100)),
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
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
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
                    borderRadius: const BorderRadius.all(Radius.circular(100)),
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
