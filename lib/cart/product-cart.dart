import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
class Product {
  late final String id;
  final String name;
  final double price;
  final String category;
  final String image;

  Product({required this.id,

    required this.name,
    required this.price,
    required this.category,
    required this.image});

}
Future<List<Product>> fetchProducts() async {
  List<Product> products = [];

  try {
    // Access the Firestore instance
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    QuerySnapshot<Map<String, dynamic>> querySnapshot =
    await firestore.collection('products').get();

    // Extract data from each document
    for (var doc in querySnapshot.docs) {
      // Check if the document contains the 'price' field
      if (doc.data().containsKey('price')) {
        // Extract data from each document
        String id = doc['id'];
        String name = doc['name'];
        String image = doc['image'];
        String category = doc['category'];
        double price = (doc['price'] as num).toDouble();

        // Create a Product instance and add it to the list
        Product product = Product(
          id: id,
          name: name,
          image: image,
          category: category,
          price: price,
        );
        products.add(product);
      }
    }
  } catch (e) {
    // Handle errors here
    print('Error fetching products: $e');
  }

  return products;
}
