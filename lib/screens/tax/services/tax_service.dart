import 'dart:convert';
import 'dart:io';
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
    TaxModel taxModel,
  ) async {
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
      } else {}
    } on SocketException {}
  }
}
