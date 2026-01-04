enum Statuses {
  pending, // waiting for the owner to conform the booking request
  confirmed, // owner confirm client request
  rejected, // owner reject client request
  cancelled, // client cancel his/her request
  completed, // client checked out and the booking completed
  expired, // owner does not confirm client request and the time is up
  payment_pending, // waiting for the client to pay
  payment_failed, // something in payment went wrong
  no_show, // client pay and haven't checked in
  checked_in, // client arrived to apartment
  modified, // client modified his request
}

enum Payment { credit, bank_transfer, cash, digital_wallet }

class Booking {
  int id;
  int? userId;
  int? apartmentId;
  String? checkInDate;
  String? checkOutDate;
  String? paymentMethod;
  String? bookingStatus;
  dynamic rate;
  String? createdAt;
  String? updatedAt;

  Booking( {
    required this.id,

    this.userId,
    this.apartmentId,
    this.checkInDate,
    this.checkOutDate,
    this.paymentMethod,
    this.bookingStatus,
    this.rate,
    this.createdAt,
    this.updatedAt,
  });

  factory Booking.fromJson(Map<String, dynamic> json) {
    print("Booking JSON: $json");
    return Booking(
      id: json['id'],
      userId: json['user_id'],
      apartmentId: json['apartment_id'],
      checkInDate: json['check_in_date'],
      checkOutDate: json['check_out_date'],
      paymentMethod: json['payment_method'],
      bookingStatus: json['booking_status'],
      rate: json['rate'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'user_id': userId,
      'apartment_id': apartmentId,
      'check_in_date': checkInDate,
      'check_out_date': checkOutDate,
      'payment_method': paymentMethod,
      'booking_status': bookingStatus,
      'rate': rate,
      'created_at': createdAt,
      'updated_at': updatedAt,
    };
  }
}
