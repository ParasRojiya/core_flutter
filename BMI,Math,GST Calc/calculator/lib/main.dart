import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Math_Calc(),
  ));
}

class Math_Calc extends StatefulWidget {
  const Math_Calc({Key? key}) : super(key: key);

  @override
  State<Math_Calc> createState() => _Math_CalcState();
}

class _Math_CalcState extends State<Math_Calc> {
  List buttonList1 = [7, 8, 9, "*"];
  List buttonList2 = [4, 5, 6, "-"];
  List buttonList3 = [1, 2, 3, "+"];
  List buttonList4 = ["00", 0, "."];

  dynamic input1;
  dynamic input2;
  String? operation;
  dynamic total = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color(0xff2e2d32),
      ),
      backgroundColor: const Color(0xff2e2d32),
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.all(8),
          child: Column(
            children: [
              Expanded(
                flex: 2,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          (input1 == null &&
                                  input2 == null &&
                                  operation == null)
                              ? ""
                              : (input1 != null &&
                                      operation == null &&
                                      input2 == null)
                                  ? "$input1"
                                  : (input1 != null &&
                                          operation != null &&
                                          input2 == null)
                                      ? "$input1 $operation"
                                      : (input1 != null &&
                                              operation != null &&
                                              input2 != null)
                                          ? "$input1 $operation $input2"
                                          : "",
                          style: const TextStyle(
                              color: Colors.white30, fontSize: 22),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Text(
                      "${total}",
                      style: const TextStyle(color: Colors.white, fontSize: 70),
                    )
                  ],
                ),
              ),
              Expanded(
                flex: 4,
                child: Column(
                  children: [
                    const Divider(
                      color: Colors.grey,
                      thickness: 1,
                      indent: 26,
                      endIndent: 26,
                    ),
                    const SizedBox(height: 15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        InkWell(
                          onTap: () {
                            setState(() {
                              input1 = null;
                              input2 = null;
                              operation = null;
                              total = 0;
                            });
                          },
                          child: Container(
                            height: 60,
                            width: 130,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: const Color(0xffff5a66),
                              borderRadius: BorderRadius.circular(35),
                            ),
                            child: const Text(
                              "AC",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 24),
                            ),
                          ),
                        ),
                        TextButton(
                            onPressed: () {
                              setState(() {
                                operation = "%";
                              });
                            },
                            style: TextButton.styleFrom(
                                primary: Colors.white54,
                                textStyle: const TextStyle(fontSize: 30)),
                            child: const Text("%")),
                        TextButton(
                            onPressed: () {
                              setState(() {
                                operation = "/";
                              });
                            },
                            style: TextButton.styleFrom(
                                primary: const Color(0xffff5a66),
                                textStyle: const TextStyle(fontSize: 30)),
                            child: const Text("/"))
                      ],
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: buttonList1.map((e) {
                        return TextButton(
                            onPressed: () {
                              setState(() {
                                buttonList1Logic(e: e);
                              });
                            },
                            style: TextButton.styleFrom(
                                primary: (e == "*")
                                    ? const Color(0xffff5a66)
                                    : Colors.white,
                                textStyle: const TextStyle(fontSize: 30)),
                            child: Text("$e"));
                      }).toList(),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: buttonList2.map((e) {
                        return TextButton(
                            onPressed: () {
                              setState(() {
                                buttonList2Logic(e: e);
                              });
                            },
                            style: TextButton.styleFrom(
                                primary: (e == "-")
                                    ? const Color(0xffff5a66)
                                    : Colors.white,
                                textStyle: const TextStyle(fontSize: 30)),
                            child: Text("$e"));
                      }).toList(),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: buttonList3.map((e) {
                        return TextButton(
                            onPressed: () {
                              setState(() {
                                buttonList3Logic(e: e);
                              });
                            },
                            style: TextButton.styleFrom(
                                primary: (e == "+")
                                    ? const Color(0xffff5a66)
                                    : Colors.white,
                                textStyle: const TextStyle(fontSize: 30)),
                            child: Text("$e"));
                      }).toList(),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ...buttonList4.map((e) {
                          return TextButton(
                              onPressed: () {
                                setState(() {
                                  buttonList4Logic(e: e);
                                });
                              },
                              style: TextButton.styleFrom(
                                  primary: (e == "=")
                                      ? const Color(0xffff5a66)
                                      : Colors.white,
                                  textStyle: const TextStyle(fontSize: 30)),
                              child: Text("$e"));
                        }).toList(),
                        FloatingActionButton(
                          onPressed: () {
                            setState(() {
                              if (operation == "/") {
                                total = input1 / input2;
                              } else if (operation == "*") {
                                total = input1 * input2;
                              } else if (operation == "-") {
                                total = input1 - input2;
                              } else if (operation == "+") {
                                total = input1 + input2;
                              } else if (operation == "%") {
                                total = (input1 * input2) / 100;
                              }
                            });
                          },
                          backgroundColor: const Color(0xffff5a66),
                          child: const Text(
                            "=",
                            style: TextStyle(color: Colors.white, fontSize: 22),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  buttonList1Logic({dynamic e}) {
    if (e == 7 &&
        input2 == null &&
        operation == null &&
        input1 == null &&
        total == 0) {
      input1 = 7;
    } else if (e == 8 &&
        input2 == null &&
        operation == null &&
        input1 == null &&
        total == 0) {
      input1 = 8;
    } else if (e == 9 &&
        input2 == null &&
        operation == null &&
        input1 == null &&
        total == 0) {
      input1 = 9;
    } else if (e == 7 && operation == null && input1 != null && total == 0) {
      input1 = (input1! * 10) + 7;
    } else if (e == 8 && operation == null && input1 != null && total == 0) {
      input1 = (input1! * 10) + 8;
    } else if (e == 9 && operation == null && input1 != null && total == 0) {
      input1 = (input1! * 10) + 9;
    } else if (e == "*" && input1 != null && total == 0) {
      operation = "*";
    } else if (e == 7 &&
        operation != null &&
        input1 != null &&
        input2 == null &&
        total == 0) {
      input2 = 7;
    } else if (e == 8 &&
        operation != null &&
        input1 != null &&
        input2 == null &&
        total == 0) {
      input2 = 8;
    } else if (e == 9 &&
        operation != null &&
        input1 != null &&
        input2 == null &&
        total == 0) {
      input2 = 9;
    } else if (e == 7 &&
        operation != null &&
        input1 != null &&
        input2 != null &&
        total == 0) {
      input2 = (input2! * 10) + 7;
    } else if (e == 8 &&
        operation != null &&
        input1 != null &&
        input2 != null &&
        total == 0) {
      input2 = (input2! * 10) + 8;
    } else if (e == 9 &&
        operation != null &&
        input1 != null &&
        input2 != null &&
        total == 0) {
      input2 = (input2! * 10) + 9;
    }
  }

  buttonList2Logic({dynamic e}) {
    if (e == 4 &&
        input2 == null &&
        operation == null &&
        input1 == null &&
        total == 0) {
      input1 = 4;
    } else if (e == 5 &&
        input2 == null &&
        operation == null &&
        input1 == null &&
        total == 0) {
      input1 = 5;
    } else if (e == 6 &&
        input2 == null &&
        operation == null &&
        input1 == null &&
        total == 0) {
      input1 = 6;
    } else if (e == 4 && operation == null && input1 != null && total == 0) {
      input1 = (input1! * 10) + 4;
    } else if (e == 5 && operation == null && input1 != null && total == 0) {
      input1 = (input1! * 10) + 5;
    } else if (e == 6 && operation == null && input1 != null && total == 0) {
      input1 = (input1! * 10) + 6;
    } else if (e == "-" && input1 != null && total == 0) {
      operation = "-";
    } else if (e == 4 &&
        operation != null &&
        input1 != null &&
        input2 == null &&
        total == 0) {
      input2 = 4;
    } else if (e == 5 &&
        operation != null &&
        input1 != null &&
        input2 == null &&
        total == 0) {
      input2 = 5;
    } else if (e == 6 &&
        operation != null &&
        input1 != null &&
        input2 == null &&
        total == 0) {
      input2 = 6;
    } else if (e == 4 &&
        operation != null &&
        input1 != null &&
        input2 != null &&
        total == 0) {
      input2 = (input2! * 10) + 4;
    } else if (e == 5 &&
        operation != null &&
        input1 != null &&
        input2 != null &&
        total == 0) {
      input2 = (input2! * 10) + 5;
    } else if (e == 6 &&
        operation != null &&
        input1 != null &&
        input2 != null &&
        total == 0) {
      input2 = (input2! * 10) + 6;
    }
  }

  buttonList3Logic({dynamic e}) {
    if (e == 1 &&
        input2 == null &&
        operation == null &&
        input1 == null &&
        total == 0) {
      input1 = 1;
    } else if (e == 2 &&
        input2 == null &&
        operation == null &&
        input1 == null &&
        total == 0) {
      input1 = 2;
    } else if (e == 3 &&
        input2 == null &&
        operation == null &&
        input1 == null &&
        total == 0) {
      input1 = 3;
    } else if (e == 1 && operation == null && input1 != null && total == 0) {
      input1 = (input1! * 10) + 1;
    } else if (e == 2 && operation == null && input1 != null && total == 0) {
      input1 = (input1! * 10) + 2;
    } else if (e == 3 && operation == null && input1 != null && total == 0) {
      input1 = (input1! * 10) + 3;
    } else if (e == "+" && input1 != null && total == 0) {
      operation = "+";
    } else if (e == 1 &&
        operation != null &&
        input1 != null &&
        input2 == null &&
        total == 0) {
      input2 = 1;
    } else if (e == 2 &&
        operation != null &&
        input1 != null &&
        input2 == null &&
        total == 0) {
      input2 = 2;
    } else if (e == 3 &&
        operation != null &&
        input1 != null &&
        input2 == null &&
        total == 0) {
      input2 = 3;
    } else if (e == 1 &&
        operation != null &&
        input1 != null &&
        input2 != null &&
        total == 0) {
      input2 = (input2! * 10) + 1;
    } else if (e == 2 &&
        operation != null &&
        input1 != null &&
        input2 != null &&
        total == 0) {
      input2 = (input2! * 10) + 2;
    } else if (e == 3 &&
        operation != null &&
        input1 != null &&
        input2 != null &&
        total == 0) {
      input2 = (input2! * 10) + 3;
    }
  }

  buttonList4Logic({dynamic e}) {
    if (e == 0 && input1 != null && input2 == null && total == 0) {
      input1 = input1! * 10;
    } else if (e == "00" && input1 != null && input2 == null && total == 0) {
      input1 = input1! * 100;
    } else if (e == "." && input1 != null && input2 == null && total == 0) {
      input1 = input1! * 0.10;
    } else if (e == "." && input1 != null && input2 != null && total == 0) {
      input2 = input2! * 0.10;
    } else if (e == 0 && input1 != null && input2 != null && total == 0) {
      input2 = input2! * 10;
    } else if (e == "00" && input1 != null && input2 != null && total == 0) {
      input2 = input2! * 100;
    }
  }
}
