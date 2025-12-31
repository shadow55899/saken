import 'dart:convert';
import 'dart:io';
import 'package:get/get.dart';
import '../controller/auth_controller.dart';
import '../models/flat.dart';
import 'package:http/http.dart' as http;
import 'api_service.dart';

class MyApartmentService {
  final AuthController authController = Get.find<AuthController>();

  Future<List<Flat>> fetchownerFlats(String token) async {
    print(" $token");

    final response = await ApiService.get(
      "/apartment",
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',

      },
    );

    print("Status code: ${response["status_code"]}");
    print("Full response: $response");
    if (response["status_code"] == 200 || response["status_code"] == 201) {

      final body = response["body"];
      final List<dynamic> data =
      body is String ? jsonDecode(body) : body;

      print("Flats fetched: ${data.length}");

      return data.map<Flat>((json) => Flat.fromJson(json)).toList();
    }

    else {
      print(" API Error: ${response["status_code"]}");
      return [
        Flat(
          id: 1,
          area: 156,
          rooms: 1,
          livingRooms: 1,
          bathrooms: 2,
          rentalPrice:22222,
          governorate: "Homs",
          city: "Al-Mokhaiam",
          address: "61458 Brock Springs Suite 398\nEast Margaritaton, CT 82919-6306",
          status: "Booked",
          averageRate: 2.12,
          owner: "Evert O'Conner",
          description: "Rerum sed quidem et recusandae soluta est sit.",
          pictures: [],
        ),
      ];
    }
  }

  /// Returns true if the apartment was added successfully
  Future<bool> updateApartment({
    required Flat flat,
    required int city,
    required List<File> images,
  }) async {
    try {
      // Build endpoint with query parameters
      final endpoint =
          "/apartment"
          "?area=${flat.area}"
          "&rooms=${flat.rooms}"
          "&living_rooms=${flat.livingRooms}"
          "&bathrooms=${flat.bathrooms}"
          "&rental_price=${flat.rentalPrice}"
          "&address=${Uri.encodeComponent(flat.address ?? '')}"
          "&description=${Uri.encodeComponent(flat.description ?? '')}"

          "&status=Free"
          "&city_id=$city";

      // Create multipart request
      var uri = Uri.parse("${ApiService.baseUrl}$endpoint");
      var request = http.MultipartRequest("POST", uri);

      // Add images to request
      for (int i = 0; i < images.length; i++) {
        request.files.add(
          await http.MultipartFile.fromPath(
            'images[$i]', // VERY IMPORTANT
            images[i].path,
          ),
        );}

      // Add Authorization header
      request.headers['Authorization'] = "Bearer ${authController.userToken}";
      request.headers['Accept'] = "application/json";

      // Send request
      var streamedResponse = await request.send();
      var responseString = await streamedResponse.stream.bytesToString();

      print("Status Code: ${streamedResponse.statusCode}");
      print("Response: $responseString");

      return streamedResponse.statusCode == 200 || streamedResponse.statusCode == 201;
    } catch (e) {
      print("❌ ADD APARTMENT ERROR: $e");
      return false;
    }
  }
  Future<bool> deleteApartment(int apartmentId) async {
    try {
      final response = await ApiService.delete(
        "/apartment/$apartmentId",
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer ${authController.userToken}',
        },
      );
      print("Delete status: ${response["status_code"]}");

      print("Delete status: ${response["status_code"]}");
      print("Delete response: $response");

      return response["status_code"] == 200 ||
          response["status_code"] == 204;
    } catch (e) {
      print("❌ DELETE ERROR: $e");
      return false;
    }
  }

}
