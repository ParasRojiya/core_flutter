import 'dart:io';

class companyDetails {
  static File? companyLogo;
  static String? companyName;
  static String? companyEmail;
  static String? companyContact;
  static String? companyAddressLine1;
  static String? companyAddressLine2;
  static String? companyAddressLine3;
  static int? selectedGST;
}

class customerDetails {
  late final String? customerName;
  late final String? customerEmail;
  late final String? customerContact;
  late final String? customerAddressLine1;
  late final String? customerAddressLine2;
  late final String? customerAddressLine3;

  customerDetails({
    this.customerName,
    this.customerEmail,
    this.customerContact,
    this.customerAddressLine1,
    this.customerAddressLine2,
    this.customerAddressLine3,
  });
}

List customerList = [];

class productDetails {
  final String? productName;
  final int? productPrice;
  int? productQuantity;

  productDetails(
      {required this.productName,
      required this.productPrice,
      required this.productQuantity});
}

List productList = [];

class invoiceDetails {
  static int? invoiceNumber;
  static String? invoiceDateOfIssue;
  static String? invoiceDueDate;
}
