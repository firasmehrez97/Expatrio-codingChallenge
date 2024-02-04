// ignore: depend_on_referenced_packages
import 'package:json_annotation/json_annotation.dart';
part 'tax_country.g.dart';

@JsonSerializable()
class TaxModel {
  @JsonKey(name: 'primaryTaxResidence')
  TaxResidence? primaryTaxResidence;

  @JsonKey(defaultValue: false)
  bool? usPerson;

  @JsonKey(defaultValue: null)
  String? usTaxId;

  @JsonKey(name: 'secondaryTaxResidence')
  List<TaxResidence>? secondaryTaxResidence;

  @JsonKey(defaultValue: null)
  int? w9FileId;

  TaxModel({
    this.primaryTaxResidence,
    required this.usPerson,
    this.usTaxId,
    this.secondaryTaxResidence,
    this.w9FileId,
  });

  @override
  String toString() {
    return 'TaxModel{primaryTaxResidence: $primaryTaxResidence, usPerson: $usPerson, usTaxId: $usTaxId, secondaryTaxResidence: $secondaryTaxResidence, w9FileId: $w9FileId}';
  }

  factory TaxModel.fromJson(Map<String, dynamic> json) =>
      _$TaxModelFromJson(json);

  Map<String, dynamic> toJson() => _$TaxModelToJson(this);
}

@JsonSerializable()
class TaxResidence {
  String country;
  String id;

  TaxResidence({
    required this.country,
    required this.id,
  });

  @override
  String toString() {
    return 'TaxResidence{country: $country, id: $id}';
  }

  factory TaxResidence.fromJson(Map<String, dynamic> json) =>
      _$TaxResidenceFromJson(json);

  Map<String, dynamic> toJson() => _$TaxResidenceToJson(this);
}
