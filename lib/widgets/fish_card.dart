import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:bulty_farmm/models/fish.dart';

class FishCard extends StatelessWidget {
  const FishCard({
    Key? key,
    required this.fish,
  }) : super(key: key);

  final Fish fish;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        double cardWidth = constraints.maxWidth * 0.9; // Adjust as needed

        return Container(
          width: cardWidth,
          decoration: BoxDecoration(
            color: Color(0xffffffff),
            borderRadius: BorderRadius.circular(20),
          ),
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                fish.image,
                width: cardWidth, // Make the image width match the card width
                fit: BoxFit.cover, // Ensure the image covers the area
              ),
              const SizedBox(height: 5),
              Text(
                fish.name,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
              if (fish.category != null)
                Text(
                  fish.category!,
                  style: const TextStyle(
                    fontSize: 12,
                    color: Colors.grey,
                  ),
                ),
              Row(
                children: [
                  Text(
                    "\$${fish.price}",
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Spacer(),
                  Container(
                    width: 30,
                    height: 30,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.black,
                    ),
                    child: Icon(
                      Iconsax.heart,
                      color: Colors.white,
                      size: 18,
                    ),
                  )
                ],
              )
            ],
          ),
        );
      },
    );
  }
}
