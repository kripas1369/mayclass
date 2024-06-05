import 'dart:convert';
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;
import 'package:mayclass/src/config/utils/constant/api_constant.dart';
import 'package:mayclass/src/features/presentation/secondary_screen/home_screen/home_screen.dart';

class LoginService {
  Future<void> loginUser({
    required String mobile,
    required String password,
    required context,
  })async{

    Map<String,dynamic> body ={
      "username":mobile,
      "password":password,
      "login_type":"mobile",
    };


    final response = await http.post(
        Uri.parse(ApiUrls.loginurl),
        headers: {"Content-Type":"application/json"},
        body:json.encode(body)
    );

    if(response.statusCode==200){
      Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Homepage(
            fullname: mobile,
            password: '',
          )
          )
      );
      print(response.body);

      print("****************");
      print("****************");
      print("****************");
      print("****************");
    }else{
      final snackBar = SnackBar(
        content:  Text('${response.body}'),
        action: SnackBarAction(
          label: 'Undo',
          onPressed: () {
            // Some code to undo the change.
          },
        ),
      );

      print("#######");
      print("#########");
      print("#############");
      print("###############");
      print(response.body);

      // Find the ScaffoldMessenger in the widget tree
      // and use it to show a SnackBar.
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }




  }
}