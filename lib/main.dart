import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'src/features/presentation/primary_screen/register_screen/screen/register_screen.dart';


void main() {
  runApp(
      ProviderScope(
          child: MyApp()),
  );

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
