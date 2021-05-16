import 'enums/PetGender.dart';

class PetDto{
  
 int petId; 
 int shelterId; 
 int speciesId ;
 String petName; 
 String petWeight; 
 String petHeight;
 String petAdditionInfo; 
 String petVaccineInfo;
 DateTime petBirthDate;
 bool hasPassport;
 String genus; 
 PetGender petGender; 
 List<String> images;
 int countyId; 
 int genusId; 
 String speciesName; 
 String shelterName; 
}