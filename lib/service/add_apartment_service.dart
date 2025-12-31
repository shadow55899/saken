import 'dart:io';
import 'package:get/get.dart';
import '../controller/auth_controller.dart';
import '../models/flat.dart';
import 'package:http/http.dart' as http;
import 'api_service.dart';

class AddApartmentService {
  final AuthController authController = Get.find<AuthController>();

  /// Returns true if the apartment was added successfully
  Future<bool> addApartment({
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
        );
      }

      // Add Authorization header
      request.headers['Authorization'] = "Bearer ${authController.userToken}";
      request.headers['Accept'] = "application/json";

      // Send request
      var streamedResponse = await request.send();
      var responseString = await streamedResponse.stream.bytesToString();

      print("Status Code: ${streamedResponse.statusCode}");
      print("Response: $responseString");

      return streamedResponse.statusCode == 200 ||
          streamedResponse.statusCode == 201;
    } catch (e) {
      print("❌ ADD APARTMENT ERROR: $e");
      return false;
    }
  }

  Future<bool> updateApartment({
    required int apartmentId,
    required Flat flat,
    required int city,
    List<File>? img,
  }) async {
    try {
      final endpoint =
          "/apartment/$apartmentId"
          "?area=${flat.area}"
          "&rooms=${flat.rooms}"
          "&living_rooms=${flat.livingRooms}"
          "&bathrooms=${flat.bathrooms}"
          "&rental_price=${flat.rentalPrice}"
          "&address=${Uri.encodeComponent(flat.address ?? '')}"
          "&description=${Uri.encodeComponent(flat.description ?? '')}"
          "&city_id=$city";

      final uri = Uri.parse("${ApiService.baseUrl}$endpoint");

      final request = http.MultipartRequest("PUT", uri);
      if (img != null && img.isNotEmpty) {
        for (int i = 0; i < img.length; i++) {
          request.files.add(
            await http.MultipartFile.fromPath(
              'img[$i]',
              img[i].path,
            ),
          );
        }
      }

      request.headers['Authorization'] = "Bearer ${authController.userToken}";
      request.headers['Accept'] = "application/json";

      final response = await request.send();
      final responseBody = await response.stream.bytesToString();

      print("UPDATE STATUS: ${response.statusCode}");
      print("UPDATE BODY: $responseBody");

      return response.statusCode == 200 || response.statusCode == 201;
    } catch (e) {
      print("❌ UPDATE ERROR: $e");
      return false;
    }
  }

}
