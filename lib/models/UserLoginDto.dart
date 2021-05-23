class UserLoginDto {
  final String email;
  final String password;

  UserLoginDto(this.email, this.password);

   UserLoginDto.fromJson(Map<String, dynamic> json)
      : email = json['Email'],
        password = json['Password'];

  Map<String, dynamic> toJson() => {
        'Email': email ,
        'Password': password,
      };

  
}
