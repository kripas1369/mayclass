import 'package:flutter/material.dart';
import 'package:mayclass/src/config/utils/constant/color.dart';
import 'package:mayclass/src/config/utils/styles/text.dart';
import 'package:mayclass/src/config/utils/styles/textfield.dart';
import 'package:mayclass/src/core/network/login_service/login_service.dart';
import 'package:mayclass/src/core/network/register_service/register_service.dart';
import 'package:mayclass/src/features/presentation/secondary_screen/home_screen/home_screen.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final _formKey = GlobalKey<FormState>();
  // final TextEditingController _fullnameController = TextEditingController();
  // final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _mobilenumberController = TextEditingController(text: "9860486269");
  final TextEditingController _passwordController = TextEditingController(text: "Admin1234");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appbarcolor,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomHeading(text: 'Our new app',),
                CustomSubHeading(text: 'Login',),
                SizedBox(height: 30),
                Text("Fullname"),
                TextFormField(
                  maxLength: 10,
                  controller: _mobilenumberController,
                  decoration: customprefixDecoration("fullname", Icon(Icons.drive_file_rename_outline)),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your mobile number';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 30),
                Text("Password"),
                TextFormField(
                  controller: _passwordController,
                  decoration: customprefixDecoration("password", Icon(Icons.lock)),
                  obscureText: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your password';
                    }
                    // else if (value.length < 6) {
                    //   return 'Password must be at least 6 characters long';
                    // }
                    return null;
                  },
                ),
                SizedBox(height: 30),
                MaterialButton(
                  color: appbarcolor,
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      // RegisterService().registerEmp(
                      //     mobile: _mobilenumberController.text,
                      //     password: _passwordController.text,
                      //     context: context
                      // );
                      LoginService().loginUser(
                          mobile: _mobilenumberController.text,
                          password: _passwordController.text,
                          context: context);}
                  },
                  child: Text("Login"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
