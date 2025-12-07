import 'package:apartment/controller/register_controller.dart';
import 'package:apartment/screens/login_screen.dart';
import 'package:apartment/widgets/date-picker.dart';
import 'package:apartment/widgets/image_picker_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

// ignore: use_key_in_widget_constructors
class RegisterScreen extends StatelessWidget {
  final RegisterController controller = Get.put(RegisterController());
  // ignore: unused_field
  //DateTime? _selectedDate;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Register')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Image.asset(
                  Theme.of(context).brightness == Brightness.dark
                      ? 'assets/images/user2.png'
                      : 'assets/images/user.png',
                  width: 200,
                  height: 200,
                ),
                Text(
                  "Register your account",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 30),
                ),
                SizedBox(height: 15),
                Theme.of(context).brightness == Brightness.dark
                    ? TextFormField(
                        onChanged: (val) => controller.firstName.value = val,
                        keyboardType: TextInputType.name,
                        decoration: InputDecoration(
                          labelText: 'First Name',
                          border: OutlineInputBorder(
                            gapPadding: 20,
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      )
                    : TextFormField(
                        onChanged: (val) => controller.firstName.value = val,
                        keyboardType: TextInputType.name,
                        style: const TextStyle(
                          color: Color(0xFF5A7867), // typed text color
                        ),
                        decoration: InputDecoration(
                          labelText: 'First Name',
                          labelStyle: const TextStyle(
                            color: Color(0xFF5A7867), // label color
                          ),
                          border: OutlineInputBorder(
                            gapPadding: 20,
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(
                              color: Color(0xFF5A7867),
                            ), // border color
                          ),
                          focusedBorder: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            borderSide: BorderSide(
                              color: Color(0xFF5A7867),
                            ), // focused border color
                          ),
                        ),
                      ),
                SizedBox(height: 15),
                Theme.of(context).brightness == Brightness.dark
                    ? TextFormField(
                        onChanged: (val) => controller.lastName.value = val,
                        keyboardType: TextInputType.name,
                        decoration: InputDecoration(
                          labelText: 'Last Name',
                          border: OutlineInputBorder(
                            gapPadding: 20,
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      )
                    : TextFormField(
                        onChanged: (val) => controller.lastName.value = val,
                        keyboardType: TextInputType.name,
                        style: const TextStyle(
                          color: Color(0xFF5A7867), // typed text color
                        ),
                        decoration: InputDecoration(
                          labelText: 'Last Name',
                          labelStyle: const TextStyle(
                            color: Color(0xFF5A7867), // label color
                          ),
                          border: OutlineInputBorder(
                            gapPadding: 20,
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(
                              color: Color(0xFF5A7867),
                            ), // border color
                          ),
                          focusedBorder: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            borderSide: BorderSide(
                              color: Color(0xFF5A7867),
                            ), // focused border color
                          ),
                        ),
                      ),
                SizedBox(height: 15),
                Theme.of(context).brightness == Brightness.dark
                    ? TextFormField(
                        onChanged: (val) => controller.phoneNumber.value = val,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          labelText: 'Phone number',
                          border: OutlineInputBorder(
                            gapPadding: 20,
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      )
                    : TextFormField(
                        onChanged: (val) => controller.phoneNumber.value = val,
                        keyboardType: TextInputType.number,
                        style: const TextStyle(
                          color: Color(0xFF5A7867), // typed text color
                        ),
                        decoration: InputDecoration(
                          labelText: 'Phone number',
                          labelStyle: const TextStyle(
                            color: Color(0xFF5A7867), // label color
                          ),
                          border: OutlineInputBorder(
                            gapPadding: 20,
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(
                              color: Color(0xFF5A7867),
                            ), // border color
                          ),
                          focusedBorder: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            borderSide: BorderSide(
                              color: Color(0xFF5A7867),
                            ), // focused border color
                          ),
                        ),
                      ),
                SizedBox(height: 25),
                Theme.of(context).brightness == Brightness.dark
                    ? TextFormField(
                        onChanged: (val) => controller.password.value = val,
                        obscureText: true,
                        decoration: InputDecoration(
                          labelText: 'Password',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      )
                    : TextFormField(
                        onChanged: (val) => controller.password.value = val,
                        style: const TextStyle(
                          color: Color(
                            0xFF5A7867,
                          ), // typed text color in light mode
                        ),
                        obscureText: true,
                        decoration: InputDecoration(
                          labelText: 'Password',
                          labelStyle: const TextStyle(
                            color: Color(0xFF5A7867), // label color
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(
                              color: Color(0xFF5A7867),
                            ), // border color
                          ),
                          focusedBorder: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            borderSide: BorderSide(
                              color: Color(0xFF5A7867),
                            ), // focused border color
                          ),
                        ),
                      ),
                SizedBox(height: 15),
                Theme.of(context).brightness == Brightness.dark
                    ? TextFormField(
                        obscureText: true,
                        decoration: InputDecoration(
                          labelText: 'Confirm Password',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      )
                    : TextFormField(
                        style: const TextStyle(
                          color: Color(0xFF5A7867), // typed text color
                        ),
                        obscureText: true,
                        decoration: InputDecoration(
                          labelText: 'Confirm Password',
                          labelStyle: const TextStyle(
                            color: Color(0xFF5A7867), // label color
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(
                              color: Color(0xFF5A7867),
                            ), // border color
                          ),
                          focusedBorder: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            borderSide: BorderSide(
                              color: Color(0xFF5A7867),
                            ), // focused border color
                          ),
                        ),
                      ),
                SizedBox(height: 15),
                DatePickerRow(
                  onDateSelected: (date) =>
                      controller.selectedDate.value = date,
                ),
                SizedBox(height: 15),
                Center(
                  child: Obx(() {
                    // Build the list of allowed roles
                    final allowedRoles = Role.values
                        .where((r) => r != Role.admin)
                        .toList();

                    return DropdownButton<Role>(
                      underline: Container(
                        height: 1,
                        color: Theme.of(context).brightness == Brightness.light
                            ? Colors.black
                            : Colors.grey,
                      ),
                      value: allowedRoles.contains(controller.role.value)
                          ? controller.role.value
                          : null,
                      items: allowedRoles.map((role) {
                        return DropdownMenuItem<Role>(
                          value: role,
                          child: Text(
                            role.name,
                            style: TextStyle(
                              color:
                                  Theme.of(context).brightness ==
                                      Brightness.light
                                  ? Colors.black
                                  : Colors.white,
                            ),
                          ),
                        );
                      }).toList(),
                      onChanged: (val) {
                        if (val != null) controller.role.value = val;
                      },
                      hint: Text(
                        "Role",
                        style: TextStyle(
                          color:
                              Theme.of(context).brightness == Brightness.light
                              ? Colors.black
                              : Colors.white,
                        ),
                      ),
                      iconEnabledColor:
                          Theme.of(context).brightness == Brightness.light
                          ? Colors.black
                          : Colors.white,
                    );
                  }),
                ),

                SizedBox(height: 15),

                SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      imagePickerButton(
                        label: "Personal image",
                        image: controller.personalImage,
                        onPressed: () =>
                            controller.pickImage(true, ImageSource.camera),
                      ),
                      imagePickerButton(
                        label: "ID image",
                        image: controller.idImage,
                        onPressed: () =>
                            controller.pickImage(false, ImageSource.gallery),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 15),
                ElevatedButton(
                  onPressed: () {
                    //controller.submit();
                    print("First name: ${controller.firstName.value}");
                    print("Last name: ${controller.lastName.value}");
                    print("Phone number: ${controller.phoneNumber.value}");
                    print("Password: ${controller.password.value}");
                    print("Date: ${controller.selectedDate.value}");
                    print("Role: ${controller.role.value}");
                    print(
                      "Personal image path: ${controller.personalImage.value!.path}",
                    );
                    print("ID image path: ${controller.idImage.value!.path}");
                    Get.offAll(() => LoginScreen());
                  },
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(double.infinity, 75),
                    maximumSize: Size(double.infinity, 100),
                    padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Text('Create Account', style: TextStyle(fontSize: 18)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
