import 'package:bulty_farmm/config/routes.dart';
import 'package:flutter/material.dart';
import 'package:bulty_farmm/cart/cart.dart';
import 'package:flutter/material.dart';
import 'package:bulty_farmm/payment/payment_screen.dart';


class CartScreen extends StatelessWidget {
  static const routeName = '/cart';

  @override
  Widget build(BuildContext context) {
    final cart = ModalRoute.of(context)?.settings.arguments as Cart?;

    if (cart == null || cart.products.isEmpty) {
      return Scaffold(
        body:
        Center(
        child: Text('Your cart is empty'),


         ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Bulty Cart'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: cart.products.length,
              itemBuilder: (context, index) {
                final product = cart.products[index];
                return ListTile(
                  leading: CircleAvatar(
                    child: Text('1'), // Assuming one quantity per item
                  ),
                  title: Text(product.id),
                  subtitle: Text('{cart.totalPrice}\LE'),
                  trailing: IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () {
                      cart.removeItem(product.id);
                    },
                  ),
                );
              },
            ),
          ),
          Container(
            padding: EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Total: {cart.totalPrice}\LE'),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(
                      context,
                      AppRoutes.payment,
                      arguments: cart,
                    );
                  },
                  child: Text('Pay'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}