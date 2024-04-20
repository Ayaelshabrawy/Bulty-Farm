class Fish {
  final String name, image ,size ;
  final String? category;
  final double price;
  Fish({
    required this.name,
    required this.image,
    required this.price,
    required this.size ,
    this.category,
  });

}

List<Fish> fishes = [
  Fish(
    name: "Bulty Fish ",
    category: "Fish",
    size: "small",
    price: 50,
    image: "assets/images/fish/img_2.png",
  ),
  Fish(
    name: "Bulty Fish ",
      category: "Fish",
    size: "medium",
    price: 70,
    image: "assets/images/fish/img_1.png",
  ),
  Fish(
    name: "Bulty Fish ",
    category: "Fish",
    size: "Large",
    price: 80,
    image: "assets/images/fish/img.png",
  ),
  Fish(
    name: "Bulty Fish ",
    category: "Fish",
    size: "X_Large",
    price: 100,
    image: "assets/images/fish/img_3.png",
  ),

  Fish(
name: "coriander",
    category: "Crops",
    size:"",
price: 5,
image: "assets/images/img_12.png",
),
  Fish(
name: "watercress",
category: "Crops",
    size:"",
price: 7.5,
image: "assets/images/img_5.png",
),
  Fish(
name: "lettuce",
category: "Crops",
    size:"",
price: 12.99,
image: "assets/images/img_6.png",
),
  Fish(
name: "green onion",
category: "Crops",
    size:"",
price: 10,
image: "assets/images/img_9.png",
),
  Fish(
name: "Dill",
category: "Crops",
    size:"",
price: 5,
image: "assets/images/img_11.png",
),
];


