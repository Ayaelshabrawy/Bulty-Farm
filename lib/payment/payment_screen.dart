import 'package:flutter/material.dart';
import 'package:bulty_farmm/cart/cart.dart'; // Import the Cart class from the correct file
import 'package:bulty_farmm/payment/paymob_manager/paymob_manager.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key); // Fix the super constructor syntax

  static const routeName = '/payment';

  @override
  Widget build(BuildContext context) {
    // Assuming that `cart` is an instance of the `Cart` class that contains the total price
    final cart = Provider.of<Cart>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Paymob Integration"),
      ),
      body: ElevatedButton(
        onPressed: () async => _pay(cart),
        child: Text("Pay ${cart.totalPrice} EGP"),
      ),
    );
  }

  Future<void> _pay(Cart cart) async {
    PaymobManager().getPaymentKey(
      int.tryParse('${cart.totalPrice}') ?? 0,
      "EGP",
    ).then((String paymentKey) {
      launchUrl(
        Uri.parse("https://accept.paymob.com/api/acceptance/iframes/791787?payment_token=$paymentKey"),
      );
    });
  }
}
