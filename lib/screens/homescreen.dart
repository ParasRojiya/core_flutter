import 'dart:io';

import 'package:flutter/material.dart';

import '../modals/invoice.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:invoice_generator_11/modals/modals.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Invoice Generator"),
        centerTitle: true,
      ),
      body: Container(
        height: _height,
        width: _width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
              flex: 10,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed('companydetails');
                    },
                    style: ElevatedButton.styleFrom(
                      maximumSize: const Size(150, 60),
                      minimumSize: const Size(140, 50),
                    ),
                    child: const Text("Company Details"),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed('customerdetails');
                    },
                    style: ElevatedButton.styleFrom(
                      maximumSize: const Size(150, 60),
                      minimumSize: const Size(140, 50),
                    ),
                    child: const Text("Customer Details"),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed('productdetails');
                    },
                    style: ElevatedButton.styleFrom(
                      maximumSize: const Size(150, 60),
                      minimumSize: const Size(140, 50),
                    ),
                    child: const Text("Products"),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed('invoicedetails');
                    },
                    style: ElevatedButton.styleFrom(
                      maximumSize: const Size(150, 60),
                      minimumSize: const Size(140, 50),
                    ),
                    child: const Text("Invoice Details"),
                  ),
                ],
              ),
            ),
            Expanded(
                flex: 1,
                child: InkWell(
                  onTap: () async {
                    if (companyDetails.companyLogo?.path != null) {
                      Navigator.of(context).pushNamed('invoice');
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text(
                              "Please add Company Logo Before Generating Invoice"),
                          behavior: SnackBarBehavior.floating,
                        ),
                      );
                    }
                  },
                  child: Container(
                    color: Colors.blue,
                    alignment: Alignment.center,
                    child: const Text(
                      "Get Invoice",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
