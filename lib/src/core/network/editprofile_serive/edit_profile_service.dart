import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;
import 'package:mayclass/src/config/utils/constant/api_constant.dart';
import 'package:mayclass/src/features/presentation/secondary_screen/home_screen/home_screen.dart';

class EditProfileService {
  Future<void> editProfile({
    required String mobile,
    required context,
  })async{

    Map<String,dynamic> body ={
      "mobile_number":mobile,
      "email":"kripas@gmail.com"
    };

    SharedPreferences pref = await SharedPreferences.getInstance();
    String accessToken = pref.getString("access_token")??"";

    final response = await http.patch(
        Uri.parse(ApiUrls.editprofile),
        headers: {
          "Content-Type":"application/json",
          "Authorization":"Bearer $accessToken"

        },
        body:json.encode(body)
    );

    if(response.statusCode==200){
      Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Homepage(

          )
          )
      );
      SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
      sharedPreferences.setString("mobilenumber", mobile);

      print("****************");
      print("****************");
      print("****************");
      print("****************");
    }else{
      final snackBar = SnackBar(
        content:  Text('some error'),
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