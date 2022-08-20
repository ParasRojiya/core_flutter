import 'package:flutter/material.dart';
import '../modals/modals.dart';

class ProductList extends StatefulWidget {
  const ProductList({Key? key}) : super(key: key);

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  TextStyle headingStyle =
      const TextStyle(fontSize: 22, fontWeight: FontWeight.w500);
  TextStyle totalStyle =
      const TextStyle(fontSize: 20, fontWeight: FontWeight.w400);

  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Products List"),
        centerTitle: true,
      ),
      backgroundColor: (productList.isEmpty) ? Colors.white : Colors.grey,
      body: (productList.isEmpty)
          ? const Center(
              child: Text(
                "Your Product List Is Empty",
                style: TextStyle(fontSize: 24, color: Colors.grey),
              ),
            )
          : Container(
              height: _height,
              width: _width,
              margin: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(12),
                    child: Expanded(
                      flex: 1,
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Name", style: headingStyle),
                              Text("Price", style: headingStyle),
                              Text("Quantity", style: headingStyle),
                            ],
                          ),
                          const Divider(thickness: 1, color: Colors.grey)
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 14,
                    child: ListView.builder(
                        itemCount: productList.length,
                        itemBuilder: (context, i) {
                          final currentProduct = productList[i];
                          return Column(
                            children: [
                              InkWell(
                                onLongPress: () {
                                  setState(() {
                                    showDialog(
                                      context: context,
                                      builder: (context) {
                                        return AlertDialog(
                                          title: const Text(
                                              "Do you want to remove this Product from the List?"),
                                          actions: [
                                            ElevatedButton(
                                              onPressed: () {
                                                setState(() {
                                                  productList.removeAt(i);
                                                });

                                                Navigator.of(context).pop();
                                              },
                                              child: const Text("Yes"),
                                            ),
                                            OutlinedButton(
                                              onPressed: () {
                                                Navigator.of(context).pop();
                                              },
                                              child: const Text("No"),
                                            ),
                                          ],
                                        );
                                      },
                                    );
                                  });
                                },
                                child: Row(
                                  children: [
                                    const SizedBox(width: 4),
                                    Text(
                                      currentProduct.productName,
                                      style: const TextStyle(fontSize: 18),
                                    ),
                                    const Spacer(),
                                    Text(
                                      'Rs.${currentProduct.productPrice}',
                                      style: const TextStyle(fontSize: 18),
                                    ),
                                    const Spacer(),
                                    IconButton(
                                        onPressed: () {
                                          setState(() {
                                            if (currentProduct.productQuantity >
                                                0) {
                                              currentProduct.productQuantity--;
                                            }
                                          });
                                        },
                                        icon: const Icon(Icons.remove)),
                                    Text(
                                      '${currentProduct.productQuantity}',
                                      style: const TextStyle(fontSize: 18),
                                    ),
                                    IconButton(
                                        onPressed: () {
                                          setState(() {
                                            currentProduct.productQuantity++;
                                          });
                                        },
                                        icon: const Icon(Icons.add)),
                                  ],
                                ),
                              ),
                              const Divider(thickness: 1, color: Colors.grey)
                            ],
                          );
                        }),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12),
                    child: Expanded(
                      flex: 1,
                      child: Column(
                        children: [
                          ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  productList.clear();
                                });
                              },
                              child: const Text("Clear Product List")),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Total(Excluding GST):-', style: totalStyle),
                              Text('Rs.${getTotal()}', style: totalStyle),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Total GST (${companyDetails.selectedGST}%):- ${getGST()}',
                                style: const TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 18,
                                ),
                              ),
                              Text('Rs.${getGST()}', style: totalStyle),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Total(Including GST ${companyDetails.selectedGST}%):-',
                                style: const TextStyle(
                                    fontWeight: FontWeight.w400, fontSize: 18),
                              ),
                              Text('Rs.${getTotal() + getGST()}',
                                  style: totalStyle),
                            ],
                          ),
                        ],
                      ),
                    ),
                  )
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
