import 'package:flutter/material.dart';
import 'package:bulty_farmm/cart/product-cart.dart';
import 'package:bulty_farmm/cart/cart.dart';
import 'package:provider/provider.dart';
import 'package:bulty_farmm/cart/cart_screen.dart';

class PlantCard extends StatefulWidget {
  final Product products;

  const PlantCard({
    Key? key,
    required this.products,
  }) : super(key: key);

  @override
  _PlantCardState createState() => _PlantCardState();
}

class _PlantCardState extends State<PlantCard> {
  bool isAddedToCart = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      padding: const EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(widget.products.image),
          const SizedBox(height: 5),
          Text(
            widget.products.name,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
          ),
          widget.products.category != null
              ? Text(
            widget.products.category!,
            style: const TextStyle(
              fontSize: 12,
              color: Colors.grey,
            ),
          )
              : const SizedBox(height: 30),
          Row(
            children: [
              Text(
                widget.products.price.toString(),
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Spacer(),

    IconButton(
    icon: Icon(
    isAddedToCart ? Icons.favorite : Icons.favorite_border,
    color: isAddedToCart ? Colors.red : Colors.black,
    ),
    onPressed: () {
    setState(() {
    if (isAddedToCart) {
    context.read<Cart>().addItem(widget.products);
    } else {
    context.read<Cart>().removeItem(widget.products.id);
    }
    isAddedToCart = !isAddedToCart;
    });
    },
    ),
    // Other widget code...
    ],
    ),
    ])) ;
    }
}