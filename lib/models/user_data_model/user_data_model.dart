class UserDataModel {
  String? firstName;
  String? lastName;
  String? emailAddress;
  String? phoneNumber;
  String? uId;

  UserDataModel({
    this.firstName,
    this.lastName,
    this.emailAddress,
    this.phoneNumber,
    this.uId,
  });

  UserDataModel.fromJson(Map<String,dynamic>json){
    firstName = json['firstName'];
    lastName = json['lastName'];
    emailAddress = json['emailAddress'];
    phoneNumber = json['phoneNumber'];
    uId = json['uId'];
  }

  Map<String, dynamic> toMap() {
    return {
      "firstName": firstName,
      "lastName": lastName,
      "emailAddress": emailAddress,
      "phoneNumber": phoneNumber,
      "uId": uId,
    };
  }
}
