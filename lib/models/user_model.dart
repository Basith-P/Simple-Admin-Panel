class UserModel {
  final String id;
  final String name;
  final String email;
  final String gender;
  final String status;
  final String imgUrl;

  UserModel({
    required this.id,
    required this.name,
    required this.email,
    required this.gender,
    required this.status,
    this.imgUrl = '',
  });
}
