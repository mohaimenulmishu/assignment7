// import 'package:flutter/material.dart';
// void main(){
//
//   runApp(MyApp());
// }
//
//
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home:AllProduct(),
//       title: "Best Buy",
//     );
//   }
// }
//
// class AllProduct extends StatelessWidget {
//   const AllProduct({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Product List"),
//       ),
//       body: Scrollbar(
//         child: ListView.separated(
//           itemCount: 50,
//           itemBuilder: (context,index){
//             return ListTile(
//               title: Text("product name $index"),
//             );
//           },
//           separatorBuilder: (context, index){
//             return Divider();
//           },
//         ),
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';
//
// void main() {
//   runApp(MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Counter App',
//       home: ProductList(),
//     );
//   }
// }
//
// class ProductList extends StatefulWidget {
//   @override
//   _ProductListState createState() => _ProductListState();
// }
//
// class _ProductListState extends State<ProductList> {
//   List<Product> products = List.generate(
//     20,
//         (index) => Product(name: 'Product ${index + 1}', price: (index + 1) * 10),
//   );
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Product List'),
//         actions: [
//           IconButton(
//             icon: Icon(Icons.shopping_cart),
//             onPressed: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(builder: (context) => CartPage(products: products)),
//               );
//             },
//           ),
//         ],
//       ),
//       body: ListView.builder(
//         itemCount: products.length,
//         itemBuilder: (context, index) {
//           return ListTile(
//             title: Text(products[index].name),
//             subtitle: Text('\$${products[index].price.toStringAsFixed(2)}'),
//             trailing: ProductCounter(
//               initialValue: 0,
//               onCounterChanged: (value) {
//                 if (value == 5) {
//                   _showCongratulationsDialog(products[index].name);
//                 }
//               },
//             ),
//           );
//         },
//       ),
//     );
//   }
//
//   Future<void> _showCongratulationsDialog(String productName) async {
//     return showDialog<void>(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           title: Text('Congratulations!'),
//           content: Text('You\'ve bought 5 $productName!'),
//           actions: <Widget>[
//             TextButton(
//               onPressed: () {
//                 Navigator.of(context).pop();
//               },
//               child: Text('OK'),
//             ),
//           ],
//         );
//       },
//     );
//   }
// }
//
// class Product {
//   final String name;
//   final double price;
//
//   Product({required this.name, required this.price});
// }
//
// class ProductCounter extends StatefulWidget {
//   final int initialValue;
//   final ValueChanged<int> onCounterChanged;
//
//   ProductCounter({required this.initialValue, required this.onCounterChanged});
//
//   @override
//   _ProductCounterState createState() => _ProductCounterState();
// }
//
// class _ProductCounterState extends State<ProductCounter> {
//   int _counter = 0;
//
//   @override
//   void initState() {
//     super.initState();
//     _counter = widget.initialValue;
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       mainAxisSize: MainAxisSize.min,
//       children: <Widget>[
//         IconButton(
//           icon: Icon(Icons.remove),
//           onPressed: () {
//             setState(() {
//               if (_counter > 0) {
//                 _counter--;
//                 widget.onCounterChanged(_counter);
//               }
//             });
//           },
//         ),
//         Text('$_counter'),
//         IconButton(
//           icon: Icon(Icons.add),
//           onPressed: () {
//             setState(() {
//               _counter++;
//               widget.onCounterChanged(_counter);
//             });
//           },
//         ),
//       ],
//     );
//   }
// }
//
// class CartPage extends StatelessWidget {
//   final List<Product> products;
//
//   CartPage({required this.products});
//
//   @override
//   Widget build(BuildContext context) {
//     int totalProducts = products.fold<int>(0, (total, product) => total + productCounter[product]!);
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Cart'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             Text('Total Products: $totalProducts'),
//             ElevatedButton(
//               onPressed: () {
//                 Navigator.pop(context);
//               },
//               child: Text('Back to Product List'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
// Map<Product, int> productCounter = {};

// productCounters.dart
import 'package:flutter/material.dart';
import 'product_list.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Product List'),
        ),
        body: buildProductList(),
        floatingActionButton: FloatingActionButton(
          onPressed: () => navigateToCartPage(context),
          child: Icon(Icons.shopping_cart),
        ),
      ),
    );
  }
}



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
