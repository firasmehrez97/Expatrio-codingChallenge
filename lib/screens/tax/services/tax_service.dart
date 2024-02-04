import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:coding_challenge/screens/tax/model/tax_country.dart';
import 'package:flutter/foundation.dart';

class TaxService {
  static const String _baseUrl = 'https://dev-api.expatrio.com';

  static Future<TaxModel?> getTaxData() async {
    const storage = FlutterSecureStorage();
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

  // Save tax data to the server
/*   static Future<void> handleSaving(
    int customerId,
    String accessToken,
    List<TaxResidence> taxResidences,
  ) async {
    try {
      int id = customerId;

      List<Map<String, dynamic>> secondaryTaxResidences = [];
      for (int i = 1; i < taxResidences.length; i++) {
        secondaryTaxResidences.add({
          "country": taxResidences[i].country,
          "id": taxResidences[i].id,
        });
      }

      var bodyContent = {
        "primaryTaxResidence": {
          "country": taxResidences.isNotEmpty ? taxResidences[0].country : "",
          "id": taxResidences.isNotEmpty ? taxResidences[0].id : "",
        },
        "usPerson": false,
        "usTaxId": null,
        "secondaryTaxResidence": secondaryTaxResidences,
        "w9FileId": null,
      };

      // Make a PUT request to save tax data
      final response = await http.put(
        Uri.parse("$_baseUrl/v3/customers/$id/tax-data"),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': accessToken,
        },
        body: jsonEncode(bodyContent),
      );

      if (response.statusCode == 200) {
        // Save tax data locally after successful server save
        await saveTaxDataLocally(
          {
            "primaryTaxResidence": {
              "country":
                  taxResidences.isNotEmpty ? taxResidences[0].country : "",
              "id": taxResidences.isNotEmpty ? taxResidences[0].id : "",
            },
            "secondaryTaxResidence": secondaryTaxResidences,
          },
          customerId,
        );
      } else {
        // Handle other status codes
      }
    } on SocketException {
      // Handle SocketException
    }
  } */

  // Save tax data locally using Flutter Secure Storage
  static Future<void> saveTaxDataLocally(
    Map<String, dynamic> taxData,
    customerId,
  ) async {
    const storage = FlutterSecureStorage();
    await storage.write(
      key: "user_${customerId}_tax_data",
      value: jsonEncode(taxData),
    );
  }
}
