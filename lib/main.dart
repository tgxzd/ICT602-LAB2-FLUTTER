import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Login Page',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _controller = TextEditingController();
  String? _errorMessage;

  void _login() {
    String input = _controller.text;

    if (input == 'root') {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => AdminLandingPage()),
      );
    } else if (RegExp(r'^[a-zA-Z]+$').hasMatch(input)) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => StaffLandingPage()),
      );
    } else {
      try {
        int number = int.parse(input);
        if (number >= 2018000000 && number <= 2024999999) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => StudentLandingPage()),
          );
        } else {
          setState(() {
            _errorMessage = "Invalid student number.";
          });
        }
      } catch (e) {
        setState(() {
          _errorMessage = "Invalid input. Please try again.";
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 68, 82, 106),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: _controller,
                style: TextStyle(color: Colors.white), // Set the text color to white
                decoration: InputDecoration(
                  hintText: 'Enter your ID',
                  hintStyle: TextStyle(color: Colors.white), // Set the hint text color to white
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(18),
                  ),
                ),
                
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _login,
                child: Text('Login'),
                style: ElevatedButton.styleFrom(
                 backgroundColor: Colors.blue,

                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
              if (_errorMessage != null) ...[
                SizedBox(height: 20),
                Text(
                  _errorMessage!,
                  style: TextStyle(color: Colors.red),
                ),
              ],
              SizedBox(height: 20),
              Text(
                'Enter your student number, staff ID, or "root" for admin access.',
                style: TextStyle(color: Colors.grey),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class StudentLandingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Student Landing Page'),
      ),
      body: Center(
        child: Text('Welcome, Student!'),
      ),
    );
  }
}

class StaffLandingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Staff Landing Page'),
      ),
      body: Center(
        child: Text('Welcome, Staff!'),
      ),
    );
  }
}

class AdminLandingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Admin Landing Page'),
      ),
      body: Center(
        child: Text('Welcome, Admin!'),
      ),
    );
  }
}
