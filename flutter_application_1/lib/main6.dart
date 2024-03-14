import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Main6(), // main6 yerine Main6
    ),
  );
}

class Main6 extends StatefulWidget {
  const Main6({Key? key}) : super(key: key);

  @override
  State<Main6> createState() => _Main6State();
}

class _Main6State extends State<Main6> {
  final _final =
      TextStyle(fontSize: 20, color: Colors.green, fontWeight: FontWeight.w900);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          "Personal Details",
          style: TextStyle(
              fontSize: 25, color: Colors.green, fontWeight: FontWeight.w900),
        ),
      ),
      backgroundColor: Colors.black,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("", style: _final),
          Text("Shukurillo", style: _final),
          Text("Description", style: _final),
          Text("Orifov", style: _final),
          Text("Date:", style: _final),
          Text("March 14, 2024 21:00 PM", style: _final),
        ],
      ),
    );
  }
}
