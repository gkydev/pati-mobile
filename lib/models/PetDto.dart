import 'package:json_annotation/json_annotation.dart';

import 'enums/PetGender.dart';

part  'PetDto.g.dart';

@JsonSerializable()
class PetDto{

 @JsonKey(name: 'PetId') 
 int petId; 

 @JsonKey(name: 'ShelterId') 
 int shelterId; 

@JsonKey(name: 'SpeciesId') 
 int speciesId ;

@JsonKey(name: 'PetName') 
 String petName; 

@JsonKey(name: 'PetWeight') 
 int petWeight; 

@JsonKey(name: 'PetHeight') 
 int petHeight;

@JsonKey(name: 'PetAdditionInfo') 
 String petAdditionInfo; 

@JsonKey(name: 'PetVaccineInfo') 
 String petVaccineInfo;

@JsonKey(name: 'PetBirthdate') 
 DateTime petBirthDate;

@JsonKey(name: 'HasPassport') 
 int hasPassport;
 
@JsonKey(name: 'Genus') 
 String genus; 

@JsonKey(name: 'PetGender') 
 int petGender; 

  @JsonKey(name: 'Images') 
 List<String> images;

  @JsonKey(name: 'CountyId') 
 int countyId; 

  @JsonKey(name: 'GenusId') 
 int genusId; 

  @JsonKey(name: 'SpeciesName') 
 String speciesName; 

  @JsonKey(name: 'ShelterName') 
 String shelterName;

 @JsonKey(name: 'ShelterLocationLat')
 String shelterLocationLat;

 @JsonKey(name: 'ShelterLocationLng')
 String shelterLocationLng;

 @JsonKey(name: 'ShelterPhone')
 String shelterPhone;

 PetDto(this.countyId, this.genus, this.genusId, this.hasPassport, this.images, this.petAdditionInfo, this.petBirthDate, this.petGender, this.petHeight, this.petId, this.petName, this.petVaccineInfo
 ,this.petWeight, this.shelterId, this.shelterName, this.speciesId, this.speciesName, this.shelterLocationLat, this.shelterLocationLng, this.shelterPhone);

  factory PetDto.fromJson(Map<String, dynamic> json) => _$PetDtoFromJson(json);

  /// `toJson` is the convention for a class to declare support for serialization
  /// to JSON. The implementation simply calls the private, generated
  /// helper method `_$PetDtoToJson`.
  Map<String, dynamic> toJson() => _$PetDtoToJson(this);
}
