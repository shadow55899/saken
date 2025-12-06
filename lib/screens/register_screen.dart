import 'dart:io';
import 'package:apartment/controller/register_controller.dart';
import 'package:apartment/screens/login_screen.dart';
import 'package:apartment/widgets/date-picker.dart';
import 'package:apartment/widgets/image_picker_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:image_picker/image_picker.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final RegisterController controller = Get.put(RegisterController());
  bool _isVisiblePassword = true;
  bool _isVisibleCheckPassword = true;
  File? _personalImage;
  File? _idImage;
  // ignore: unused_field
  DateTime? _selectedDate;

  Future<void> _pickImage(bool isPersonal, ImageSource source) async {
    final pickedFile = await ImagePicker().pickImage(source: source);
    if (pickedFile != null) {
      setState(() {
        if (isPersonal) {
          _personalImage = File(pickedFile.path);
        } else {
          _idImage = File(pickedFile.path);
        }
      });
    }
  }

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
                SizedBox(height: 15),
                Theme.of(context).brightness == Brightness.dark
                    ? TextFormField(
                        onChanged: (val) => controller.password.value = val,
                        obscureText: _isVisiblePassword,
                        decoration: InputDecoration(
                          labelText: 'Password',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          suffixIcon: IconButton(
                            icon: Icon(
                              _isVisiblePassword
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                            ),
                            onPressed: () {
                              setState(() {
                                _isVisiblePassword = !_isVisiblePassword;
                              });
                            },
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
                        obscureText: _isVisiblePassword,
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
                          suffixIcon: IconButton(
                            icon: Icon(
                              _isVisiblePassword
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                              color: const Color(0xFF5A7867), // icon color
                            ),
                            onPressed: () {
                              setState(() {
                                _isVisiblePassword = !_isVisiblePassword;
                              });
                            },
                          ),
                        ),
                      ),
                SizedBox(height: 15),
                Theme.of(context).brightness == Brightness.dark
                    ? TextFormField(
                        obscureText: _isVisibleCheckPassword,
                        decoration: InputDecoration(
                          labelText: 'Confirm Password',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          suffixIcon: IconButton(
                            icon: Icon(
                              _isVisibleCheckPassword
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                            ),
                            onPressed: () {
                              setState(() {
                                _isVisibleCheckPassword =
                                    !_isVisibleCheckPassword;
                              });
                            },
                          ),
                        ),
                      )
                    : TextFormField(
                        style: const TextStyle(
                          color: Color(0xFF5A7867), // typed text color
                        ),
                        obscureText: _isVisiblePassword,
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
                          suffixIcon: IconButton(
                            icon: Icon(
                              _isVisiblePassword
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                              color: const Color(0xFF5A7867), // icon color
                            ),
                            onPressed: () {
                              setState(() {
                                _isVisiblePassword = !_isVisiblePassword;
                              });
                            },
                          ),
                        ),
                      ),
                SizedBox(height: 15),
                Container(
                  decoration: BoxDecoration(color: Colors.grey),
                  child: DatePickerRow(
                    onDateSelected: (date) =>
                        controller.selectedDate.value = date,
                  ),
                ),
                SizedBox(height: 15),
                SingleChildScrollView(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      imagePickerButton(
                        label: "Personal image",
                        image: _personalImage,
                        onPressed: () => _pickImage(true, ImageSource.camera),
                      ),
                      imagePickerButton(
                        label: "ID image",
                        image: _idImage,
                        onPressed: () => _pickImage(false, ImageSource.gallery),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 15),
                ElevatedButton(
                  onPressed: () {
                    //controller.submit();
                    Get.off(() => LoginScreen());
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
