import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart'; // Import dotenv for environment variables
import 'splash_screen.dart';
import 'home_page.dart';
import 'question_page.dart';

void main() async {
  // Ensure Flutter binding is initialized
  WidgetsFlutterBinding.ensureInitialized();

  // Load environment variables from the .env file located in the assets directory
  await dotenv.load(fileName: ".env");

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'EduGenie',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      initialRoute: '/', // Start with the SplashScreen
      routes: {
        '/': (context) => SplashScreen(), // SplashScreen as the initial screen
        '/home': (context) => HomePage(),
        '/question': (context) => QuestionPage(),
      },
    );
  }
}
