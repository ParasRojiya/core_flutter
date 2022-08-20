import 'package:flutter/material.dart';
import 'package:invoice_generator_11/modals/modals.dart';

class CustomerDetails extends StatefulWidget {
  const CustomerDetails({Key? key}) : super(key: key);

  @override
  State<CustomerDetails> createState() => _CustomerDetailsState();
}

class _CustomerDetailsState extends State<CustomerDetails> {
  final GlobalKey<FormState> customerDetailsFormKey = GlobalKey<FormState>();

  final TextEditingController custNameController = TextEditingController();
  final TextEditingController custEmailController = TextEditingController();
  final TextEditingController custContactController = TextEditingController();
  final TextEditingController custAddress1Controller = TextEditingController();
  final TextEditingController custAddress2Controller = TextEditingController();
  final TextEditingController custAddress3Controller = TextEditingController();

  String? customerName;
  String? customerEmail;
  String? customerContact;
  String? customerAddress1;
  String? customerAddress2;
  String? customerAddress3;

  customerDetails custDetails = customerDetails();

  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Customer Details"),
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
        child: SingleChildScrollView(
          child: Form(
            key: customerDetailsFormKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: TextFormField(
                    controller: custNameController,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Customer Name',
                        labelText: 'Customer Name'),
                    onSaved: (val) {
                      customerName = val;
                    },
                    validator: (val) {
                      if (val!.isEmpty) {
                        return "Enter Customer Name...";
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: TextFormField(
                    controller: custEmailController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Customer Email',
                        labelText: 'Customer Email'),
                    onSaved: (val) {
                      customerEmail = val;
                    },
                    validator: (val) {
                      if (val!.isEmpty) {
                        return "Enter Customer Email...";
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: TextFormField(
                    controller: custContactController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Customer Contact No.',
                        labelText: 'Customer Contact No.'),
                    onSaved: (val) {
                      customerContact = val;
                    },
                    validator: (val) {
                      if (val!.isEmpty) {
                        return "Enter Customer Contact No....";
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: TextFormField(
                    controller: custAddress1Controller,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Address (Street,Building No)',
                        labelText: 'Address'),
                    onSaved: (val) {
                      customerAddress1 = val;
                    },
                    validator: (val) {
                      if (val!.isEmpty) {
                        return "Enter Customer Address...";
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: TextFormField(
                    controller: custAddress2Controller,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'AddressLine 2',
                        labelText: 'Address'),
                    onSaved: (val) {
                      customerAddress2 = val;
                    },
                    validator: (val) {
                      if (val!.isEmpty) {
                        return "Enter Customer Address...";
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: TextFormField(
                    controller: custAddress3Controller,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'AddressLine 3',
                        labelText: 'Address'),
                    onSaved: (val) {
                      customerAddress3 = val;
                    },
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        if (customerDetailsFormKey.currentState!.validate()) {
                          customerDetailsFormKey.currentState!.save();

                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content:
                                  Text("Customer Details Successfully Added"),
                              behavior: SnackBarBehavior.floating,
                            ),
                          );

                          customerList.add(
                            customerDetails(
                              customerName: customerName,
                              customerEmail: customerEmail,
                              customerContact: customerContact,
                              customerAddressLine1: customerAddress1,
                              customerAddressLine2: customerAddress2,
                              customerAddressLine3: customerAddress3,
                            ),
                          );
                        }
                        print(customerList[0].customerName);
                        print(customerList[0].customerEmail);
                        print(customerList[0].customerContact);
                        print(customerList[0].customerAddressLine1);
                        print(customerList[0].customerAddressLine2);
                        print(customerList[0].customerAddressLine3);
                      },
                      child: const Text("Save"),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        customerDetailsFormKey.currentState!.reset();

                        custNameController.clear();
                        custEmailController.clear();
                        custContactController.clear();
                        custAddress1Controller.clear();
                        custAddress2Controller.clear();
                        custAddress3Controller.clear();

                        setState(() {
                          custDetails.customerName = '';
                          custDetails.customerEmail = '';
                          custDetails.customerContact = '';
                          custDetails.customerAddressLine1 = '';
                          custDetails.customerAddressLine2 = '';
                          custDetails.customerAddressLine3 = '';
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
