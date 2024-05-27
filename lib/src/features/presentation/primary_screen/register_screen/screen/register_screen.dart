import 'package:flutter/material.dart';
import 'package:mayclass/src/config/utils/constant/color.dart';
import 'package:mayclass/src/config/utils/styles/text.dart';
import 'package:mayclass/src/config/utils/styles/textfield.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appbarcolor,
      ),
      body:SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomHeading(text: 'Our new app',),
              CustomSubHeading(text: 'REGISTER',),
              SizedBox(height: 30),
              Text("Fullname"),
              TextFormField(
                // textInputAction: ,
                decoration: customprefixDecoration("fullname",
                    Icon(Icons.drive_file_rename_outline))
              ),
              SizedBox(height: 30),
              Text("Password"),
              TextFormField(
                // textInputAction: ,
                decoration: customprefixDecoration("password",
                    Icon(Icons.lock))
              ),
              MaterialButton(
                color: appbarcolor,
                  onPressed: (){},
                child: Text("Register"),
              )
            ],
          ),
        ),
      )
    );
  }
}
