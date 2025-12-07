class User {
  final String firstName;
  final String lastName;
  final String phone;
  final String password;

  static final User user = User(
    firstName: 'Aboabdo',
    lastName: 'Alhalabastani',
    phone: "0949378835",
    password: "00000000",
  );

  User({
    required this.firstName,
    required this.lastName,
    required this.phone,
    required this.password,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      firstName: json['firstName'],
      lastName: json['lastName'],
      phone: json['phone'],
      password: json['password'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "firstName": firstName,
      "lastName": lastName,
      "phone": phone,
      "password": password,
    };
  }
}
