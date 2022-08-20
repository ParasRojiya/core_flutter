import 'package:flutter/material.dart';
import 'package:invoice_generator_11/modals/modals.dart';

class InvoiceDetails extends StatefulWidget {
  const InvoiceDetails({Key? key}) : super(key: key);

  @override
  State<InvoiceDetails> createState() => _InvoiceDetailsState();
}

class _InvoiceDetailsState extends State<InvoiceDetails> {
  final GlobalKey<FormState> invoiceDetailsFormKey = GlobalKey<FormState>();

  final TextEditingController invoiceNumberController = TextEditingController();
  final TextEditingController invoiceDateOfIssueController =
      TextEditingController();
  final TextEditingController invoiceDueDateController =
      TextEditingController();

  dynamic selectGST = "5%";
  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Invoice Details"),
        centerTitle: true,
      ),
      backgroundColor: Colors.grey,
      body: Container(
        height: _height,
        width: _width,
        margin: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
        ),
        alignment: const Alignment(0, -0.5),
        child: SingleChildScrollView(
          child: Form(
            key: invoiceDetailsFormKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: TextFormField(
                    controller: invoiceNumberController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Invoice Number',
                        labelText: 'Invoice Number'),
                    onSaved: (val) {
                      invoiceDetails.invoiceNumber = int.parse(val!);
                    },
                    validator: (val) {
                      if (val!.isEmpty) {
                        return "Enter Invoice Name...";
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: TextFormField(
                    controller: invoiceDateOfIssueController,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Date Of Issue',
                        labelText: 'Date Of Issue'),
                    onSaved: (val) {
                      invoiceDetails.invoiceDateOfIssue = val;
                    },
                    validator: (val) {
                      if (val!.isEmpty) {
                        return "Enter Date Of Issue...";
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: TextFormField(
                    controller: invoiceDueDateController,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Due Date',
                        labelText: 'Due Date'),
                    onSaved: (val) {
                      invoiceDetails.invoiceDueDate = val;
                    },
                    validator: (val) {
                      if (val!.isEmpty) {
                        return "Enter Due Date....";
                      }
                      return null;
                    },
                  ),
                ),
                const SizedBox(height: 20),
                const Divider(
                    thickness: 1,
                    color: Colors.grey,
                    indent: 15,
                    endIndent: 15),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        if (invoiceDetailsFormKey.currentState!.validate()) {
                          invoiceDetailsFormKey.currentState!.save();

                          ScaffoldMessenger.of(context)
                              .showSnackBar(const SnackBar(
                            content: Text("Invoice Details Successfully Added"),
                            behavior: SnackBarBehavior.floating,
                          ));
                        }
                        print(selectGST);
                      },
                      child: const Text("Save"),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        invoiceDetailsFormKey.currentState!.reset();

                        invoiceNumberController.clear();
                        invoiceDateOfIssueController.clear();
                        invoiceDueDateController.clear();

                        setState(() {
                          invoiceDetails.invoiceNumber = null;
                          invoiceDetails.invoiceDateOfIssue = '';
                          invoiceDetails.invoiceDueDate = '';
                        });
                      },
                      child: const Text("Clear"),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
