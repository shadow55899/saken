// import 'dart:io';

class Flat {
  int area;
  int rooms;
      int id;

  int livingRooms;
  int bathrooms;
  int rentalPrice;
  String? governorate;
  String? city;
  String? address;
  String? status;
  String? averageRate;
  String? owner;
  String? description;
  List<dynamic> pictures;

  Flat({
    required this.area,
    required this.rooms,
            required this.id,

    required this.livingRooms,
    required this.bathrooms,
    required this.rentalPrice,
    required this.governorate,
    required this.city,
    required this.address,
    required this.status,
    required this.averageRate,
    required this.owner,
    required this.description,
    required this.pictures,
  });

  // factory Flat.fromJson(Map<String, dynamic> json) => Flat(
  //   area: json["area"] ?? 0,
  //   rooms: json["rooms"] ?? 0,
  //   livingRooms: json["living_rooms"] ?? 0,
  //   bathrooms: json["bathrooms"] ?? 0,
  //   rentalPrice: json["rental_price"] ?? 0,

  //   governorate: json["governorate"] ?? "",
  //   city: json["city"] ?? "",
  //   address: json["address"] ?? "",
  //   status: json["status"] ?? "",
  //   averageRate: json["average_rate"]?.toString() ?? "0",
  //   owner: json["owner"] ?? "",
  //   description: json["description"] ?? "",

  //   pictures: json["pictures"] != null
  //       ? List<dynamic>.from(json["pictures"])
  //       : [],
  // );

  factory Flat.fromJson(Map<String, dynamic> json) => Flat(
    area: json["area"],
            id: json["id"],

    rooms: json["rooms"],
    livingRooms: json["living_rooms"],
    bathrooms: json["bathrooms"],
    rentalPrice: json["rental_price"],
    governorate: json["governorate"],
    city: json["city"],
    address: json["address"],
    status: json["status"],
    averageRate: (json["average_rate"] is Map)
        ? (json["average_rate"]["original"]?["average_rating"]?.toString() ?? "0")
        : (json["average_rate"]?.toString() ?? "0"),

    // json["average_rate"],
    owner: json["owner"],
    description: json["description"],
    pictures: json["pictures"] != null
        ? List<dynamic>.from(json["pictures"])
        : [],
  );

  Map<String, dynamic> toJson() => {
    "area": area,
            "id" : id,

    "rooms": rooms,
    "living_rooms": livingRooms,
    "bathrooms": bathrooms,
    "rental_price": rentalPrice,
    "governorate": governorate,
    "city": city,
    "address": address,
    "status": status,
    "average_rate": averageRate,
    "owner": owner,
    "description": description,
    "pictures": List<dynamic>.from(pictures.map((x) => x)),
  };
  static List<Flat> parseList(List<dynamic> list) {
    return list.map((e) => Flat.fromJson(e)).toList();
  }
}
