import 'package:flutter/material.dart';

void main() {
  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: GST_Calculator(),
    ),
  );
}

class GST_Calculator extends StatefulWidget {
  const GST_Calculator({Key? key}) : super(key: key);

  @override
  State<GST_Calculator> createState() => _GST_CalculatorState();
}

class _GST_CalculatorState extends State<GST_Calculator> {
  double input = 0;
  double total = 0;
  double gst = 0;
  Color gstbox1 = const Color(0xffeeeeee);
  Color gstbox2 = const Color(0xffeeeeee);
  Color gstbox3 = const Color(0xffeeeeee);
  Color gstbox4 = const Color(0xffeeeeee);
  Color gstbox5 = const Color(0xffeeeeee);
  Color gstfont1 = Colors.black;
  Color gstfont2 = Colors.black;
  Color gstfont3 = Colors.black;
  Color gstfont4 = Colors.black;
  Color gstfont5 = Colors.black;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 25),
          child: Column(
            children: [
              Expanded(
                flex: 4,
                child: Column(
                  children: [
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      height: 40,
                      color: const Color(0xffeeeeee),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "ORIGINAL PRICE",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            "$input Rs.",
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(height: 15),
                    Container(
                      height: 100,
                      width: double.infinity,
                      alignment: Alignment.center,
                      color: const Color(0xffeeeeee),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          const Text(
                            "GST",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 25),
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: InkWell(
                                  onTap: () {
                                    setState(() {
                                      if (input != 0) {
                                        gst = 3;
                                        gstbox1 = const Color(0xffFF6B00);
                                        gstfont1 = Colors.white;

                                        total = (input * gst) / 100;
                                      }
                                    });
                                  },
                                  child: Container(
                                    alignment: Alignment.center,
                                    height: 50,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      color: gstbox1,
                                    ),
                                    child: Text(
                                      "3%",
                                      style: TextStyle(
                                          fontSize: 20,
                                          color: gstfont1,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: InkWell(
                                  onTap: () {
                                    setState(() {
                                      if (input != 0) {
                                        gst = 5;
                                        gstbox2 = const Color(0xffFF6B00);
                                        gstfont2 = Colors.white;
                                        total = (input * gst) / 100;
                                      }
                                    });
                                  },
                                  child: Container(
                                    alignment: Alignment.center,
                                    height: 50,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      color: gstbox2,
                                    ),
                                    child: Text(
                                      "5%",
                                      style: TextStyle(
                                          fontSize: 20,
                                          color: gstfont2,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: InkWell(
                                  onTap: () {
                                    setState(() {
                                      if (input != 0) {
                                        gst = 12;
                                        gstbox3 = const Color(0xffFF6B00);
                                        gstfont3 = Colors.white;
                                        total = (input * gst) / 100;
                                      }
                                    });
                                  },
                                  child: Container(
                                    alignment: Alignment.center,
                                    height: 50,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      color: gstbox3,
                                    ),
                                    child: Text(
                                      "12%",
                                      style: TextStyle(
                                          fontSize: 20,
                                          color: gstfont3,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: InkWell(
                                  onTap: () {
                                    setState(() {
                                      if (input != 0) {
                                        gst = 18;
                                        gstbox4 = const Color(0xffFF6B00);
                                        gstfont4 = Colors.white;
                                        total = (input * gst) / 100;
                                      }
                                    });
                                  },
                                  child: Container(
                                    alignment: Alignment.center,
                                    height: 50,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      color: gstbox4,
                                    ),
                                    child: Text(
                                      "18%",
                                      style: TextStyle(
                                          fontSize: 20,
                                          color: gstfont4,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: InkWell(
                                  onTap: () {
                                    setState(() {
                                      if (input != 0) {
                                        gst = 28;
                                        gstbox5 = const Color(0xffFF6B00);
                                        gstfont5 = Colors.white;
                                        total = (input * gst) / 100;
                                      }
                                    });
                                  },
                                  child: Container(
                                    alignment: Alignment.center,
                                    height: 50,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      color: gstbox5,
                                    ),
                                    child: Text(
                                      "28%",
                                      style: TextStyle(
                                          fontSize: 20,
                                          color: gstfont5,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    const SizedBox(height: 15),
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      height: 40,
                      color: const Color(0xffeeeeee),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "FINAL PRICE",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            "$total Rs.",
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(height: 15),
                    Container(
                      width: 250,
                      height: 80,
                      decoration: BoxDecoration(
                          color: const Color(0xffeeeeee),
                          borderRadius: BorderRadius.circular(15)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: const [
                          Text(
                            "CGST/SGST",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            "25",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              Expanded(
                flex: 5,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          children: [
                            Expanded(
                              child: InkWell(
                                onTap: () {
                                  setState(() {
                                    if (gst == 0) {
                                      input = (input * 10) + 7;
                                    }
                                  });
                                },
                                child: Container(
                                  alignment: Alignment.center,
                                  child: const Text(
                                    "7",
                                    style: TextStyle(
                                        fontSize: 30,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: InkWell(
                                onTap: () {
                                  setState(() {
                                    if (gst == 0) {
                                      input = (input * 10) + 4;
                                    }
                                  });
                                },
                                child: Container(
                                  alignment: Alignment.center,
                                  child: const Text(
                                    "4",
                                    style: TextStyle(
                                        fontSize: 30,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: InkWell(
                                onTap: () {
                                  setState(() {
                                    if (gst == 0) {
                                      input = (input * 10) + 1;
                                    }
                                  });
                                },
                                child: Container(
                                  alignment: Alignment.center,
                                  child: const Text(
                                    "1",
                                    style: TextStyle(
                                        fontSize: 30,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: InkWell(
                                onTap: () {
                                  setState(() {
                                    if (gst == 0) {
                                      input = (input * 100);
                                    }
                                  });
                                },
                                child: Container(
                                  alignment: Alignment.center,
                                  child: const Text(
                                    "00",
                                    style: TextStyle(
                                        fontSize: 30,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          children: [
                            Expanded(
                              child: InkWell(
                                onTap: () {
                                  setState(() {
                                    if (gst == 0) {
                                      input = (input * 10) + 8;
                                    }
                                  });
                                },
                                child: Container(
                                  alignment: Alignment.center,
                                  child: const Text(
                                    "8",
                                    style: TextStyle(
                                        fontSize: 30,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: InkWell(
                                onTap: () {
                                  setState(() {
                                    if (gst == 0) {
                                      input = (input * 10) + 5;
                                    }
                                  });
                                },
                                child: Container(
                                  alignment: Alignment.center,
                                  child: const Text(
                                    "5",
                                    style: TextStyle(
                                        fontSize: 30,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: InkWell(
                                onTap: () {
                                  setState(() {
                                    if (gst == 0) {
                                      input = (input * 10) + 2;
                                    }
                                  });
                                },
                                child: Container(
                                  alignment: Alignment.center,
                                  child: const Text(
                                    "2",
                                    style: TextStyle(
                                        fontSize: 30,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: InkWell(
                                onTap: () {
                                  setState(() {
                                    if (gst == 0) {
                                      input = (input * 10);
                                    }
                                  });
                                },
                                child: Container(
                                  alignment: Alignment.center,
                                  child: const Text(
                                    "0",
                                    style: TextStyle(
                                        fontSize: 30,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          children: [
                            Expanded(
                              child: InkWell(
                                onTap: () {
                                  setState(() {
                                    if (gst == 0) {
                                      input = (input * 10) + 9;
                                    }
                                  });
                                },
                                child: Container(
                                  alignment: Alignment.center,
                                  child: const Text(
                                    "9",
                                    style: TextStyle(
                                        fontSize: 30,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: InkWell(
                                onTap: () {
                                  setState(() {
                                    if (gst == 0) {
                                      input = (input * 10) + 6;
                                    }
                                  });
                                },
                                child: Container(
                                  alignment: Alignment.center,
                                  child: const Text(
                                    "6",
                                    style: TextStyle(
                                        fontSize: 30,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: InkWell(
                                onTap: () {
                                  setState(() {
                                    if (gst == 0) {
                                      input = (input * 10) + 3;
                                    }
                                  });
                                },
                                child: Container(
                                  alignment: Alignment.center,
                                  child: const Text(
                                    "3",
                                    style: TextStyle(
                                        fontSize: 30,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: InkWell(
                                child: Container(
                                  alignment: Alignment.center,
                                  child: const Text(
                                    ".",
                                    style: TextStyle(
                                        fontSize: 30,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          children: [
                            Expanded(
                              child: InkWell(
                                onTap: () {
                                  setState(() {
                                    input = 0;
                                    total = 0;
                                    gst = 0;
                                    gstbox1 = const Color(0xffeeeeee);
                                    gstbox2 = const Color(0xffeeeeee);
                                    gstbox3 = const Color(0xffeeeeee);
                                    gstbox4 = const Color(0xffeeeeee);
                                    gstbox5 = const Color(0xffeeeeee);
                                    gstfont1 = Colors.black;
                                    gstfont2 = Colors.black;
                                    gstfont3 = Colors.black;
                                    gstfont4 = Colors.black;
                                    gstfont5 = Colors.black;
                                  });
                                },
                                child: Container(
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                      color: const Color(0xffFF6B00),
                                      borderRadius: BorderRadius.circular(50)),
                                  child: const Text(
                                    "AC",
                                    style: TextStyle(
                                        fontSize: 30,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 15),
                            Expanded(
                              child: InkWell(
                                onTap: () {
                                  setState(() {
                                    gst = 0;
                                    gstbox1 = const Color(0xffeeeeee);
                                    gstbox2 = const Color(0xffeeeeee);
                                    gstbox3 = const Color(0xffeeeeee);
                                    gstbox4 = const Color(0xffeeeeee);
                                    gstbox5 = const Color(0xffeeeeee);
                                    gstfont1 = Colors.black;
                                    gstfont2 = Colors.black;
                                    gstfont3 = Colors.black;
                                    gstfont4 = Colors.black;
                                    gstfont5 = Colors.black;
                                  });
                                },
                                child: Container(
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                      color: const Color(0xffFF6B00),
                                      borderRadius: BorderRadius.circular(50),
                                    ),
                                    child: const Icon(
                                      Icons.backspace_outlined,
                                      size: 30,
                                      color: Colors.white,
                                    )),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
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
