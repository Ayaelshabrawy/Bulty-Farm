import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bulty_farmm/constants.dart';
import 'package:bulty_farmm/Customer/customer_market/market_crops.dart';


class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  List images = [
    "assets/images/img_3.png",
    "assets/images/img_6.png",
    "assets/images/img_5.png",


  ];

  late PageController pageController;

  int currentIndex = 0;

  @override
  void initState() {
    pageController = PageController(initialPage: 0);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Color(0xffffffff),
      appBar: AppBar(
        backgroundColor: Color(0xffffffff),
        actions: [
          TextButton(
            style: TextButton.styleFrom(
              foregroundColor: Colors.grey.shade800,
            ),
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => PlantFishMarket(),
                ),
              );
            },
            child: const Text("Skip"),

          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 350,
              child: PageView.builder(
                controller: pageController,
                itemCount: images.length,
                onPageChanged: (value) => setState(() {
                  currentIndex = value;
                }),
                itemBuilder: (context, index) => Image.asset(
                  images[index],
                  fit: BoxFit.fitHeight,
                ),
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                images.length,
                (index) => AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  margin: const EdgeInsets.only(right: 4),
                  width: index == currentIndex ? 15 : 6,
                  height: 6,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: index == currentIndex
                        ? Color(0xff76984b)
                        : Colors.grey.shade400,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 40),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 40),
              child: Text.rich(
                TextSpan(children: [
                  TextSpan(
                    text: "Enjoy your life with ",
                    style: TextStyle(
                      fontSize: 42,
                      fontWeight: FontWeight.w300,
                      fontFamily: 'TT Firs Neue',
                    ),
                  ),
                  TextSpan(
                    text: "Bulty Market",
                    style: TextStyle(
                      fontSize: 42,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'TT Firs Neue',
                    ),
                  )
                ]),
              ),
            ),
            const SizedBox(height: 40),
            Center(
              child: IconButton(
                onPressed: () async {
                  if (currentIndex == (images.length - 1)) {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PlantFishMarket (),
                      ),
                    );
                  } else {
                    await pageController.nextPage(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                    );
                  }
                },
                style: IconButton.styleFrom(
                  fixedSize: const Size(80, 80),
                  backgroundColor: Color(0xff76984b),
                  iconSize: 40,
                ),
                icon: const Icon(
                  CupertinoIcons.arrow_right,
                  color: Colors.white,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
