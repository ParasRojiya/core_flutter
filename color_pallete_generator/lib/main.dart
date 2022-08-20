import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(
    const color_palette_generator(),
  );
}

class color_palette_generator extends StatefulWidget {
  const color_palette_generator({Key? key}) : super(key: key);

  @override
  State<color_palette_generator> createState() =>
      _color_palette_generatorState();
}

class _color_palette_generatorState extends State<color_palette_generator> {
  Color random() {
    return ColorRandom[Random().nextInt(19)];
  }

  List<Color> ColorRandom = [
    Colors.yellow,
    Colors.purpleAccent,
    Colors.indigo,
    Colors.green,
    Colors.purple,
    Colors.orange,
    Colors.lime,
    Colors.pink,
    Colors.red,
    Colors.purple,
    Colors.orange,
    Colors.lime,
    Colors.pink,
    Colors.red,
    Colors.purple,
    Colors.orange,
    Colors.lime,
    Colors.pink,
    Colors.red,
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [
              Color(0xffFFFFFF),
              Color(0xffD8E6F4),
            ], begin: Alignment.topLeft, end: Alignment.bottomRight),
          ),
          child: Column(
            children: [
              const SizedBox(height: 15),
              Container(
                alignment: Alignment.center,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      "Color Palette",
                      style: TextStyle(
                          color: Color(0xff3BB3F9),
                          fontSize: 25,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "Generator",
                      style: TextStyle(
                          color: Color(0xff3BB3F9),
                          fontSize: 25,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 25),
              Container(
                height: 70,
                width: 90,
                decoration: BoxDecoration(
                  color: random(),
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(14),
                    topRight: Radius.circular(14),
                  ),
                ),
              ),
              Container(
                height: 70,
                width: 90,
                color: random(),
              ),
              Container(
                height: 70,
                width: 90,
                color: random(),
              ),
              Container(
                height: 70,
                width: 90,
                color: random(),
              ),
              Container(
                height: 70,
                width: 90,
                color: random(),
              ),
              Container(
                height: 70,
                width: 90,
                decoration: BoxDecoration(
                  color: random(),
                  borderRadius: const BorderRadius.only(
                    bottomRight: Radius.circular(14),
                    bottomLeft: Radius.circular(14),
                  ),
                ),
              ),
              const SizedBox(height: 30),
              InkWell(
                onTap: () {
                  setState(() {
                    Random random = Random();
                  });
                },
                child: Container(
                  height: 40,
                  width: 220,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 2,
                      color: const Color(0xff3BB3F9),
                    ),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Text(
                    "Generate",
                    style: TextStyle(
                      color: Color(0xff3BB3F9),
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
