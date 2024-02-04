import 'package:coding_challenge/screens/tax/models/tax_country.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('TaxModel', () {
    test('fromJson and toJson', () {
      // Example JSON structure based on the TaxModel and TaxResidence
      final exampleJson = {
        'primaryTaxResidence': {'country': 'CountryA', 'id': '1'},
        'usPerson': false,
        'usTaxId': null,
        'secondaryTaxResidence': [
          {'country': 'CountryB', 'id': '2'},
        ],
        'w9FileId': null,
      };

      // Create an instance of TaxModel from JSON.
      final taxModel = TaxModel.fromJson(exampleJson);

      // Verify the deserialization works correctly.
      expect(taxModel.primaryTaxResidence?.country, 'CountryA');
      expect(taxModel.usPerson, false);
      expect(taxModel.secondaryTaxResidence?.first.country, 'CountryB');

      // Convert the TaxModel instance back to JSON.
      final json = taxModel.toJson();

      // Verify the serialization works correctly.
      expect(json['primaryTaxResidence']['country'], 'CountryA');
      expect(json['usPerson'], false);
      expect(json['secondaryTaxResidence'][0]['country'], 'CountryB');
    });
  });

  group('TaxResidence', () {
    test('fromJson and toJson', () {
      // Example JSON for TaxResidence
      final exampleJson = {
        'country': 'CountryA',
        'id': '1',
      };

      // Create an instance of TaxResidence from JSON.
      final taxResidence = TaxResidence.fromJson(exampleJson);

      // Verify the deserialization works correctly.
      expect(taxResidence.country, 'CountryA');
      expect(taxResidence.id, '1');

      // Convert the TaxResidence instance back to JSON.
      final json = taxResidence.toJson();

      // Verify the serialization works correctly.
      expect(json['country'], 'CountryA');
      expect(json['id'], '1');
    });
  });
}
