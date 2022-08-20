import 'dart:io';
import 'dart:typed_data';

import 'package:invoice_generator_11/modals/modals.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

final companyLogo = pw.MemoryImage(
  File(companyDetails.companyLogo!.path).readAsBytesSync(),
);

pw.TextStyle headingStyle =
    pw.TextStyle(fontSize: 18, fontWeight: pw.FontWeight.bold);

pw.TextStyle totalStyle =
    pw.TextStyle(fontSize: 15, fontWeight: pw.FontWeight.bold);

class InvoicePDF {
  static Future<Uint8List> getInvoice() async {
    final pdf = pw.Document();

    pdf.addPage(
      pw.Page(
          pageFormat: PdfPageFormat.a4,
          build: (pw.Context context) {
            return pw.Column(
              children: [
                pw.SizedBox(height: 20),
                pw.Row(
                  mainAxisAlignment: pw.MainAxisAlignment.center,
                  children: [
                    pw.Text(
                      "Tax Invoice",
                      style: pw.TextStyle(
                        fontSize: 24,
                        fontWeight: pw.FontWeight.bold,
                      ),
                    )
                  ],
                ),
                pw.Divider(
                  thickness: 1, // color: PdfColor.fromHex("black")
                ),
                pw.SizedBox(height: 20),
                pw.Row(
                  mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                  children: [
                    pw.Column(
                      crossAxisAlignment: pw.CrossAxisAlignment.start,
                      children: [
                        pw.Text(
                          "${companyDetails.companyName}",
                          style: pw.TextStyle(
                              fontSize: 22, fontWeight: pw.FontWeight.bold),
                        ),
                        pw.SizedBox(height: 8),
                        pw.Text(
                          "${companyDetails.companyEmail}",
                          style: const pw.TextStyle(
                            fontSize: 18,
                          ),
                        ),
                        pw.Text(
                          "${companyDetails.companyContact}",
                          style: const pw.TextStyle(
                            fontSize: 18,
                          ),
                        ),
                        pw.Text(
                          "${companyDetails.companyAddressLine1}",
                          style: const pw.TextStyle(
                            fontSize: 18,
                          ),
                        ),
                        pw.Text(
                          "${companyDetails.companyAddressLine2}",
                          style: const pw.TextStyle(
                            fontSize: 17,
                          ),
                        ),
                        pw.Text(
                          "${companyDetails.companyAddressLine3}",
                          style: const pw.TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ), //Company Address
                    pw.Column(
                      children: [
                        pw.Container(
                            height: 100,
                            width: 100,
                            decoration: pw.BoxDecoration(
                              borderRadius: pw.BorderRadius.circular(50),
                            ),
                            child: pw.Image(companyLogo, fit: pw.BoxFit.cover)),
                      ],
                    ), //Company Logo
                  ],
                ), //Company Address & Logo
                pw.SizedBox(height: 15),
                pw.Row(
                  mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                  children: [
                    pw.Column(
                      crossAxisAlignment: pw.CrossAxisAlignment.start,
                      children: [
                        pw.Text(
                          "Bill To",
                          style: pw.TextStyle(
                              fontSize: 16,
                              fontWeight: pw.FontWeight.bold,
                              color: PdfColors.grey),
                        ),
                        pw.SizedBox(height: 2),
                        pw.Text(
                          "${customerList[0].customerName}",
                          style: const pw.TextStyle(
                            fontSize: 19,
                          ),
                        ),
                        pw.Text(
                          "${customerList[0].customerEmail}",
                          style: const pw.TextStyle(
                            fontSize: 18,
                          ),
                        ),
                        pw.Text(
                          "${customerList[0].customerContact}",
                          style: const pw.TextStyle(
                            fontSize: 17,
                          ),
                        ),
                        pw.Text(
                          "${customerList[0].customerAddressLine1}",
                          style: const pw.TextStyle(
                            fontSize: 16,
                          ),
                        ),
                        pw.Text(
                          "${customerList[0].customerAddressLine2}",
                          style: const pw.TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ), //Customer Address
                    pw.Container(
                      height: 130,
                      child: pw.Column(
                        crossAxisAlignment: pw.CrossAxisAlignment.start,
                        mainAxisAlignment: pw.MainAxisAlignment.end,
                        children: [
                          pw.Text(
                            "Invoice No: ${invoiceDetails.invoiceNumber}",
                            style: const pw.TextStyle(
                              fontSize: 15,
                            ),
                          ),
                          pw.Text(
                            "Invoice Date:${invoiceDetails.invoiceDateOfIssue}",
                            style: const pw.TextStyle(
                              fontSize: 15,
                            ),
                          ),
                          pw.Text(
                            "Due Date: ${invoiceDetails.invoiceDueDate}",
                            style: const pw.TextStyle(
                              fontSize: 15,
                            ),
                          ),
                        ],
                      ),
                    ), //Invoice Details
                  ],
                ), //Customer & Invoice Details
                pw.SizedBox(height: 15),
                pw.Divider(
                  thickness: 1, //color: Colors.black
                ),
                pw.Container(
                  child: pw.Row(
                    mainAxisAlignment: pw.MainAxisAlignment.spaceEvenly,
                    children: [
                      pw.Text("Description", style: headingStyle),
                      pw.Text("Quantity", style: headingStyle),
                      pw.Text("Unit Price", style: headingStyle),
                      pw.Text("Total", style: headingStyle),
                    ],
                  ),
                ),
                pw.Divider(
                  thickness: 1, //color: Colors.black
                ),
                pw.Row(
                  children: [
                    //  const SizedBox(width: 14),
                    pw.Container(
                      //   color: Colors.grey,
                      width: 140,
                      child: pw.Column(
                        crossAxisAlignment: pw.CrossAxisAlignment.start,
                        children: [
                          ...productList.map((e) {
                            return pw.Column(
                              children: [
                                pw.Text(
                                  "${e.productName}",
                                  style: const pw.TextStyle(
                                    fontSize: 15,
                                    //  fontWeight: FontWeight.w500
                                  ),
                                ),
                                pw.Divider(
                                    // color: Colors.black,
                                    )
                              ],
                            );
                          }).toList(),
                        ],
                      ),
                    ),
                    //  const SizedBox(width: 12),
                    pw.Container(
                      //  color: Colors.blueAccent,
                      width: 125,
                      child: pw.Column(
                        crossAxisAlignment: pw.CrossAxisAlignment.start,
                        children: [
                          ...productList.map((e) {
                            return pw.Column(
                              children: [
                                pw.Text(
                                  "${e.productQuantity}",
                                  style: pw.TextStyle(
                                    fontSize: 15,
                                    // fontWeight: FontWeight.w500
                                  ),
                                ),
                                pw.Divider(
                                    //color: Colors.black,
                                    )
                              ],
                            );
                          }).toList(),
                        ],
                      ),
                    ),
                    // const SizedBox(width: 18),
                    pw.Container(
                      // color: Colors.grey,
                      width: 110,
                      child: pw.Column(
                        crossAxisAlignment: pw.CrossAxisAlignment.start,
                        children: [
                          ...productList.map((e) {
                            return pw.Column(
                              children: [
                                pw.Text(
                                  "${e.productPrice}",
                                  style: const pw.TextStyle(
                                    fontSize: 15,
                                    // fontWeight: FontWeight.w500
                                    // ),
                                  ),
                                ),
                                pw.Divider(thickness: 1
                                    // color: Colors.black,
                                    ),
                              ],
                            );
                          }).toList(),
                        ],
                      ),
                    ),
                    //const SizedBox(width: 22),
                    pw.Container(
                      //  color: Colors.blueAccent,
                      width: 106,
                      child: pw.Column(
                        crossAxisAlignment: pw.CrossAxisAlignment.start,
                        children: [
                          ...productList.map((e) {
                            return pw.Column(
                              children: [
                                pw.Text(
                                  "${e.productPrice * e.productQuantity}",
                                  style: const pw.TextStyle(
                                    fontSize: 15,
                                    // fontWeight: FontWeight.w500
                                  ),
                                ),
                                pw.Divider(
                                    // color: Colors.black,
                                    )
                              ],
                            );
                          }).toList(),
                        ],
                      ),
                    ),
                  ],
                ),
                pw.Divider(
                  thickness: 1, //color: Colors.black
                ),
                pw.SizedBox(height: 8),
                pw.Row(
                  mainAxisAlignment: pw.MainAxisAlignment.end,
                  children: [
                    pw.Column(
                      crossAxisAlignment: pw.CrossAxisAlignment.start,
                      children: [
                        pw.Text(
                          "SUBTOTAL",
                          style: totalStyle,
                        ),
                        pw.Text(
                          "TAX RATE",
                          style: totalStyle,
                        ),
                        pw.Text(
                          "TOTAL TAX",
                          style: totalStyle,
                        ),
                      ],
                    ),
                    pw.SizedBox(width: 8),
                    pw.Column(
                      crossAxisAlignment: pw.CrossAxisAlignment.end,
                      children: [
                        pw.Text(
                          "${getTotal()}",
                          style: totalStyle,
                        ),
                        pw.Text(
                          "${companyDetails.selectedGST}%",
                          style: totalStyle,
                        ),
                        pw.Text(
                          "${getGST()}",
                          style: totalStyle,
                        ),
                      ],
                    ),
                  ],
                ),
                pw.Divider(
                  thickness: 1.5,
                  //  color: Colors.black,
                  indent: 220,
                ),
                pw.Row(
                  mainAxisAlignment: pw.MainAxisAlignment.end,
                  children: [
                    pw.Column(
                      crossAxisAlignment: pw.CrossAxisAlignment.start,
                      children: [
                        pw.Text(
                          "BALANCE DUE",
                          style: totalStyle,
                        ),
                      ],
                    ),
                    pw.SizedBox(width: 8),
                    pw.Column(
                      crossAxisAlignment: pw.CrossAxisAlignment.end,
                      children: [
                        pw.Text(
                          "${getTotal() + getGST()}",
                          style: totalStyle,
                        ),
                      ],
                    ),
                  ],
                ),
                pw.Divider(
                  thickness: 1.5,
                  // color: Colors.black,
                  indent: 250,
                ),
              ],
            );
          }),
    );

    return pdf.save();
  }

  static Future<void> openPDF(Uint8List data) async {
    final dir = await getExternalStorageDirectory();
    final filePath = '${dir?.path}/Invoice.pdf';
    final file = File(filePath);
    await file.writeAsBytes(data);

    OpenFile.open(filePath);
  }
}

getTotal() {
  dynamic sum = 0;
  List totalPrice;
  totalPrice = productList.map((e) {
    return e.productPrice * e.productQuantity;
  }).toList();

  for (int i = 0; i < totalPrice.length; i++) {
    sum += totalPrice[i];
  }
  return sum;
}

getGST() {
  dynamic sum = 0;
  List totalPrice;
  totalPrice = productList.map((e) {
    return e.productPrice * e.productQuantity;
  }).toList();

  for (int i = 0; i < totalPrice.length; i++) {
    sum += totalPrice[i];
  }

  return (sum * companyDetails.selectedGST) / 100;
}
