import 'package:flutter/material.dart';
import 'package:invoice_generator_11/screens/companydetails.dart';
import 'package:invoice_generator_11/screens/customerdetails.dart';
import 'package:invoice_generator_11/screens/invoicedetails.dart';
import 'package:invoice_generator_11/screens/productsdetails.dart';
import 'package:invoice_generator_11/screens/productslist.dart';

import 'screens/invoice.dart';
import 'screens/homescreen.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => const HomePage(),
        'companydetails': (context) => const CompanyDetails(),
        'customerdetails': (context) => const CustomerDetails(),
        'productdetails': (context) => const ProductDetails(),
        'productlist': (context) => const ProductList(),
        'invoicedetails': (context) => const InvoiceDetails(),
        'invoice': (context) => const Invoice(),
      },
    ),
  );
}
