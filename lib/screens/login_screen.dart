// ignore_for_file: use_key_in_widget_constructors, prefer_final_fields, deprecated_member_use

import 'package:apartment/controller/login_controller.dart';
import 'package:apartment/controller/user_controller.dart';
import 'package:apartment/screens/home_screen.dart';
import 'package:apartment/screens/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/instance_manager.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final LoginController controller = Get.put(LoginController());
  final userController = Get.put(UserController());
  bool _rememberMe = false;
  bool _isVisiblePassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
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
                  'Welcome',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                ),
                Text(
                  "Log in to your account",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 30),
                ),
                SizedBox(height: 15),
                Theme.of(context).brightness == Brightness.dark
                    ? TextFormField(
                        onChanged: (value) {
                          controller.phone.value = value;
                        },
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          labelText: 'Phone number',
                          prefixIcon: Icon(Icons.phone),
                          border: OutlineInputBorder(
                            gapPadding: 20,
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      )
                    : TextFormField(
                        onChanged: (value) {
                          controller.phone.value = value;
                        },
                        keyboardType: TextInputType.number,
                        style: const TextStyle(
                          color: Color(0xFF5A7867), // typed text color
                        ),
                        decoration: InputDecoration(
                          labelText: 'Phone number',
                          labelStyle: const TextStyle(
                            color: Color(0xFF5A7867), // label colorBahaa"
                          ),
                          prefixIcon: const Icon(
                            Icons.phone,
                            color: Color(0xFF5A7867),
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
                        onChanged: (value) {
                          controller.password.value = value;
                        },
                        obscureText: _isVisiblePassword,
                        decoration: InputDecoration(
                          labelText: 'Password',
                          prefixIcon: Icon(Icons.password),
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
                        onChanged: (value) {
                          controller.password.value = value;
                        },
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
                          prefixIcon: const Icon(
                            Icons.password,
                            color: Color(0xFF5A7867),
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

                Row(
                  children: [
                    Checkbox(
                      value: _rememberMe,
                      onChanged: (bool? value) {
                        if (value != null) {
                          setState(() {
                            _rememberMe = value;
                          });
                        }
                      },
                    ),
                    Text('Remember me'),
                    Spacer(),
                  ],
                ),
                SizedBox(height: 15),
                Obx(() {
                  return userController.isLoading.value
                      ? const LinearProgressIndicator()
                      : ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            minimumSize: const Size(double.infinity, 75),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          onPressed: () {
                            userController.login(
                              controller.phone.value,
                              controller.password.value,
                            );
                          },
                          child: const Text("Login"),
                        );
                }),
                SizedBox(height: 15),
                OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    minimumSize: const Size(double.infinity, 75),
                    side: BorderSide(
                      color: Theme.of(context).brightness == Brightness.dark
                          ? Colors.white
                          : Colors.black,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    foregroundColor:
                        Theme.of(context).brightness == Brightness.dark
                        ? Colors.white
                        : Colors.black, // text color
                    overlayColor:
                        Theme.of(context).brightness == Brightness.dark
                        ? Colors.white.withOpacity(0.1)
                        : const Color(
                            0xFF5A7867,
                          ).withOpacity(0.1), // ripple color
                  ),
                  onPressed: () {
                    Get.to(() => RegisterScreen());
                  },
                  child: const Text(
                    'Create new account',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
