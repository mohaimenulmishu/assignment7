import 'package:flutter/material.dart';
import 'cart_page.dart';
import 'products.dart';

class ProductList extends StatefulWidget {
  const ProductList({super.key});

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  final List<Products> _products = [
    Products(productName: 'Iphone', price: 2000.0),
    Products(productName: 'Samsung', price: 700.0),
    Products(productName: 'Motorola', price: 6000.0),
    Products(productName: 'Vivo', price: 500.0),
    Products(productName: 'Realme', price: 300.0),
    Products(productName: 'OnePlus', price: 500.0),
    Products(productName: 'xaomi', price: 500.0),
  ];

  Future<void> _showMyDialog(productName, productQyt) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Congratulations!'),
          content: Text("You've bought $productQyt $productName!"),
          actions: [
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    List<Products> cartCount =
    _products.where((item) => item.qyt != 0).toList();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product List'),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CartPage(totalProduct: cartCount),
            ),
          );
        },
        tooltip: 'Go to Cart',
        child: const Icon(Icons.shopping_cart),
      ),
      body: Scrollbar(
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: _products.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        _products[index].productName,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text("\$${_products[index].price.toStringAsFixed(2)}"),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Counts: ${_products[index].qyt}"),
                      ElevatedButton(
                        onPressed: () {
                          if (_products[index].qyt < 5) {
                            setState(() {
                              _products[index].qyt++;
                            });
                          }
                          if (_products[index].qyt == 5) {
                            _showMyDialog(_products[index].productName,
                                _products[index].qyt);
                          }
                        },
                        child: const Text("Buy Now"),
                      )
                    ],
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}