// class Data {
//   List<Userg> users;
//
//   Data({required this.users});
//
//   factory Data.fromJson(Map<String, dynamic> json) => Data(
//     users: List<Userg>.from(json["users"].map((x) => Userg.fromJson(x))),
//   );
//
//   Map<String, dynamic> toJson() => {
//     "users": List<dynamic>.from(users.map((x) => x.toJson())),
//   };
// }
//
// class Userg {
//   int id;
//   String firstname;
//   String lastname;
//   String phoneNumber;
//   DateTime dateOfBirth;
//   String picture;
//   String idCardImage;
//   int isApproved;
//   Role role;
//   DateTime createdAt;
//   DateTime updatedAt;
//
//   Userg({
//     required this.id,
//     required this.firstname,
//     required this.lastname,
//     required this.phoneNumber,
//     required this.dateOfBirth,
//     required this.picture,
//     required this.idCardImage,
//     required this.isApproved,
//     required this.role,
//     required this.createdAt,
//     required this.updatedAt,
//   });
//
//   factory Userg.fromJson(Map<String, dynamic> json) => Userg(
//     id: json["id"],
//     firstname: json["firstname"],
//     lastname: json["lastname"],
//     phoneNumber: json["phone_number"],
//     dateOfBirth: DateTime.parse(json["date_of_birth"]),
//     picture: json["picture"],
//     idCardImage: json["id_card_image"],
//     isApproved: json["is_approved"],
//     role: roleValues.map[json["role"]]!,
//     createdAt: DateTime.parse(json["created_at"]),
//     updatedAt: DateTime.parse(json["updated_at"]),
//   );
//
//   Map<String, dynamic> toJson() => {
//     "id": id,
//     "firstname": firstname,
//     "lastname": lastname,
//     "phone_number": phoneNumber,
//     "date_of_birth":
//         "${dateOfBirth.year.toString().padLeft(4, '0')}-${dateOfBirth.month.toString().padLeft(2, '0')}-${dateOfBirth.day.toString().padLeft(2, '0')}",
//     "picture": picture,
//     "id_card_image": idCardImage,
//     "is_approved": isApproved,
//     "role": roleValues.reverse[role],
//     "created_at": createdAt.toIso8601String(),
//     "updated_at": updatedAt.toIso8601String(),
//   };
// }
//
// enum Role { ADMIN, APARTMENT_OWNER, RENTER }
//
// final roleValues = EnumValues({
//   "admin": Role.ADMIN,
//   "apartment_owner": Role.APARTMENT_OWNER,
//   "renter": Role.RENTER,
// });
//
// class EnumValues<T> {
//   Map<String, T> map;
//   late Map<T, String> reverseMap;
//
//   EnumValues(this.map);
//
//   Map<T, String> get reverse {
//     reverseMap = map.map((k, v) => MapEntry(v, k));
//     return reverseMap;
//   }
// }
