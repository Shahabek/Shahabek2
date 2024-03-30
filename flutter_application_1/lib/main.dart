import 'dart:async';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/main1.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Main0(),
    ),
  );
}

class Main0 extends StatefulWidget {
  const Main0({Key? key}) : super(key: key);

  @override
  State<Main0> createState() => _Main0State();
}

class _Main0State extends State<Main0> {
  Container Shahabek = Container(height: 100);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/round.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
              child: Container(
                height: 650,
                width: 500,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(50),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: 25, left: 25),
                          child: CircleAvatar(
                            radius: 20,
                            backgroundColor: Colors.green,
                            child: Icon(Icons.check,
                                size: 20, color: Colors.white),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 30, left: 10),
                          child: Text(
                            'Bato',
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.green,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 40),
                    Center(
                      child: Image(
                          height: 250,
                          width: double.infinity,
                          image: AssetImage('Images/yomon.gif'),
                          fit: BoxFit.cover),
                    ),
                    SizedBox(height: 15),
                    Center(
                      child: Text(
                        'Hello!',
                        style: TextStyle(
                          fontSize: 40,
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'welcome to our application, best place',
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    Center(
                      child: Text(
                        'to manage your schedule',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    SizedBox(height: 65),
                    IconButton(
                      onPressed: () {
                        Future.delayed(Duration(seconds: 5), () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => MainScreen(),
                            ),
                          );
                        });
                        Shahabek = Container(
                          height: 100,
                          child: Center(
                            child:
                                SpinKitRing(color: Colors.black, lineWidth: 4),
                          ),
                        );
                      },
                      icon: Container(
                        height: 50,
                        width: 500,
                        decoration: BoxDecoration(
                          color: Colors.blue[900],
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: Center(
                          child: Text(
                            'Next',
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
