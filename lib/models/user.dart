import 'package:apartment/controller/register_controller.dart';

class User {
  final int id;
  final String firstName;
  final String lastName;
  final String phone;
  final String password;
  final Role role;

  User({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.phone,
    required this.password,
    required this.role,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'] ?? 0,
      firstName: json['firstname'] ?? '',
      lastName: json['lastname'] ?? '',
      phone: json['phone_number'] ?? '',
      password: '', // backend never returns password
      role: Role.values.firstWhere(
        (r) => r.name == json['role'],
        orElse: () => Role.renter,
      ),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "firstName": firstName,
      "lastName": lastName,
      "phone": phone,
      "password": password,
      "role": role.name,
    };
  }

}

