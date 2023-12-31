import 'package:flutter/material.dart';

class Product {
  late final int id;
  late final String title;
  late final Map<String, String> description;
  late final String image;
  late final List<String> images;
  late final List<Map<String, dynamic>> colors;
  late final double rating;
  late final double price;
  late final String category;
  late bool isFavourite, isPopular;
  late List<Map> review;
  // late DateTime createdAt;

  Product({
    required this.id,
    required this.title,
    required this.description,
    required this.images,
    required this.colors,
    this.rating = 0.0,
    this.isFavourite = false,
    this.isPopular = false,
    this.review = const [],
    required this.price,
    required this.image,
    required this.category,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'image': image,
      'images': images,
      'category': category,
      'colors': colors,
      'rating': rating,
      'price': price,
      'isFavourite': isFavourite,
      'isPopular': isPopular,
      'review': review
    };
  }

  Product.fromMap(dynamic map) {
    id = map['id'];
    title = map['title'];
    description = map['description'];
    image = map['image'];
    category = map['category'];
    images = map['images'];
    colors = map['colors'];
    rating = map['rating'];
    price = map['price'];
    isFavourite = map['isFavourite'];
    isPopular = map['isPopular'];
    review = map['review'];
  }
  Product toEntity() => Product(
      id: id,
      title: title,
      description: description,
      image: image,
      images: images,
      category: category,
      colors: colors,
      rating: rating,
      price: price,
      isFavourite: isFavourite,
      isPopular: isPopular,
      review: review);
}

