import 'package:flutter/material.dart';
import 'products.dart';

class CartPage extends StatelessWidget {
  final List<Products> totalProduct;
  const CartPage({super.key, required this.totalProduct});

  @override
  Widget build(BuildContext context) {
    double total = 0;
    for (int i = 0; i < totalProduct.length; i++) {
      total += (totalProduct[i].price * totalProduct[i].qyt);
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            flex: 5,
            child: ListView.separated(
              itemBuilder: (context, index) => ListTile(
                title: Text(totalProduct[index].productName),
                subtitle: Text(
                    "Price: \$${totalProduct[index].price.toStringAsFixed(2)} | Qyt: ${totalProduct[index].qyt}"),
                trailing: Text(
                    "\$${(totalProduct[index].price * totalProduct[index].qyt).toStringAsFixed(2)}"),
              ),
              itemCount: totalProduct.length,
              separatorBuilder: (context, _) => const Divider(
                height: 2,
                color: Colors.black54,
              ),
            ),
          ),
          const Divider(
            height: 2,
            color: Colors.black54,
          ),
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Total Products: ${totalProduct.length}"),
                      Text("Total Price: \$${total.toStringAsFixed(2)}"),
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 20),
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {},
                      child: const Text("order confirm"),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}