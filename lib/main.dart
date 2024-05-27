import 'package:flutter/material.dart';

import 'src/config/utils/constant/color.dart';
import 'src/features/presentation/primary_screen/register_screen/screen/register_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      home:RegisterScreen()
    );
  }
}
