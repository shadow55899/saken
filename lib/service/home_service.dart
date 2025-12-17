import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;


import '../models/flat.dart';
import 'api_service.dart';

class HomeService {
  var message;
  final ApiService apiservice = new ApiService();

Future<List<Flat>> fetchFlats(String token) async {
            print("token $token");

  final response = await ApiService.get(
       "/apartment/all",
    headers: {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',

    },
  );

  print("Status code: ${response["status_code"]}");
  print("Full response: $response");

  
  if (response["status_code"] == 200 || response["status_code"] == 201) {
    final data = response["data"];

    
    if (data != null && data is List) {
      print("Flats fetched: ${data.length}");

     
      return data.map<Flat>((json) => Flat.fromJson(json)).toList();
    } else {
      print(" error: response['data'] is not a List");
      return [];
    }
  } else {
    print(" API Error: ${response["status_code"]}");
    return [
    Flat(
      area: 156,
      rooms: 1,
      livingRooms: 1,
      bathrooms: 2,
      rentalPrice:22222,
      governorate: "Homs",
      city: "Al-Mokhaiam",
      address: "61458 Brock Springs Suite 398\nEast Margaritaton, CT 82919-6306",
      status: "Booked",
      averageRate: "2.12",
      owner: "Evert O'Conner",
      description: "Rerum sed quidem et recusandae soluta est sit.",
      pictures: [],
    ),
  ];
  }
}

}

