import 'package:flutter/material.dart';
import 'package:invoice_generator_11/modals/modals.dart';

class ProductDetails extends StatefulWidget {
  const ProductDetails({Key? key}) : super(key: key);

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  final GlobalKey<FormState> productDetailFormKey = GlobalKey();

  final TextEditingController productNameController = TextEditingController();
  final TextEditingController productPriceController = TextEditingController();
  final TextEditingController productQuantityController =
      TextEditingController();

  String? productName;
  int? productPrice;
  int? productQuantity;

  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Product Details"),
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
            key: productDetailFormKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: TextFormField(
                    controller: productNameController,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Product Name',
                        labelText: 'Product Name'),
                    onSaved: (val) {
                      productName = val;
                    },
                    validator: (val) {
                      if (val!.isEmpty) {
                        return "Enter Product Name...";
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: TextFormField(
                    controller: productPriceController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Product Price',
                        labelText: 'Product Price'),
                    onSaved: (val) {
                      productPrice = int.parse(val!);
                    },
                    validator: (val) {
                      if (val!.isEmpty) {
                        return "Enter Product Price...";
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    controller: productQuantityController,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Product Quantity',
                        labelText: 'Product Quantity'),
                    onSaved: (val) {
                      productQuantity = int.parse(val!);
                    },
                    validator: (val) {
                      if (val!.isEmpty) {
                        return "Enter Product Quantity....";
                      }
                      return null;
                    },
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        if (productDetailFormKey.currentState!.validate()) {
                          productDetailFormKey.currentState!.save();

                          ScaffoldMessenger.of(context)
                              .showSnackBar(const SnackBar(
                            content:
                                Text("Product Successfully Added to the List"),
                            behavior: SnackBarBehavior.floating,
                          ));

                          productList.add(productDetails(
                              productName: productName,
                              productPrice: productPrice,
                              productQuantity: productQuantity));
                        }
                      },
                      child: const Text("Save"),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        productDetailFormKey.currentState!.reset();

                        productNameController.clear();
                        productPriceController.clear();
                        productQuantityController.clear();

                        setState(() {});
                      },
                      child: const Text("Clear"),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                const Divider(
                    thickness: 1,
                    color: Colors.grey,
                    indent: 15,
                    endIndent: 15),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed('productlist');
                    print(productList[0].productName);
                    print(productList[0].productPrice);
                    print(productList[0].productQuantity);
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.blueAccent,
                    onPrimary: Colors.white,
                    textStyle: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.w500),
                    maximumSize: const Size(250, 60),
                    minimumSize: const Size(250, 60),
                  ),
                  child: const Text("Check Out Product List"),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
