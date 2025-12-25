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
  double? rate;
  Statuses? booking_status;
  Payment? payment_method;
  DateTime? check_in_date;
  DateTime? check_out_date;
  int? apartment_id;
  int? user_id;

  Booking({
    this.rate,
    this.booking_status,
    this.payment_method,
    this.check_in_date,
    this.check_out_date,
    this.apartment_id,
    this.user_id,
  });

  factory Booking.fromJson(Map<String, dynamic> json) {
    return Booking(
      rate: json['rate'],
      booking_status: json['booking_status'],
      payment_method: json['payment_method'],
      check_in_date: DateTime.parse(json['check_in_date']),
      check_out_date: DateTime.parse(json['check_out_date']),
      apartment_id: json['apartment_id'],
      user_id: json['user_id'],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'rate': rate,
      'booking_status': booking_status,
      'payment_method': payment_method,
      'check_in_date': check_in_date?.toIso8601String(),
      'check_out_date': check_out_date?.toIso8601String(),
      'apartment_id': apartment_id,
      'user_id': user_id,
    };
  }

  static List<Booking> parseUsers(Map<String, dynamic> json) {
    final List<dynamic> rawBookings = json['data']['bookings'] ?? [];
    return rawBookings.map((userJson) => Booking.fromJson(userJson)).toList();
  }
}
