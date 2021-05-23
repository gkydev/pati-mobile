class UserDto {
  int userId;
  String userFirstName;
  String userLastName;
  String confirmPassword;
  String userMail;
  String userPhoneNumber;
  String userSex;
  String password;
  String userRole;
  int countyId;
  int cityId;

  UserDto(this.userFirstName, this.userLastName, this.userMail,
      this.userPhoneNumber, this.password);

  Map<String, dynamic> toJson() => {
        'UserMail': userMail,
        'Password': password,
        'UserFirstName': userFirstName,
        'UserLastName': userLastName,
        'UserBirthDate': DateTime.now().toIso8601String(),
        'UserPhoneNumber': userPhoneNumber,
        'UserSex': "0",
        'CountyId': "35",
      };
}
