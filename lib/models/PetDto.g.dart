// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'PetDto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PetDto _$PetDtoFromJson(Map<String, dynamic> json) {
  return PetDto(
    json['CountyId'] as int,
    json['Genus'] as String,
    json['GenusId'] as int,
    json['HasPassport'] as int,
    (json['Images'] as List)?.map((e) => e as String)?.toList(),
    json['PetAdditionInfo'] as String,
    json['PetBirthdate'] == null
        ? null
        : DateTime.parse(json['PetBirthdate'] as String),
    json['PetGender'] as int,
    json['PetHeight'] as int,
    json['PetId'] as int,
    json['PetName'] as String,
    json['PetVaccineInfo'] as String,
    json['PetWeight'] as int,
    json['ShelterId'] as int,
    json['ShelterName'] as String,
    json['SpeciesId'] as int,
    json['SpeciesName'] as String,
  );
}

Map<String, dynamic> _$PetDtoToJson(PetDto instance) => <String, dynamic>{
      'PetId': instance.petId,
      'ShelterId': instance.shelterId,
      'SpeciesId': instance.speciesId,
      'PetName': instance.petName,
      'PetWeight': instance.petWeight,
      'PetHeight': instance.petHeight,
      'PetAdditionInfo': instance.petAdditionInfo,
      'PetVaccineInfo': instance.petVaccineInfo,
      'PetBirthdate': instance.petBirthDate?.toIso8601String(),
      'HasPassport': instance.hasPassport,
      'Genus': instance.genus,
      'PetGender': instance.petGender,
      'Images': instance.images,
      'CountyId': instance.countyId,
      'GenusId': instance.genusId,
      'SpeciesName': instance.speciesName,
      'ShelterName': instance.shelterName,
    };
