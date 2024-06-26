import 'package:flutter/material.dart';
import 'package:mayclass/src/config/utils/constant/color.dart';
import 'package:mayclass/src/config/utils/styles/text.dart';
import 'package:mayclass/src/config/utils/styles/textfield.dart';
import 'package:mayclass/src/core/network/register_service/register_service.dart';
import 'package:mayclass/src/features/presentation/primary_screen/login_screen/screen/login_screen.dart';
import 'package:mayclass/src/features/presentation/secondary_screen/home_screen/home_screen.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});

  final _formKey = GlobalKey<FormState>();
  // final TextEditingController _fullnameController = TextEditingController();
  // final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _mobilenumberController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
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
                CustomSubHeading(text: 'REGISTER',),
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
                Row(
                  children: [
                    MaterialButton(
                      color: appbarcolor,
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          RegisterService().registerEmp(
                              mobile: _mobilenumberController.text,
                              password: _passwordController.text,
                              context: context
                          );
                        }
                      },
                      child: Text("Register"),
                    ),
                    MaterialButton(onPressed: (){
                      Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => LoginScreen()
                          )
                      );
                    },child: Text("login"),)
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
