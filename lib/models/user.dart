import '../controller/register_controller.dart';

class User {
  final int id;
  final String firstName;
  final String lastName;
  final String phone;
  final int is_approve;
  final Role role;

  User({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.phone,
    required this.is_approve,
    required this.role,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'] ?? 0,
      firstName: json['firstname'] ?? '',
      lastName: json['lastname'] ?? '',
      phone: json['phone_number'] ?? '',
      role: Role.values.firstWhere(
        (r) => r.name == json['role'],
        orElse: () => Role.renter,
      ),
      is_approve: json['is_approve'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "firstname": firstName,
      "lastname": lastName,
      "phone_number": phone,
      "role": role.name,
    };
  }

  static List<User> parseUsers(Map<String, dynamic> json) {
    final List<dynamic> rawUsers = json['data']['users'] ?? [];
    return rawUsers.map((userJson) => User.fromJson(userJson)).toList();
  }
}
