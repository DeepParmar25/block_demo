import '../../presentation/user_list_Page/domain/user.dart';

class UserModel extends User {
  UserModel({
    required int id,
    required String firstName,
    required String lastName,
    required String image,
    required String department,
    required String companyName,
  }) : super(
         id: id,
         firstName: firstName,
         lastName: lastName,
         image: image,
         department: department,
         companyName: companyName,
       );

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      image: json['image'],
      department: json['company']['department'],
      companyName: json['company']['name'],
    );
  }
}
