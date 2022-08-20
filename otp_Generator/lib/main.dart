import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(
    const OTP_Generator(),
  );
}

class OTP_Generator extends StatefulWidget {
  const OTP_Generator({Key? key}) : super(key: key);

  @override
  State<OTP_Generator> createState() => _OTP_GeneratorState();
}

class _OTP_GeneratorState extends State<OTP_Generator> {
  TextEditingController otp = TextEditingController();
  int OTP = 0;
  int OTPlength = 0;

  Random RandomOTP = Random();
  List list = [];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          color: const Color(0xff15172B),
          width: double.infinity,
          height: double.infinity,
          child: Column(
            children: [
              const Spacer(flex: 1),
              const Text(
                "OTP Generator",
                style: TextStyle(
                  fontSize: 30,
                  color: Color(0xffF6DB87),
                ),
              ),
              const Spacer(flex: 2),
              Container(
                margin: const EdgeInsets.only(left: 70, right: 70),
                child: TextField(
                  controller: otp,
                  style: const TextStyle(
                    color: Color(0xffFCF6BA),
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                  onChanged: (txt) {
                    setState(() {
                      OTPlength = int.parse(txt);
                    });
                  },
                  decoration: const InputDecoration(
                    hintText: "Enter OTP Length",
                    hintStyle: TextStyle(color: Colors.white24),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0xffFCF6BA),
                        width: 1.5,
                      ),
                    ),
                  ),
                ),
              ),
              const Spacer(flex: 3),
              InkWell(
                onTap: () {
                  setState(() {
                    for (int i = 1; i <= OTPlength; i++) {
                      OTP = RandomOTP.nextInt(9);
                      list.add(OTP);
                    }
                  });
                },
                child: Container(
                  alignment: Alignment.center,
                  height: 45,
                  width: 260,
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [
                        Color(0xffFFE8B8),
                        Color(0xffF6DB87),
                      ],
                    ),
                    boxShadow: const <BoxShadow>[
                      BoxShadow(
                        color: Color(0xffFCF6BA),
                        offset: Offset(0, 2),
                        spreadRadius: 1,
                        blurRadius: 1,
                      ),
                    ],
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Text(
                    "Generate OTP",
                    style: TextStyle(
                      color: Color(0xff15172B),
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              const Spacer(flex: 2),
              Container(
                alignment: Alignment.center,
                margin: const EdgeInsets.only(left: 18, right: 18),
                width: double.infinity,
                height: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: const Color(0xffFCF6BA),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: list.map((e) {
                    return Container(
                      alignment: Alignment.center,
                      child: Text(
                        "$e",
                        style: const TextStyle(
                          letterSpacing: 20,
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Color(0xff15172B),
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
              const Spacer(flex: 2),
              InkWell(
                onTap: () {
                  setState(() {
                    otp.clear();
                    list.clear();
                  });
                },
                child: Container(
                  height: 35,
                  width: 140,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    gradient: const LinearGradient(
                      colors: [
                        Color(0xffFFE8B8),
                        Color(0xffF6DB87),
                      ],
                    ),
                    boxShadow: const <BoxShadow>[
                      BoxShadow(
                        color: Color(0xffFCF6BA),
                        offset: Offset(0, 2),
                        spreadRadius: 1,
                        blurRadius: 3,
                      ),
                    ],
                  ),
                  child: const Text(
                    "Reset",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              const Spacer(flex: 2),
            ],
          ),
        ),
      ),
    );
  }
}
