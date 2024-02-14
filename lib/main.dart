import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _status = '';

  Future<void> _fetchData() async {
    try {
      final response =
          await http.get(Uri.parse('https://sandbox.paratim.com/dealer'));
      setState(() {
        _status =
            'Status Code: ${response.statusCode} ${response.request?.method} ';
      });
    } catch (error) {
      setState(() {
        _status = 'Error: $error ';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('HTTP Request Example'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ElevatedButton(
                onPressed: _fetchData,
                child: Text('Make Request'),
              ),
              SizedBox(height: 20),
              Text(
                _status,
                style: TextStyle(fontSize: 18),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
