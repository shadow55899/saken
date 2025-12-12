class Flat {
  final double? area;
  final int? rooms;
  final int? livingRooms;
  final String? description;
  final int? bathrooms;
  final double? rentalPrice;
  final String? address;
  final String? status;
  final String? governorate;
  final String? city;
  final String? owner;
  final double? averageRate;
  final List<String>? pictures;

  Flat({
    this.area,
    this.rooms,
    this.livingRooms,
    this.description,
    this.bathrooms,
    this.rentalPrice,
    this.address,
    this.status,
    this.governorate,
    this.city,
    this.owner,
    this.averageRate,
    this.pictures,
  });

  factory Flat.fromJson(Map<String, dynamic> json) {
    return Flat(
      area: (json['area'] as num?)?.toDouble(),
      rooms: json['rooms'] as int?,
      livingRooms: json['living_rooms'] as int?,
      description: json['description'] as String?,
      bathrooms: json['bathrooms'] as int?,
      rentalPrice: (json['rental_price'] as num?)?.toDouble(),
      address: json['address'] as String?,
      status: json['status'] as String?,
      governorate: json['governorate'] as String?,
      city: json['city'] as String?,
      owner: json['owner'] as String?,
      averageRate: double.tryParse(json['average_rate'] ?? '0'),
      pictures: (json['pictures'] as List<dynamic>?)
          ?.map((e) => e.toString())
          .toList(),
    );
  }
  static List<Flat> parseFlats(Map<String, dynamic> json) {
    final List<dynamic> rawFlats = json['data']['users'] ?? [];
    return rawFlats.map((flatJson) => Flat.fromJson(flatJson)).toList();
  }
}
