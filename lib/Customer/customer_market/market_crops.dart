import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:bulty_farmm/constants.dart';
import 'package:bulty_farmm/models/plant.dart';
import 'package:bulty_farmm/widgets/plant_card.dart';
import 'package:bulty_farmm/ProfileSettings/profileScreen.dart';
class  PlantFishMarket extends StatefulWidget {
  const PlantFishMarket({super.key});

  @override
  State<PlantFishMarket> createState() => _PlantFishMarketState();
}

class _PlantFishMarketState extends State< PlantFishMarket> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffececee),
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(CupertinoIcons.chevron_back),
        ),
        centerTitle: true,
        title: Text(
          "Bulty Market",
          style: TextStyle(
            color: Colors.grey.shade800,
            fontSize: 16,
              fontFamily: 'TT Firs Neue'
          ),
        ),
        actions: [
          IconButton(
            icon: Image.asset(
              'assets/images/avatar.png',
              height: 45,
              color: Colors.grey[800],
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ProfileScreen()),
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                children: [
                  Expanded(
                    flex: 5,
                    child: TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide.none,
                        ),
                        filled: true,
                        fillColor: Color(0xffffffff),
                        hintText: "Search here...",
                        hintStyle: const TextStyle(fontSize: 14),
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 40,
                          vertical: 15,
                        ),
                        prefixIcon: const Icon(CupertinoIcons.search),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    flex: 1,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Color(0xffffffff),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      padding: const EdgeInsets.symmetric(
                        vertical: 15,
                      ),
                      child: const Icon(Iconsax.setting_4),
                    ),
                  ),
                ],
              ),
            ),
            MasonryGridView(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              primary: false,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisSpacing: 30,
              mainAxisSpacing: 30,
              gridDelegate:
                  const SliverSimpleGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              ),
              children: [
                const Text(
                  "Found 10 Results",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 32,
                      fontFamily: 'TT Firs Neue'
                  ),
                ),
                for (var plant in plants) PlantCard(plant: plant),
              ],
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
