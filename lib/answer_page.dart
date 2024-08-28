import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter/services.dart'; // For clipboard functionality
import 'package:share/share.dart';
// For sharing functionality (make sure to add this package)
import 'package:http/http.dart' as http; // Import http package
import 'dart:convert'; // Import for jsonEncode and jsonDecode

class AnswerPage extends StatefulWidget {
  final String question;

  AnswerPage({required this.question});

  @override
  _AnswerPageState createState() => _AnswerPageState();
}

class _AnswerPageState extends State<AnswerPage> {
  String _answer = "Generating your answer...";

  @override
  void initState() {
    super.initState();
    _fetchAnswer();
  }

  Future<void> _fetchAnswer() async {
    final apiKey =
        "qLCeqpnBAFUMbtueZPIoz6WwO57lPDd8Bq8nr9jy"; // Replace with your actual API key
    final url = "https://api.cohere.ai/v1/chat";

    final response = await http.post(
      Uri.parse(url),
      headers: {
        'Authorization': 'Bearer $apiKey',
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        'model': 'command-r-plus',
        'message': widget.question,
      }),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      setState(() {
        _answer = data['text']; // Display the response from the API
      });
    } else {
      setState(() {
        _answer = 'Error fetching answer. Please try again.';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Celebration Animation at the Top
          Lottie.asset(
            'assets/celebration_animation.json', // Path to your Lottie celebration animation
            height: 300, // Adjust height as needed
            width: 300, // Adjust width as needed
          ),
          SizedBox(height: 30),
          // Text Box in the Middle
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Container(
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Colors.grey[200], // Background color of the text box
                borderRadius: BorderRadius.circular(10.0),
                border: Border.all(color: Colors.grey[400]!, width: 1),
              ),
              child: Text(
                _answer,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                  fontFamily:
                      'Arial', // Use a monospaced font to resemble computer text
                  color: Colors.black87,
                ),
              ),
            ),
          ),
          SizedBox(height: 20),
          // Copy and Share Buttons
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                icon: Icon(Icons.copy),
                onPressed: () {
                  Clipboard.setData(ClipboardData(text: _answer));
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Copied to clipboard')),
                  );
                },
              ),
              IconButton(
                icon: Icon(Icons.share),
                onPressed: () {
                  Share.share(_answer);
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
