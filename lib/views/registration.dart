import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:pharmasea/routes/Approute.dart';
import '../controllers/RegistrationController.dart';

class RegistrationPage extends StatelessWidget {
  final Registrationcontroller controller = Get.put(Registrationcontroller());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Register',
          style: TextStyle(
            fontFamily: 'Pacifico',
            fontSize: 24,
            
          ),
        ),
        centerTitle: true,
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
                        'img/pharma.png',
                        ),
                        SizedBox(height: 20,),
                        TextField(
                          controller: controller.name,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Name',
                          ),
                        ),
                        SizedBox(height: 10),
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
                        SizedBox(height: 10),
                        TextField(
                          controller: controller.phoneNumber,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Phone Number',
                          ),
                          keyboardType: TextInputType.phone,
                          inputFormatters: <TextInputFormatter>[
                            FilteringTextInputFormatter.digitsOnly,
                          ],
                        ),
                        SizedBox(height: 20),
                        ElevatedButton(
                          onPressed: () {
                            _validateAndSubmit();
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
                            'Sign Up',
                            style: TextStyle(fontSize: 18),
                          ),
                        ),
                        SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text("Already have an account?"),
                            SizedBox(width: 8),
                            TextButton(
                              onPressed: () {
                                // Navigate to login
                                Get.toNamed(Approute.login);
                              },
                              child: Text(
                                'Login',
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
  void _validateAndSubmit() {
    String? nameError;
    String? emailError;
    String? passwordError;
    String? phoneError;

    if (controller.name.text.isEmpty) {
      nameError = 'Please enter your name';
    }

    if (controller.email.text.isEmpty) {
      emailError = 'Please enter your email';
    } else if (!GetUtils.isEmail(controller.email.text)) {
      emailError = 'Please enter a valid email';
    }

    if (controller.password.text.isEmpty) {
      passwordError = 'Please enter your password';
    } else if (controller.password.text.length < 6) {
      passwordError = 'Password must be at least 6 characters';
    }

    if (controller.phoneNumber.text.isEmpty) {
      phoneError = 'Please enter your phone number';
    } else if (controller.phoneNumber.text.length < 8) {
      phoneError = 'Phone number must be at least 8 digits';
    }

    if (nameError == null && emailError == null && passwordError == null && phoneError == null) {
      // If all fields are valid, proceed with the registration
      print('Registration successful');
      // Here you can trigger the actual registration logic, such as API calls.
    } else {
      // If any field has an error, display it using dialogs, snackbars, or other UI elements
      if (nameError != null) {
        Get.snackbar('Name Error', nameError,
         backgroundColor: Colors.red,
          colorText: Colors.white,);
      }
      if (emailError != null) {
        Get.snackbar('Email Error', emailError,
         backgroundColor: Colors.red,
          colorText: Colors.white,);
      }
      if (passwordError != null) {
        Get.snackbar('Password Error', passwordError,
         backgroundColor: Colors.red,
          colorText: Colors.white,);
      }
      if (phoneError != null) {
        Get.snackbar('Phone Error', phoneError,
         backgroundColor: Colors.red,
          colorText: Colors.white,);
      }
    }
  }
}
