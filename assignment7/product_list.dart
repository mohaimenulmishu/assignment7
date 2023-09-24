import 'package:flutter/material.dart';

List<Product> products = [
  Product(name: 'Product 4', price: 100),
  Product(name: 'Product 7', price: 200),
  Product(name: 'Product 10', price: 300),
  Product(name: 'Product 12', price: 400),
];

Map<String, int> productCounters = {};

void incrementCounter(String productName) {
  productCounters[productName] = productCounters[productName]! + 1;

  // Show a dialog box if the counter reaches 5
  if (productCounters[productName]! == 5) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Congratulations!'),
            content: Text('You\'ve bought 5 ${productName}!'),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text('OK'),
              ),
            ],
          );
        });
  }
}

void navigateToCartPage(BuildContext context) {
  Navigator.push(context, MaterialPageRoute(builder: (context) => CartPage()));
}

Widget buildProductList() {
  return ListView.builder(
    itemCount: products.length,
    itemBuilder: (context, index) {
      Product product = products[index];

      return ListTile(
        title: Text(product.name),
        subtitle: Text('${product.price}'),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              icon: Icon(Icons.add),
              onPressed: () => incrementCounter(product.name),
            ),
            Text('${productCounters[product.name] ?? 0}'),
          ],
        ),
      );
    },
  );
}

class Product {
  final String name;
  final int price;

  Product({required this.name, required this.price});
}

class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
      ),
      body: Center(
        child: Text('Total number of products: ${productCounters.values.fold(0, (sum, value) => sum + value)}'),
      ),
    );
  }
}