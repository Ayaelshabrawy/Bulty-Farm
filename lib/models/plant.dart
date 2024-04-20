class Plant {
  final String name, image ,category;
  final String?  size;
  final double price;
  Plant({
    required this.name,
    required this.image,
    required this.price,
    required this.category,
    this.size,
  });
}

List<Plant> plants = [

  Plant(
    name: "Bulty Fish ",
    category: "Fish",
    size: "small",
    price: 50,
    image: "assets/images/img_2.png",
  ),
  Plant(
    name: "Bulty Fish ",
    category: "Fish",
    size: "medium",
    price: 70,
    image: "assets/images/img_1.png",
  ),
  Plant(
    name: "Bulty Fish ",
    category: "Fish",
    size: "Large",
    price: 80,
    image: "assets/images/img.png",
  ),
  Plant(
    name: "Bulty Fish ",
    category: "Fish",
    size: "X_Large",
    price: 100,
    image: "assets/images/img_3.png",
  ),

  Plant(
    name: "coriander",
    category: "vegetables",
    size:"",
    price: 5,
    image: "assets/images/img_12.png",
  ),
  Plant(
    name: "watercress",
    category: "vegetables",
    price: 7.5,
    image: "assets/images/img_5.png",
  ),
  Plant(
    name: "lettuce",
    category: "vegetables",
    price: 12.99,
    image: "assets/images/img_6.png",
  ),
  Plant(
    name: "green onion",
    category: "vegetables",
    price: 10,
    image: "assets/images/img_9.png",
  ),
  Plant(
    name: "Dill",
    category: "vegetables",
    price: 5,
    image: "assets/images/img_11.png",
  ),
];


