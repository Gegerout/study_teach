class UserModel {
  final String name;
  final String phone;
  final String email;

  UserModel(this.name, this.phone, this.email);

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(json["name"], json["phone"], json["email"]);
  }

  Map<String, dynamic> toJson() => {
    "name": name,
    "phone": phone,
    "email": email
  };
}