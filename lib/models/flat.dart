// import 'dart:io';

import 'package:tapbar/models/booking.dart';

class Flat {
  int? id;
  int? area;
  int? rooms;
  int? livingRooms;
  int? bathrooms;
  int? rentalPrice;
  String? governorate;
  String? city;
  String? address;
  String? status;
  double? averageRate;
  String? owner;
  String? ownerPhone;
  String? description;
  List<String>? pictures;
  List<Booking>? bookings;

  Flat({
    this.id,
    this.area,
    this.rooms,
    this.livingRooms,
    this.bathrooms,
    this.rentalPrice,
    this.governorate,
    this.city,
    this.address,
    this.status,
    this.averageRate,
    this.owner,
    this.ownerPhone,
    this.description,
    this.pictures,
    this.bookings,
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
    id: json['id'],
    area: json['area'],
    rooms: json['rooms'],
    livingRooms: json['living_rooms'],
    bathrooms: json['bathrooms'],
    rentalPrice: json['rental_price'],
    governorate: json['governorate'],
    city: json['city'],
    address: json['address'],
    status: json['status'],
    averageRate: (json['average_rate'] ?? 0).toDouble(),
    owner: json['owner'],
    ownerPhone: json["owner’s phone number "],
    description: json['description'],
    pictures: json['pictures'] != null
        ? List<String>.from(json['pictures'])
        : [],
    bookings: json['bookings'] != null
        ? (json['bookings'] as List).map((e) => Booking.fromJson(e)).toList()
        : [],
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'area': area,
    'rooms': rooms,
    'living_rooms': livingRooms,
    'bathrooms': bathrooms,
    'rental_price': rentalPrice,
    'governorate': governorate,
    'city': city,
    'address': address,
    'status': status,
    'average_rate': averageRate,
    'owner': owner,
    "owner’s phone number ": ownerPhone,
    'description': description,
    'pictures': pictures,
    'bookings': bookings?.map((e) => e.toJson()).toList(),
  };
  static List<Flat> parseList(List<dynamic> list) {
    return list.map((e) => Flat.fromJson(e)).toList();
  }
}
