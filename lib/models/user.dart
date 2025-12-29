import '../controller/register_controller.dart';

class User {
  final int id;
  final String firstName;
  final String lastName;
  final String phone;
  final int is_approve;
  final Role role;

  // adds
  final DateTime dateOfBirth;
  final String? picture;
  final String? idCardImage;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  User({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.phone,
    required this.is_approve,
    required this.role,
    required this.dateOfBirth,
    // adds
    this.picture,
    this.idCardImage,
    this.createdAt,
    this.updatedAt,
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
      //adds
      dateOfBirth: DateTime.parse(json["date_of_birth"]) ,

      picture: json['picture'],
      idCardImage: json['id_card_image'],

      createdAt: json['created_at'] != null
          ? DateTime.tryParse(json['created_at'])
          : null,

      updatedAt: json['updated_at'] != null
          ? DateTime.tryParse(json['updated_at'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "firstname": firstName,
      "lastname": lastName,
      "phone_number": phone,
      "role": role.name,
      "is_approve": is_approve,
      //adds
      "date_of_birth": dateOfBirth?.toIso8601String(),
      "picture": picture,
      "id_card_image": idCardImage,
      "created_at": createdAt?.toIso8601String(),
      "updated_at": updatedAt?.toIso8601String(),
    };
  }

  // static List<User> parseUsers(Map<String, dynamic> json) {
  //   final List<dynamic> rawUsers = json['data']['users'] ?? [];
  //   return rawUsers.map((userJson) => User.fromJson(userJson)).toList();
  // }
  //

  static List<User> parseUsers(Map<String, dynamic> json) {
    final raw = json['data'];

    if (raw is List) {
      return raw.map((e) => User.fromJson(e)).toList();
    }

    if (raw is Map && raw['users'] is List) {
      return (raw['users'] as List).map((e) => User.fromJson(e)).toList();
    }

    return [];
  }
}
