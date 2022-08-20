import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            "🛍 List of Fruits",
            style: TextStyle(
              fontSize: 30,
            ),
          ),
          backgroundColor: Colors.teal,
          centerTitle: true,
        ),
        body: Center(
          child: RichText(
            //textAlign: TextAlign.center,
            text: const TextSpan(
              text: "🍎 Apple",
              style: TextStyle(
                color: Colors.red,
                fontWeight: FontWeight.bold,
                fontSize: 28,
                letterSpacing: 4,
              ),
              children: ([
                TextSpan(
                  text: "\n🍇 Grapes",
                  style: TextStyle(
                    color: Colors.purple,
                    fontWeight: FontWeight.bold,
                    fontSize: 28,
                    letterSpacing: 4,
                  ),
                ),
                TextSpan(
                  text: "\n🍒 Cherry",
                  style: TextStyle(
                    color: Colors.deepPurple,
                  ),
                ),
                TextSpan(
                  text: "\n🍓 Strawberry",
                  style: TextStyle(
                    color: Colors.redAccent,
                  ),
                ),
                TextSpan(
                  text: "\n🥭 Mango",
                  style: TextStyle(
                    color: Colors.orange,
                  ),
                ),
                TextSpan(
                  text: "\n🍍 Pineapple",
                  style: TextStyle(
                    color: Colors.green,
                  ),
                ),
                TextSpan(
                  text: "\n🍋 Lemon",
                  style: TextStyle(
                    color: Colors.yellow,
                  ),
                ),
                TextSpan(
                  text: "\n🍉 Watermelon",
                  style: TextStyle(
                    color: Colors.lightGreen,
                  ),
                ),
                TextSpan(
                  text: "\n🥥 Coconut",
                  style: TextStyle(
                    color: Colors.brown,
                  ),
                ),
              ]),
            ),
          ),
        ),
      ),
    ),
  );
}
