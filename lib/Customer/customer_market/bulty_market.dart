import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:bulty_farmm/cart/plant_card.dart';
import 'package:bulty_farmm/cart/product-cart.dart';
import 'package:bulty_farmm/cart/cart_screen.dart';
import 'package:bulty_farmm/screens/complete_profile/complete_profile_screen.dart';

class BultyMarket extends StatefulWidget {
  const BultyMarket({Key? key}) : super(key: key);

  @override
  State<BultyMarket> createState() => _BultyMarketState();
}

class _BultyMarketState extends State<BultyMarket> {
  late Future<List<Product>> productsFuture;

  @override
  void initState() {
    super.initState();
    productsFuture = fetchProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffececee),
        centerTitle: true,
        title: Text(
          "Bulty Market",
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontFamily: 'TT Firs Neue',
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        shape: CircularNotchedRectangle(),
        notchMargin: 10,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              icon: Icon(Icons.person),
        onPressed: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => CompleteProfileScreen (),
            ),
          );
        }
            ),
      IconButton(
        icon: Icon(Icons.shopping_cart_outlined),
        onPressed: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => CartScreen (),
            ),
          );
        }
      ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            FutureBuilder<List<Product>>(
              future: productsFuture,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const CircularProgressIndicator();
                } else if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else {
                  return SizedBox(
                    height: 500, // Set a specific height here
                    child: MasonryGridView.count(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      crossAxisCount: 2,
                      mainAxisSpacing: 30,
                      crossAxisSpacing: 30,
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        Product product = snapshot.data![index];
                        return PlantCard(
                          key: ValueKey(product.id),
                          products: product,
                        );
                      },
                    ),
                  );
                }
              },
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}