// Demo data
List<Product> demoProducts = [
  Product(
      id: 1,
      image: "assets/images/p1.png",
      images: [
        "assets/images/p1_2.jpg",
        "assets/images/p1_3.jpg",
        "assets/images/p1_4.jpg",
      ],
      category: "Clock , Wearable",
      colors: [
        {"colorName": "Red Rose", "color": const Color(0xFFF6625E)},
        {"colorName": "Purple", "color": const Color(0xFF836DB8)},
        {"colorName": "Gold", "color": const Color(0xFFDECB9C)},
      ],
      title: "Apple Watch",
      price: 3511.38,
      description: {
        "headline": "Get Apple TV+ free for a year",
        "description": description
      },
      rating: 4.8,
      isFavourite: true,
      isPopular: true,
      review: [
        {
          "id": 1,
          "time": "march 8 2022",
          "description": "this good product i love it so much"
        },
        {
          "id": 2,
          "time": "April 8 2022",
          "description": "this bad product i didn't love it at all"
        }
      ]),
  Product(
      id: 2,
      image: "assets/images/p2.png",
      images: [
        "assets/images/p2_1.png",
        "assets/images/p2_2.jpg",
      ],
      category: "Fashion",
      colors: [
        {"colorName": "Red Rose", "color": const Color(0xFFF6625E)},
        {"colorName": "Purple", "color": const Color(0xFF836DB8)},
        {"colorName": "Gold", "color": const Color(0xFFDECB9C)},
        {"colorName": "Red", "color": const Color(0xE7FF0D29)}
      ],
      title: "Apple Watch",
      price: 2749.22,
      description: {
        "headline": "Get Apple TV+ free for a year",
        "description": description
      },
      rating: 4.1,
      isPopular: true,
      review: [
        {
          "id": 1,
          "time": "march 8 2022",
          "description": "this good product i love it so much"
        },
        {
          "id": 2,
          "time": "April 8 2022",
          "description": "this bad product i didn't love it at all"
        }
      ]),
  Product(
      id: 3,
      image: "assets/images/p3.png",
      images: [
        "assets/images/p3_1.png",
      ],
      category: "Shoes",
      colors: [
        {"colorName": "Red Rose", "color": const Color(0xFFF6625E)},
        {"colorName": "Purple", "color": const Color(0xFF836DB8)},
        {"colorName": "Gold", "color": const Color(0xFFDECB9C)},
        {"colorName": "Red", "color": const Color(0xE7FF0D29)}
      ],
      title: "Nike Shoes",
      price: 1099.69,
      description: {
        "headline": "Get Nike shoes with another one as a gift",
        "description": description
      },
      rating: 4.1,
      isFavourite: false,
      review: [
        {
          "id": 1,
          "time": "march 8 2022",
          "description": "this good product i love it so much"
        },
        {
          "id": 2,
          "time": "April 8 2022",
          "description": "this bad product i didn't love it at all"
        }
      ]),
  Product(
    id: 4,
    image: "assets/images/p4.png",
    images: [
      "assets/images/p4.png",
      "assets/images/p4.png",
      "assets/images/p4.png",
    ],
    category: "Clocks",
    colors: [
      {"colorName": "Red Rose", "color": const Color(0xFFF6625E)},
      {"colorName": "Purple", "color": const Color(0xFF836DB8)},
      {"colorName": "Gold", "color": const Color(0xFFDECB9C)},
      {"colorName": "Red", "color": const Color(0xE7FF0D29)}
    ],
    title: "Apple Watch",
    price: 1099.69,
    description: {
      "headline": "Get Apple TV+ free for a year",
      "description": description
    },
    rating: 4.1,
    isFavourite: false,
    review: [
      {
        "id": 1,
        "time": "march 8 2022",
        "description": "this good product i love it so much"
      },
      {
        "id": 2,
        "time": "April 8 2022",
        "description": "this bad product i didn't love it at all"
      }
    ],
  ),
  Product(
    id: 5,
    image: "assets/images/p5_1.png",
    images: [
      "assets/images/p5_1.png",
      "assets/images/p5_1.png",
    ],
    category: "Computers",
    colors: [
      {"colorName": "Red Rose", "color": const Color(0xFFF6625E)},
      {"colorName": "Purple", "color": const Color(0xFF836DB8)},
      {"colorName": "Gold", "color": const Color(0xFFDECB9C)},
      {"colorName": "Red", "color": const Color(0xE7FF0D29)},
      {"colorName": "Yellow", "color": const Color(0xE7FFD70D)}
    ],
    title: "Apple Laptop",
    price: 1995.77,
    description: {
      "headline": "Get Apple TV+ free for a year",
      "description": description
    },
    rating: 4.4,
    isFavourite: true,
    isPopular: true,
    review: [
      {
        "id": 1,
        "time": "march 8 2022",
        "description": "this good product i love it so much"
      },
      {
        "id": 2,
        "time": "April 8 2022",
        "description": "this bad product i didn't love it at all"
      }
    ],
  ),
  Product(
      id: 6,
      title: "Apple iPhone 12",
      description: {
        "headline": "Get Apple iphone 12 pro",
        "description":
            "The iPhone 12 features a 6.1-inch (155 mm) display with Super Retina XDR OLED technology at a resolution of 2532 × 1170 pixels and a pixel density of about 460 ppi."
      },
      images: ["assets/images/p6_1.png", "assets/images/p6_2.png"],
      colors: [
        {"colorName": "Red Rose", "color": const Color(0xFFF6625E)},
        {"colorName": "Purple", "color": const Color(0xFF836DB8)},
        {"colorName": "Gold", "color": const Color(0xFFDECB9C)},
        {"colorName": "Red", "color": const Color(0xE7FF0D29)}
      ],
      price: 45369.10,
      image: "assets/images/p6_2.png",
      category: "Phones",
      review: [
        {
          "id": 1,
          "time": "May 25 2023",
          "description": "This product is too overtated."
        },
        {
          "id": 2,
          "time": "Jun 7 2023",
          "description": "I have been using ths product for over a year and i can say it is amazing."
        }
      ])
];

const String description =
    "Available when you purchase any new iPhone, iPad, iPod Touch, Mac or Apple TV, £4.99/month after free trial …";
