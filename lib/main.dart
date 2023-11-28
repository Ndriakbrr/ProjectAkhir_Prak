import 'package:flutter/material.dart';
import 'login.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:projekakhir_teori/signup_model.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter<SignupModel>(SignupModelAdapter());
  await Hive.openBox<SignupModel>("signupBox");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: LoginPage(),
    );
  }
}