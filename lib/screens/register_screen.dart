import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tapbar/models/user.dart';

import '../controller/register_controller.dart';
import '../widgets/date-picker.dart';
import '../widgets/image_picker_button.dart';

class RegisterScreen extends StatelessWidget {
  final RegisterController controller = Get.put(RegisterController());

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      appBar: AppBar(title: Text('register'.tr)),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Image.asset(
                  isDark ? 'assets/images/user2.png' : 'assets/images/user.png',
                  width: 200,
                  height: 200,
                ),
                Text(
                  'create_account'.tr,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 30),
                ),
                SizedBox(height: 15),
                isDark
                    ? TextFormField(
                        onChanged: (val) => controller.firstName.value = val,
                        keyboardType: TextInputType.name,
                        decoration: InputDecoration(
                          labelText: 'first_name'.tr,
                          border: OutlineInputBorder(
                            gapPadding: 20,
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      )
                    : TextFormField(
                        onChanged: (val) => controller.firstName.value = val,
                        keyboardType: TextInputType.name,
                        style: const TextStyle(color: Color(0xFF5A7867)),
                        decoration: InputDecoration(
                          labelText: 'first_name'.tr,
                          labelStyle: const TextStyle(color: Color(0xFF5A7867)),
                          border: OutlineInputBorder(
                            gapPadding: 20,
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(
                              color: Color(0xFF5A7867),
                            ),
                          ),
                          focusedBorder: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            borderSide: BorderSide(color: Color(0xFF5A7867)),
                          ),
                        ),
                      ),
                SizedBox(height: 15),
                isDark
                    ? TextFormField(
                        onChanged: (val) => controller.lastName.value = val,
                        keyboardType: TextInputType.name,
                        decoration: InputDecoration(
                          labelText: 'last_name'.tr,
                          border: OutlineInputBorder(
                            gapPadding: 20,
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      )
                    : TextFormField(
                        onChanged: (val) => controller.lastName.value = val,
                        keyboardType: TextInputType.name,
                        style: const TextStyle(color: Color(0xFF5A7867)),
                        decoration: InputDecoration(
                          labelText: 'last_name'.tr,
                          labelStyle: const TextStyle(color: Color(0xFF5A7867)),
                          border: OutlineInputBorder(
                            gapPadding: 20,
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(
                              color: Color(0xFF5A7867),
                            ),
                          ),
                          focusedBorder: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            borderSide: BorderSide(color: Color(0xFF5A7867)),
                          ),
                        ),
                      ),
                SizedBox(height: 15),
                isDark
                    ? TextFormField(
                        onChanged: (val) => controller.phoneNumber.value = val,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          labelText: 'phone'.tr,
                          border: OutlineInputBorder(
                            gapPadding: 20,
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      )
                    : TextFormField(
                        onChanged: (val) => controller.phoneNumber.value = val,
                        keyboardType: TextInputType.number,
                        style: const TextStyle(color: Color(0xFF5A7867)),
                        decoration: InputDecoration(
                          labelText: 'phone'.tr,
                          labelStyle: const TextStyle(color: Color(0xFF5A7867)),
                          border: OutlineInputBorder(
                            gapPadding: 20,
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(
                              color: Color(0xFF5A7867),
                            ),
                          ),
                          focusedBorder: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            borderSide: BorderSide(color: Color(0xFF5A7867)),
                          ),
                        ),
                      ),
                SizedBox(height: 25),
                isDark
                    ? TextFormField(
                        onChanged: (val) => controller.password.value = val,
                        obscureText: true,
                        decoration: InputDecoration(
                          labelText: 'password'.tr,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      )
                    : TextFormField(
                        onChanged: (val) => controller.password.value = val,
                        style: const TextStyle(color: Color(0xFF5A7867)),
                        obscureText: true,
                        decoration: InputDecoration(
                          labelText: 'password'.tr,
                          labelStyle: const TextStyle(color: Color(0xFF5A7867)),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(
                              color: Color(0xFF5A7867),
                            ),
                          ),
                          focusedBorder: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            borderSide: BorderSide(color: Color(0xFF5A7867)),
                          ),
                        ),
                      ),
                SizedBox(height: 15),
                isDark
                    ? TextFormField(
                        obscureText: true,
                        decoration: InputDecoration(
                          labelText: 'confirm_password'.tr,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      )
                    : TextFormField(
                        style: const TextStyle(color: Color(0xFF5A7867)),
                        obscureText: true,
                        decoration: InputDecoration(
                          labelText: 'confirm_password'.tr,
                          labelStyle: const TextStyle(color: Color(0xFF5A7867)),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(
                              color: Color(0xFF5A7867),
                            ),
                          ),
                          focusedBorder: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            borderSide: BorderSide(color: Color(0xFF5A7867)),
                          ),
                        ),
                      ),
                SizedBox(height: 15),
                ListTile(
                  title: Obx(
                    () => Text(
                      controller.selectedDate.value == null
                          ? 'birth_date'.tr
                          : controller.selectedDate.value!
                                .toString()
                                .split(" ")
                                .first,
                    ),
                  ),
                  trailing: const Icon(Icons.date_range),
                  onTap: () => controller.pickDate(context),
                ),
                SizedBox(height: 15),
                Center(
                  child: Obx(() {
                    final allowedRoles = Role.values
                        .where((r) => r != Role.admin)
                        .toList();

                    return DropdownButton<Role>(
                      hint: Text(
                        'role'.tr,
                        style: TextStyle(
                          color: isDark ? Colors.white : Colors.black,
                        ),
                      ),
                      underline: Container(
                        height: 1,
                        color: isDark ? Colors.grey : Colors.black,
                      ),
                      value: allowedRoles.contains(controller.role.value)
                          ? controller.role.value
                          : null,
                      items: allowedRoles.map((role) {
                        return DropdownMenuItem<Role>(
                          value: role,
                          child: Text(
                            User.roleToLocalized(role),
                            style: TextStyle(
                              color: isDark ? Colors.white : Colors.black,
                            ),
                          ),
                        );
                      }).toList(),
                      onChanged: (val) {
                        if (val != null) controller.role.value = val;
                      },
                      iconEnabledColor: isDark ? Colors.white : Colors.black,
                    );
                  }),
                ),

                SizedBox(height: 15),

                SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      imagePickerButton(
                        label: 'personal_image'.tr,
                        image: controller.personalImage,
                        onPressed: () =>
                            controller.pickImage(true, ImageSource.camera),
                      ),
                      imagePickerButton(
                        label: 'id_image'.tr,
                        image: controller.idImage,
                        onPressed: () =>
                            controller.pickImage(false, ImageSource.gallery),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 15),
                SizedBox(height: 15),
                Obx(() {
                  return ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(double.infinity, 75),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onPressed: controller.isLoading.value
                        ? null
                        : () async {
                            controller.isLoading.value = true;
                            await controller.register();
                            controller.isLoading.value = false;
                          },
                    child: controller.isLoading.value
                        ? const SizedBox(
                            height: 24,
                            width: 24,
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                              color: Colors.white,
                            ),
                          )
                        : Text('create_account'.tr),
                  );
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
