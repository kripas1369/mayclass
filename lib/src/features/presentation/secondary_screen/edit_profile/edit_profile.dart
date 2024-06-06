import 'package:flutter/material.dart';
import 'package:mayclass/src/core/network/editprofile_serive/edit_profile_service.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart'; // Import flutter_riverpod
import 'package:mayclass/src/config/utils/constant/color.dart';
import 'package:mayclass/src/config/utils/styles/text.dart';
import 'package:mayclass/src/config/utils/styles/textfield.dart';

// Providers
final nameProvider = StateProvider<String>((ref) => "");
final passwordProvider = StateProvider<String>((ref) => "");
final tokenProvider = StateProvider<String>((ref) => "");

class EditProfile extends ConsumerStatefulWidget {
  EditProfile({super.key});

  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends ConsumerState<EditProfile> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _mobilenumberController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _loadName();
  }

  Future<void> _loadName() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String name = prefs.getString("mobilenumber") ?? "";
    String password = prefs.getString("password") ?? "";
    String accesstoken = prefs.getString("access_token")??"";

    setState(() {
      _mobilenumberController.text = name;
    });

    // Update the providers
    ref.read(nameProvider.notifier).state = name;
    ref.read(tokenProvider.notifier).state=accesstoken;
    ref.read(passwordProvider.notifier).state = password;
  }

  @override
  Widget build(BuildContext context) {
    final name = ref.watch(nameProvider);
    final password = ref.watch(passwordProvider);


    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text("Edit Profile"),
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
                CustomHeading(text: 'You have to edit your profile',),
                CustomSubHeading(text: 'hello',),
                SizedBox(height: 30),
                Text("Mobile Number"),
                TextFormField(
                  maxLength: 10,
                  controller: _mobilenumberController,
                  decoration: customprefixDecoration("mobilenumber",
                      Icon(Icons.drive_file_rename_outline)),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your mobile number';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 30),
                MaterialButton(
                  color: appbarcolor,
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      // Add your update logic here
                      EditProfileService().editProfile(
                          mobile: _mobilenumberController.text,
                          context: context);
                    }
                  },
                  child: Text("edit"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
