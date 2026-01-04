import 'package:get/get.dart';
import 'package:tapbar/providers/otp_service.dart';

class OtpController extends GetxController {
  RxString otp = "".obs;
  OtpService provider = OtpService();
  RxBool isLoading = false.obs;
  RxBool isOtpSent = false.obs;
  bool isForgotPassword = false;

  void updateOtp(String newOtp) {
    otp.value = newOtp;
  }

  Future<void> ResetPass(
    String password,
    String password_confimation,
    String? phone_number,
  ) async {
    try {
      isLoading.value = true;
      // await provider.resetPassword(phone_number , password , password_confimation);
      isLoading.value = false;
    } catch (e) {
      Get.snackbar("Error", "Something went wrong");
    }
  }

  Future<void> verify_otp(String phone_number) async {
    try {
      isLoading.value = true;
      // await provider.verifyOtp(otp.value, phone_number, isForgotPassword);
      isLoading.value = false;
    } catch (e) {
      Get.snackbar("Error", "Something went wrong");
    }
  }

  Future<void> resend_otp(String phone_number) async {
    try {
      isOtpSent.value = true;
      // await provider.resendOtp(phone_number);
      isOtpSent.value = false;
    } catch (e) {
      Get.snackbar("Error", "Something went wrong");
    }
  }

  Future<void> forgotPass(String phone_number) async {
    try {
      isLoading.value = true;
      // bool? res = await provider.forgotPassword(phone_number);
      isLoading.value = false;
      // if(res == true)
      // isForgotPassword = true;
    } catch (e) {
      Get.snackbar("Error", "Something went wrong");
    }
  }
}
