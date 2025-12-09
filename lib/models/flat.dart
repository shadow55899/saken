import 'dart:io';

class Flat {
  double? area;
  int? rooms;
  int? living_rooms;
  String? description;
  int? bathrooms;
  double? rental_price;
  double? address;
  double? status;
  int? city_id;
  int? user_id;
  double? average_rate;
  Flat({
    required this.address,
    required this.area,
    required this.average_rate,
    required this.bathrooms,
    required this.city_id,
    required this.description,
    required this.living_rooms,
    required this.rental_price,
    required this.rooms,
    required this.status,
    required this.user_id,
  });
  
}
