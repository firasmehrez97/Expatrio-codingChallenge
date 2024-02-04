// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tax_country.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TaxModel _$TaxModelFromJson(Map<String, dynamic> json) => TaxModel(
      primaryTaxResidence: json['primaryTaxResidence'] == null
          ? null
          : TaxResidence.fromJson(
              json['primaryTaxResidence'] as Map<String, dynamic>),
      usPerson: json['usPerson'] as bool? ?? false,
      usTaxId: json['usTaxId'] as String?,
      secondaryTaxResidence: (json['secondaryTaxResidence'] as List<dynamic>?)
          ?.map((e) => TaxResidence.fromJson(e as Map<String, dynamic>))
          .toList(),
      w9FileId: json['w9FileId'] as String?,
    );

Map<String, dynamic> _$TaxModelToJson(TaxModel instance) => <String, dynamic>{
      'primaryTaxResidence': instance.primaryTaxResidence,
      'usPerson': instance.usPerson,
      'usTaxId': instance.usTaxId,
      'secondaryTaxResidence': instance.secondaryTaxResidence,
      'w9FileId': instance.w9FileId,
    };

TaxResidence _$TaxResidenceFromJson(Map<String, dynamic> json) => TaxResidence(
      country: json['country'] as String,
      id: json['id'] as String,
    );

Map<String, dynamic> _$TaxResidenceToJson(TaxResidence instance) =>
    <String, dynamic>{
      'country': instance.country,
      'id': instance.id,
    };
