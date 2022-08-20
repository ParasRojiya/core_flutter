import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:invoice_generator_11/modals/modals.dart';
import 'package:path_provider/path_provider.dart';

class CompanyDetails extends StatefulWidget {
  const CompanyDetails({Key? key}) : super(key: key);

  @override
  State<CompanyDetails> createState() => _CompanyDetailsState();
}

class _CompanyDetailsState extends State<CompanyDetails> {
  final ImagePicker _picker = ImagePicker();

  final GlobalKey<FormState> companyDetailsFormKey = GlobalKey<FormState>();

  final TextEditingController cmpNameController = TextEditingController();
  final TextEditingController cmpEmailController = TextEditingController();
  final TextEditingController cmpContactController = TextEditingController();
  final TextEditingController cmpAddress1Controller = TextEditingController();
  final TextEditingController cmpAddress2Controller = TextEditingController();
  final TextEditingController cmpAddress3Controller = TextEditingController();

  dynamic selectedGST = "5%";

  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Company Details"),
        centerTitle: true,
      ),
      backgroundColor: Colors.grey,
      body: Container(
        height: _height,
        width: _width,
        margin: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
        ),
        child: SingleChildScrollView(
          child: Form(
            key: companyDetailsFormKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: const EdgeInsets.all(8),
                  height: _height * 0.22,
                  width: _width * .9,
                  color: Colors.white,
                  alignment: Alignment.center,
                  child: Stack(
                    alignment: Alignment.bottomRight,
                    children: [
                      CircleAvatar(
                        backgroundImage: (companyDetails.companyLogo != null)
                            ? FileImage(companyDetails.companyLogo!)
                            : null,
                        backgroundColor: Colors.grey,
                        radius: 80,
                        child: (companyDetails.companyLogo != null)
                            ? null
                            : const Text(
                                "ADD",
                                style: TextStyle(
                                    color: Colors.black, fontSize: 22),
                              ),
                      ),
                      FloatingActionButton(
                          onPressed: () {
                            setState(() {
                              showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    title: const Text(
                                        "From where do you want to get your Photo?"),
                                    actions: [
                                      ElevatedButton(
                                        onPressed: () async {
                                          XFile? pickedPhoto =
                                              await _picker.pickImage(
                                                  source: ImageSource.gallery);

                                          setState(() {
                                            companyDetails.companyLogo =
                                                File(pickedPhoto!.path);
                                          });

                                          Navigator.of(context).pop();
                                        },
                                        child: const Text("Gallery"),
                                      ),
                                      ElevatedButton(
                                        onPressed: () async {
                                          XFile? clickedPhoto =
                                              await _picker.pickImage(
                                                  source: ImageSource.camera);

                                          setState(() {
                                            companyDetails.companyLogo =
                                                File(clickedPhoto!.path);
                                          });

                                          Navigator.of(context).pop();
                                        },
                                        child: const Text("Camera"),
                                      ),
                                    ],
                                  );
                                },
                              );
                            });
                          },
                          mini: true,
                          child: const Icon(Icons.add))
                    ],
                  ),
                ), //CompanyLogo
                const Divider(
                  thickness: 2,
                  color: Colors.grey,
                  endIndent: 15,
                  indent: 15,
                ),
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: TextFormField(
                    controller: cmpNameController,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Company Name',
                        labelText: 'Company Name'),
                    onSaved: (val) {
                      companyDetails.companyName = val;
                    },
                    validator: (val) {
                      if (val!.isEmpty) {
                        return "Enter Company Name...";
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: TextFormField(
                    controller: cmpEmailController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Company Email',
                        labelText: 'Company Email'),
                    onSaved: (val) {
                      companyDetails.companyEmail = val;
                    },
                    validator: (val) {
                      if (val!.isEmpty) {
                        return "Enter Company Email...";
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: TextFormField(
                    controller: cmpContactController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Company Contact No.',
                        labelText: 'Company Contact No.'),
                    onSaved: (val) {
                      companyDetails.companyContact = val;
                    },
                    validator: (val) {
                      if (val!.isEmpty) {
                        return "Enter Company Company Contact No....";
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: TextFormField(
                    controller: cmpAddress1Controller,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Address (Street,Building No)',
                        labelText: 'Address'),
                    onSaved: (val) {
                      companyDetails.companyAddressLine1 = val;
                    },
                    validator: (val) {
                      if (val!.isEmpty) {
                        return "Enter Company Address...";
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: TextFormField(
                    controller: cmpAddress2Controller,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'AddressLine 2',
                        labelText: 'Address'),
                    onSaved: (val) {
                      companyDetails.companyAddressLine2 = val;
                    },
                    validator: (val) {
                      if (val!.isEmpty) {
                        return "Enter Company Address...";
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: TextFormField(
                    controller: cmpAddress3Controller,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'AddressLine 3',
                        labelText: 'Address'),
                    onSaved: (val) {
                      companyDetails.companyAddressLine3 = val;
                    },
                  ),
                ),
                const SizedBox(height: 10),

                Row(
                  children: [
                    const SizedBox(width: 15),
                    const Text(
                      "Select GST Percentage         ",
                      style: TextStyle(fontSize: 18),
                    ),
                    DropdownButton<String>(
                        value: selectedGST,
                        items: const [
                          DropdownMenuItem(
                            value: "5%",
                            child: Text("5%"),
                          ),
                          DropdownMenuItem(
                            value: "12%",
                            child: Text("12%"),
                          ),
                          DropdownMenuItem(
                            value: "18%",
                            child: Text("18%"),
                          ),
                          DropdownMenuItem(
                            value: "24%",
                            child: Text("24%"),
                          ),
                          DropdownMenuItem(
                            value: "30%",
                            child: Text("30%"),
                          ),
                        ],
                        onChanged: (val) {
                          setState(() {
                            selectedGST = val!;
                          });
                        }),
                  ],
                ),
                const SizedBox(height: 10),
                const Divider(
                    thickness: 1,
                    color: Colors.grey,
                    indent: 15,
                    endIndent: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        if (companyDetailsFormKey.currentState!.validate()) {
                          companyDetailsFormKey.currentState!.save();

                          if (selectedGST == "5%") {
                            companyDetails.selectedGST = 5;
                          } else if (selectedGST == "12%") {
                            companyDetails.selectedGST = 12;
                          } else if (selectedGST == "18%") {
                            companyDetails.selectedGST = 18;
                          } else if (selectedGST == "24%") {
                            companyDetails.selectedGST = 24;
                          } else if (selectedGST == "30%") {
                            companyDetails.selectedGST = 30;
                          }

                          ScaffoldMessenger.of(context)
                              .showSnackBar(const SnackBar(
                            content: Text("Company Details Successfully Added"),
                            behavior: SnackBarBehavior.floating,
                          ));
                        }

                        print(companyDetails.companyName);
                        print(companyDetails.companyEmail);
                        print(companyDetails.companyContact);
                        print(companyDetails.companyAddressLine1);
                        print(companyDetails.companyAddressLine2);
                        print(companyDetails.companyAddressLine3);
                      },
                      child: const Text("Save"),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        companyDetailsFormKey.currentState!.reset();

                        cmpNameController.clear();
                        cmpEmailController.clear();
                        cmpContactController.clear();
                        cmpAddress1Controller.clear();
                        cmpAddress2Controller.clear();
                        cmpAddress3Controller.clear();

                        setState(() {
                          companyDetails.companyLogo = null;
                          companyDetails.companyName = '';
                          companyDetails.companyEmail = '';
                          companyDetails.companyContact = '';
                          companyDetails.companyAddressLine1 = '';
                          companyDetails.companyAddressLine2 = '';
                          companyDetails.companyAddressLine3 = '';
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
