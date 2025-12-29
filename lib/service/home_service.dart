// import 'dart:convert';
// import 'package:get/get.dart';
// import 'package:http/http.dart' as http;
//
//
// import '../models/flat.dart';
// import 'api_service.dart';
//
// class HomeService {
//   var message;
//   final ApiService apiservice = new ApiService();
//
// Future<List<Flat>> fetchFlats(String token) async {
//             print("token $token");
//
//   final response = await ApiService.get(
//        "/apartment/all",
//     headers: {
//       'Accept': 'application/json',
//       'Content-Type': 'application/json',
//         'Authorization': 'Bearer $token',
//
//     },
//   );
//
//   print("Status code: ${response["status_code"]}");
//   print("Full response: $response");
//
//
//   if (response["status_code"] == 200 || response["status_code"] == 201) {
//     final data = response["data"];
//
//
//     if (data != null && data is List) {
//       print("Flats fetched: ${data.length}");
//
//
//       return data.map<Flat>((json) => Flat.fromJson(json)).toList();
//     } else {
//       print(" error: response['data'] is not a List");
//       return [];
//     }
//   } else {
//     print(" API Error: ${response["status_code"]}");
//     return [
//     Flat(
//       area: 156,
//       rooms: 1,
//       livingRooms: 1,
//       bathrooms: 2,
//       rentalPrice:22222,
//       governorate: "Homs",
//       city: "Al-Mokhaiam",
//       address: "61458 Brock Springs Suite 398\nEast Margaritaton, CT 82919-6306",
//       status: "Booked",
//       averageRate: "2.12",
//       owner: "Evert O'Conner",
//       description: "Rerum sed quidem et recusandae soluta est sit.",
//       pictures: [],
//     ),
//   ];
//   }
// }
//
// }
//
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

    //print("Status code: ${response["status_code"]}");
    print("Full response: $response");

    if (response["status_code"] == 200 || response["status_code"] == 201) {
      final data = response["data"];

      if (data != null && data is List) {
        //print("Flats fetched: ${data.length}");

        return data.map<Flat>((json) => Flat.fromJson(json)).toList();
      } else {
        // print(" error: response['data'] is not a List");
        return [];
      }
    } else {
      //print(" API Error: ${response["status_code"]}");
      return [
        Flat(
          area: 156,
          rooms: 1,
          livingRooms: 1,
          bathrooms: 2,
          rentalPrice: 22222,
          governorate: "Homs",
          city: "Al-Mokhaiam",
          address:
              "61458 Brock Springs Suite 398\nEast Margaritaton, CT 82919-6306",
          status: "Booked",
          averageRate: 2.12,
          owner: "Evert O'Conner",
          description: "Rerum sed quidem et recusandae soluta est sit.",
          pictures: [],
        ),
      ];
    }
  }

  ////////////////////////////

  // Filter by Price
  Future<List<Flat>> filterByPrice(double min, double max, String token) async {
    final response = await ApiService.get(
      "/apartment/filterPrice/$min/$max",
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );

    print(response);

    if (response["status_code"] == 200 || response["status_code"] == 201) {
      final data = response["data"];
      if (data != null && data is List) {
        return data.map<Flat>((json) => Flat.fromJson(json)).toList();
      }
    }
    return []; // fallback empty
  }

  // Filter by Governorate
  Future<List<Flat>> filterByGovernorate(int govId, String token) async {
    final response = await ApiService.get(
      "/apartment/filterGovernorate/$govId",
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );
    if (response["status_code"] == 200 || response["status_code"] == 201) {
      final data = response["data"];
      if (data != null && data is List) {
        return data.map<Flat>((json) => Flat.fromJson(json)).toList();
      }
    }
    return [];
  }

  // Filter by City
  Future<List<Flat>> filterByCity(int cityId, String token) async {
    final response = await ApiService.get(
      "/apartment/filterCity/$cityId",
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );
    if (response["status_code"] == 200 || response["status_code"] == 201) {
      final data = response["data"];
      if (data != null && data is List) {
        return data.map<Flat>((json) => Flat.fromJson(json)).toList();
      }
    }
    return [];
  }

  // Filter by Rooms
  Future<List<Flat>> filterByRooms(int rooms, String token) async {
    final response = await ApiService.get(
      "/apartment/filterRooms/$rooms",
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );
    if (response["status_code"] == 200 || response["status_code"] == 201) {
      final data = response["data"];
      if (data != null && data is List) {
        return data.map<Flat>((json) => Flat.fromJson(json)).toList();
      }
    }
    return [];
  }

  // Filter by Area
  Future<List<Flat>> filterByArea(double min, double max, String token) async {
    final response = await ApiService.get(
      "/apartment/filterِArea/$min/$max",

      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );
    if (response["status_code"] == 200 || response["status_code"] == 201) {
      final data = response["data"];
      if (data != null && data is List) {
        return data.map<Flat>((json) => Flat.fromJson(json)).toList();
      }
    }
    return [];
  }

  //////////////////////////
  //   Future<bool> filterPrice(String token, double minprice,double maxprice) async {
  //     final response = await ApiService.put(
  //       "/apartment/filterPrice/$minprice/$maxprice",
  //       headers: {
  //         'Authorization': 'Bearer $token',
  //       },
  //     );
  //     print("Status code: ${response["status_code"]}");
  //     print("FULL RESPONSE: $response");
  //
  //     if (response["status_code"] == 200 || response["status_code"] == 201) {
  //       return true;
  //     } else {
  //       return false;
  //     }
  //   }
  //
  //
  //   Future<bool> filterArea(String token, double minarea,double maxarea) async {
  //     final response = await ApiService.put(
  //       "/apartment/filterArea/$minarea/$maxarea",
  //       headers: {
  //         'Authorization': 'Bearer $token',
  //       },
  //     );
  //     print("Status code: ${response["status_code"]}");
  //     print("FULL RESPONSE: $response");
  //
  //     if (response["status_code"] == 200 || response["status_code"] == 201) {
  //       return true;
  //     } else {
  //       return false;
  //     }
  //   }
  //
}
