import 'package:flutter/material.dart';
import 'product_counters.dart';

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
Map<String, int> productCounters = {};