import 'package:flutter/material.dart';

void main() {
  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BMI_CALC(),
    ),
  );
}

class BMI_CALC extends StatefulWidget {
  const BMI_CALC({Key? key}) : super(key: key);

  @override
  State<BMI_CALC> createState() => _BMI_CALCState();
}

class _BMI_CALCState extends State<BMI_CALC> {
  int slider_Val = 100;
  int _weight = 50;
  int _age = 20;
  int _malecolor = 0;
  int _femalecolor = 0;
  int _weightadd = 0;
  int _weightremove = 0;
  int _ageadd = 0;
  int _ageremove = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff090E21),
      appBar: AppBar(
        title: const Text(
          "BMI Calculator",
          style: TextStyle(
            fontSize: 30,
          ),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: const Color(0xff090E21),
      ),
      body: Column(
        children: [
          Row(
            children: [
              const Spacer(flex: 1),
              InkWell(
                onTap: () {
                  setState(() {
                    _femalecolor = 1;
                    _malecolor = 0;
                  });
                },
                child: Ink(
                  child: Container(
                    height: 170,
                    width: 170,
                    decoration: BoxDecoration(
                      color: (_femalecolor == 0)
                          ? const Color(0xff1D1E33)
                          : const Color(0xff3B3C4D),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.female,
                          size: 130,
                          color:
                              (_femalecolor == 0) ? Colors.white : Colors.red,
                        ),
                        Text(
                          "Female",
                          style: TextStyle(
                            color:
                                (_femalecolor == 0) ? Colors.white : Colors.red,
                            fontSize: 25,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              const Spacer(flex: 1),
              InkWell(
                onTap: () {
                  setState(() {
                    _malecolor = 1;
                    _femalecolor = 0;
                  });
                },
                child: Ink(
                  child: Container(
                    height: 170,
                    width: 170,
                    decoration: BoxDecoration(
                      color: (_malecolor == 0)
                          ? const Color(0xff1D1E33)
                          : const Color(0xff3B3C4D),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.male,
                          size: 130,
                          color: (_malecolor == 0) ? Colors.white : Colors.red,
                        ),
                        Text(
                          "Male",
                          style: TextStyle(
                            color:
                                (_malecolor == 0) ? Colors.white : Colors.red,
                            fontSize: 25,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const Spacer(flex: 1),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 170,
                width: 390,
                decoration: BoxDecoration(
                  color: const Color(0xff1D1E33),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Spacer(flex: 2),
                    Text(
                      "HEIGHT",
                      style: TextStyle(
                        color: Color(0xff626473),
                      ),
                    ),
                    const Spacer(flex: 2),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '$slider_Val',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 52,
                          ),
                        ),
                        Container(
                          height: 100,
                          alignment: Alignment(0, 0.2),
                          child: Text(
                            "cm",
                            style: TextStyle(
                              color: Colors.white24,
                              fontSize: 20,
                            ),
                          ),
                        )
                      ],
                    ),
                    const Spacer(flex: 1),
                    Slider(
                      value: slider_Val.toDouble(),
                      onChanged: (val) {
                        setState(() {
                          slider_Val = val.toInt();
                        });
                      },
                      min: 100,
                      max: 300,
                      thumbColor: const Color(0xffeb1555),
                      activeColor: const Color(0xfff5c1d1),
                      inactiveColor: const Color(0xff555555),
                    ),
                    const Spacer(flex: 1),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              const Spacer(flex: 1),
              Container(
                height: 170,
                width: 170,
                decoration: BoxDecoration(
                  color: Color(0xff1D1E33),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Weight',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      '$_weight',
                      style: const TextStyle(fontSize: 40, color: Colors.white),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        const Spacer(flex: 2),
                        InkWell(
                          onTap: () {
                            setState(() {
                              _weight--;
                              _weightremove = 1;
                              _weightadd = 0;
                            });
                          },
                          child: Ink(
                            child: Container(
                              height: 35,
                              width: 35,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: (_weightremove == 0)
                                    ? Color(0xff4C4F5E)
                                    : Color(0xff6E6F7A),
                              ),
                              alignment: Alignment.center,
                              child: Icon(
                                Icons.remove,
                                color: (_weightremove == 0)
                                    ? Colors.white
                                    : const Color(0xffF67FA4),
                              ),
                            ),
                          ),
                        ),
                        const Spacer(flex: 1),
                        InkWell(
                          onTap: () {
                            setState(() {
                              _weight++;
                              _weightremove = 0;
                              _weightadd = 1;
                            });
                          },
                          child: Ink(
                            child: Container(
                              height: 35,
                              width: 35,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: (_weightadd == 1)
                                    ? Color(0xff6E6F7A)
                                    : Color(0xff4C4F5E),
                              ),
                              alignment: Alignment.center,
                              child: Icon(Icons.add,
                                  color: (_weightadd == 1)
                                      ? const Color(0xffF67FA4)
                                      : Colors.white),
                            ),
                          ),
                        ),
                        const Spacer(flex: 2),
                      ],
                    ),
                  ],
                ),
              ),
              const Spacer(flex: 1),
              Container(
                height: 170,
                width: 170,
                decoration: BoxDecoration(
                  color: Color(0xff1D1E33),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Age',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      '$_age',
                      style: const TextStyle(fontSize: 40, color: Colors.white),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        const Spacer(flex: 2),
                        InkWell(
                          onTap: () {
                            setState(() {
                              _age--;
                              _ageremove = 1;
                              _ageadd = 0;
                            });
                          },
                          child: Ink(
                            child: Container(
                              height: 35,
                              width: 35,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: (_ageremove == 0)
                                    ? Color(0xff4C4F5E)
                                    : Color(0xff6E6F7A),
                              ),
                              alignment: Alignment.center,
                              child: Icon(
                                Icons.remove,
                                color: (_ageremove == 0)
                                    ? Colors.white
                                    : const Color(0xffF67FA4),
                              ),
                            ),
                          ),
                        ),
                        const Spacer(flex: 1),
                        InkWell(
                          onTap: () {
                            setState(() {
                              _age++;
                              _ageremove = 0;
                              _ageadd = 1;
                            });
                          },
                          child: Ink(
                            child: Container(
                              height: 35,
                              width: 35,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: (_ageadd == 0)
                                    ? Color(0xff4C4F5E)
                                    : Color(0xff6E6F7A),
                              ),
                              alignment: Alignment.center,
                              child: Icon(
                                Icons.add,
                                color: (_ageadd == 0)
                                    ? Colors.white
                                    : const Color(0xffF67FA4),
                              ),
                            ),
                          ),
                        ),
                        const Spacer(flex: 2),
                      ],
                    ),
                  ],
                ),
              ),
              const Spacer(flex: 1),
            ],
          ),
          const SizedBox(height: 12),
          InkWell(
            onTap: () {},
            child: Ink(
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 50,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(26),
                ),
                child: const Text(
                  "Calculate",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 35,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
