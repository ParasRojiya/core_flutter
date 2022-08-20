import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Red & White",
            style: TextStyle(
              letterSpacing: 2,
              fontSize: 25,
            ),
          ),
          centerTitle: true,
          backgroundColor: Colors.redAccent,
        ),
        body: Center(
          child: RichText(
            //textAlign: TextAlign.center,
            text: const TextSpan(
              text: "           G",
              style: TextStyle(
                color: Colors.green,
                fontSize: 32,
                letterSpacing: 3,
              ),
              children: ([
                TextSpan(
                  text: "R",
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextSpan(
                  text: "APHICS",
                  style: TextStyle(
                    color: Colors.green,
                  ),
                ),
                TextSpan(
                  text: "\n    FLUTT",
                  style: TextStyle(
                    color: Colors.blue,
                    letterSpacing: 2,
                  ),
                ),
                TextSpan(
                  text: "E",
                  style: TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                    fontSize: 36,
                  ),
                ),
                TextSpan(
                  text: "R",
                  style: TextStyle(
                    color: Colors.blue,
                  ),
                ),
                TextSpan(
                  text: "\n        AN",
                  style: TextStyle(
                    color: Colors.green,
                    letterSpacing: 3.5,
                  ),
                ),
                TextSpan(
                  text: "D",
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextSpan(
                  text: "ROID",
                  style: TextStyle(
                    color: Colors.green,
                  ),
                ),
                TextSpan(
                  text: "\nDESIGN ",
                  style: TextStyle(
                    color: Colors.orange,
                  ),
                ),
                TextSpan(
                  text: "&",
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextSpan(
                  text: " DEVELOP",
                  style: TextStyle(
                    color: Colors.orange,
                  ),
                ),
                TextSpan(
                  text: "\n              W",
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                    letterSpacing: .9,
                  ),
                ),
                TextSpan(
                  text: "EB",
                  style: TextStyle(
                    color: Colors.blue,
                    letterSpacing: 4,
                  ),
                ),
                TextSpan(
                  text: "\n      FAS",
                  style: TextStyle(
                    color: Colors.amber,
                    letterSpacing: 4,
                  ),
                ),
                TextSpan(
                  text: "H",
                  style: TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                    fontSize: 36,
                  ),
                ),
                TextSpan(
                  text: "ION",
                  style: TextStyle(
                    color: Colors.amber,
                  ),
                ),
                TextSpan(
                  text: "\n ANIMAT",
                  style: TextStyle(
                    color: Colors.lightGreen,
                  ),
                ),
                TextSpan(
                  text: "I",
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextSpan(
                  text: "ON",
                  style: TextStyle(
                    color: Colors.lightGreen,
                  ),
                ),
                TextSpan(
                  text: "\n            I",
                  style: TextStyle(
                    color: Colors.blue,
                  ),
                ),
                TextSpan(
                  text: "T",
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextSpan(
                  text: "A-CS+",
                  style: TextStyle(
                    color: Colors.blue,
                  ),
                ),
                TextSpan(
                  text: "\n      GAM",
                  style: TextStyle(
                    color: Colors.orangeAccent,
                  ),
                ),
                TextSpan(
                  text: "E",
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ]),
            ),
          ),
        ),
        backgroundColor: Colors.black,
      ),
    ),
  );
}
