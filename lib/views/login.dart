import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pharmasea/routes/Approute.dart';
import '../controllers/LoginController.dart';

class LoginPage extends StatelessWidget {
  final Logincontroller controller = Get.put(Logincontroller());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login',
        style: TextStyle(
          fontFamily: 'Pacifico',
          fontSize: 24,
        ),),
        centerTitle: true,
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
      ),
      body: OrientationBuilder(
        builder: (context, orientation) {
          return Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.blueAccent, Colors.lightBlue],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Center(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Container(
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.8),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    width: orientation == Orientation.portrait
                        ? MediaQuery.of(context).size.width * 0.85
                        : MediaQuery.of(context).size.width * 0.5,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Image.asset(
                        'img/login.png',
                        ),
                        SizedBox(height: 20,),
                        TextField(
                          controller: controller.email,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Email',
                          ),
                          keyboardType: TextInputType.emailAddress,
                        ),
                        SizedBox(height: 10),
                        Obx(() => TextField(
                          controller: controller.password,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Password',
                            suffixIcon: IconButton(
                              icon: Icon(
                                controller.obscureText.value
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                              ),
                              onPressed: controller.toggleObscureText,
                            ),
                          ),
                          obscureText: controller.obscureText.value,
                        )),
                        SizedBox(height: 20),
                        ElevatedButton(
                          onPressed: () {
                            _validateAndLogin();
                          },
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.symmetric(
                              horizontal: 50,
                              vertical: 15,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                          child: Text(
                            'Login',
                            style: TextStyle(fontSize: 18),
                          ),
                        ),
                        SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text("Don't have an account?"),
                            SizedBox(width: 8),
                            TextButton(
                              onPressed: () {
                                // Navigate to the registration page
                                Get.toNamed(Approute.registration);
                              },
                              child: Text(
                                'Register',
                                style: TextStyle(
                                  color: Colors.purple,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  // Validation function
  void _validateAndLogin() {
    String? emailError;
    String? passwordError;

    if (controller.email.text.isEmpty) {
      emailError = 'Please enter your email';
    } else if (!GetUtils.isEmail(controller.email.text)) {
      emailError = 'Please enter a valid email';
    }

    if (controller.password.text.isEmpty) {
      passwordError = 'Please enter your password';
    }

    if (emailError == null && passwordError == null) {
      Get.toNamed(Approute.home);

      // Here you can trigger the actual login logic, such as API calls.
    } else {
      // If any field has an error, display it using Get.snackbar
      if (emailError != null) {
        Get.snackbar('Email Error', emailError,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      }
      if (passwordError != null) {
        Get.snackbar('Password Error', passwordError,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      }
    }
  }
}
