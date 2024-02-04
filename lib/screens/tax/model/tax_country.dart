class CountryTaxID {
  String country;
  String taxId;

  CountryTaxID({this.country = '', this.taxId = ''});

  @override
  String toString() {
    return 'CountryTaxID{country name: $country, tax ID : $taxId}';
  }
}
