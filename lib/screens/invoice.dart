import 'package:flutter/material.dart';
import 'package:invoice_generator_11/modals/modals.dart';
import '../modals/invoice.dart';

class Invoice extends StatefulWidget {
  const Invoice({Key? key}) : super(key: key);

  @override
  State<Invoice> createState() => _InvoiceState();
}

class _InvoiceState extends State<Invoice> {
  TextStyle headingStyle =
      const TextStyle(fontSize: 18, fontWeight: FontWeight.w500);

  TextStyle totalStyle =
      const TextStyle(fontSize: 15, fontWeight: FontWeight.w400);

  customerDetails custDetails = customerDetails();

  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Invoice"),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () async {
              final invoice = await InvoicePDF.getInvoice();
              InvoicePDF.openPDF(invoice);
            },
            icon: const Icon(Icons.download),
          )
        ],
      ),
      backgroundColor: Colors.grey,
      body: Container(
        color: Colors.white,
        width: _width,
        height: _height,
        margin: const EdgeInsets.all(8),
        child: Column(
          children: [
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Tax Invoice",
                  style: const TextStyle(
                      fontSize: 24, fontWeight: FontWeight.w500),
                )
              ],
            ),
            const Divider(thickness: 1, color: Colors.black),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "${companyDetails.companyName}",
                      style: const TextStyle(
                          fontSize: 22, fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      "${companyDetails.companyEmail}",
                      style: const TextStyle(
                        fontSize: 18,
                      ),
                    ),
                    Text(
                      "${companyDetails.companyContact}",
                      style: const TextStyle(
                        fontSize: 18,
                      ),
                    ),
                    Text(
                      "${companyDetails.companyAddressLine1}",
                      style: const TextStyle(
                        fontSize: 18,
                      ),
                    ),
                    Text(
                      "${companyDetails.companyAddressLine2}",
                      style: const TextStyle(
                        fontSize: 17,
                      ),
                    ),
                    Text(
                      "${companyDetails.companyAddressLine3}",
                      style: const TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ],
                ), //Company Address
                Column(
                  children: [
                    CircleAvatar(
                      backgroundImage: FileImage(companyDetails.companyLogo!),
                      radius: 50,
                    )
                  ],
                ), //Company Logo
              ],
            ), //Company Address & Logo
            const SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Bill To",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Colors.grey),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      "${customerList[0].customerName}",
                      style: const TextStyle(
                        fontSize: 19,
                      ),
                    ),
                    Text(
                      "${customerList[0].customerEmail}",
                      style: const TextStyle(
                        fontSize: 18,
                      ),
                    ),
                    Text(
                      "${customerList[0].customerContact}",
                      style: const TextStyle(
                        fontSize: 17,
                      ),
                    ),
                    Text(
                      "${customerList[0].customerAddressLine1}",
                      style: const TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      "${customerList[0].customerAddressLine2}",
                      style: const TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ],
                ), //Customer Address
                Container(
                  height: 130,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        "Invoice No: ${invoiceDetails.invoiceNumber}",
                        style: const TextStyle(
                          fontSize: 15,
                        ),
                      ),
                      Text(
                        "Invoice Date:${invoiceDetails.invoiceDateOfIssue}",
                        style: const TextStyle(
                          fontSize: 15,
                        ),
                      ),
                      Text(
                        "Due Date: ${invoiceDetails.invoiceDueDate}",
                        style: const TextStyle(
                          fontSize: 15,
                        ),
                      ),
                    ],
                  ),
                ), //Invoice Details
              ],
            ), //Customer & Invoice Details
            const SizedBox(height: 15),
            const Divider(thickness: 1, color: Colors.black),
            Container(
              color: Colors.grey.shade400,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text("Description", style: headingStyle),
                  Text("Quantity", style: headingStyle),
                  Text("Unit Price", style: headingStyle),
                  Text("Total", style: headingStyle),
                ],
              ),
            ),
            const Divider(thickness: 1, color: Colors.black),
            Row(
              children: [
                //  const SizedBox(width: 14),
                Container(
                  //   color: Colors.grey,
                  width: 120,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ...productList.map((e) {
                        return Column(
                          children: [
                            Text(
                              "${e.productName}",
                              style: const TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.w500),
                            ),
                            const Divider(
                              color: Colors.black,
                            )
                          ],
                        );
                      }).toList(),
                    ],
                  ),
                ),
                //  const SizedBox(width: 12),
                Container(
                  //  color: Colors.blueAccent,
                  width: 105,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ...productList.map((e) {
                        return Column(
                          children: [
                            Text(
                              "${e.productQuantity}",
                              style: const TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.w500),
                            ),
                            const Divider(
                              color: Colors.black,
                            )
                          ],
                        );
                      }).toList(),
                    ],
                  ),
                ),
                // const SizedBox(width: 18),
                Container(
                  // color: Colors.grey,
                  width: 98,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ...productList.map((e) {
                        return Column(
                          children: [
                            Text(
                              "${e.productPrice}",
                              style: const TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.w500),
                            ),
                            const Divider(
                              color: Colors.black,
                            )
                          ],
                        );
                      }).toList(),
                    ],
                  ),
                ),
                //const SizedBox(width: 22),
                Container(
                  //  color: Colors.blueAccent,
                  width: 72.3,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ...productList.map((e) {
                        return Column(
                          children: [
                            Text(
                              "${e.productPrice * e.productQuantity}",
                              style: const TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.w500),
                            ),
                            const Divider(
                              color: Colors.black,
                            )
                          ],
                        );
                      }).toList(),
                    ],
                  ),
                ),
              ],
            ),
            const Divider(thickness: 1, color: Colors.black),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "SUBTOTAL",
                      style: totalStyle,
                    ),
                    Text(
                      "TAX RATE",
                      style: totalStyle,
                    ),
                    Text(
                      "TOTAL TAX",
                      style: totalStyle,
                    ),
                  ],
                ),
                const SizedBox(width: 8),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      "${getTotal()}",
                      style: totalStyle,
                    ),
                    Text(
                      "${companyDetails.selectedGST}%",
                      style: totalStyle,
                    ),
                    Text(
                      "${getGST()}",
                      style: totalStyle,
                    ),
                  ],
                ),
              ],
            ),
            const Divider(
              thickness: 1.5,
              color: Colors.black,
              indent: 220,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "BALANCE DUE",
                      style: totalStyle,
                    ),
                  ],
                ),
                const SizedBox(width: 8),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      "${getTotal() + getGST()}",
                      style: totalStyle,
                    ),
                  ],
                ),
              ],
            ),
            const Divider(
              thickness: 1.5,
              color: Colors.black,
              indent: 250,
            ),
          ],
        ),
      ),
    );
  }

  dynamic getTotal() {
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

  dynamic getGST() {
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
}
