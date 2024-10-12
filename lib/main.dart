import 'package:flutter/material.dart';
import 'package:food_delivery/ui/splash_view.dart';
import 'dart:ui' as ui;

import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  @override
  State<MyApp> createState() => _MyAppState();
}
class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(builder: (BuildContext context, Widget? child) {
      return Stack(
        textDirection: ui.TextDirection.ltr,
        children: [
          MaterialApp(
            title: 'Food Delivery',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              useMaterial3: true,
            ),
            home: const SplashView(),
            navigatorKey: MyApp.navigatorKey,
          ),
        ],
      );
    });
  }
}



// class MyAppa extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//         debugShowCheckedModeBanner: false,
//         title: 'Flutter Demo',
//         theme: ThemeData(
//           primarySwatch: Colors.blue,
//           visualDensity: VisualDensity.adaptivePlatformDensity,
//         ),
//         home: Scaffold(
//           body: Center(
//             child: HorizontalContainerList(
//               itemCount: categories.length,
//               itemColor: (index) {
//                 return kMixedColors[index % kMixedColors.length];
//               },
//               itemBuilder: (index, selectedIndex) {
//                 final category = categories[index];
//                 return Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Container(
//                       height: selectedIndex == index ? 100 : 80,
//                       child: Image.asset(category.image),
//                     ),
//                     SizedBox(height: 15),
//                     Text(
//                       category.name,
//                       style: TextStyle(
//                           color: Colors.white,
//                           fontSize: selectedIndex == index ? 25 : 20),
//                     )
//                   ],
//                 );
//               },
//             ),
//           ),
//         ));
//   }
//
//   final List<Color> kMixedColors = [
//     Color(0xff71A5D7),
//     Color(0xff72CCD4),
//     Color(0xffFBAB57),
//     Color(0xffF8B993),
//     Color(0xff962D17),
//     Color(0xffc657fb),
//     Color(0xfffb8457),
//   ];
//
//   // static const String dessert = "$basePath/dessert.png";
//   // static const String indian_chutney = "$basePath/indian_chutney.png";
//   // static const String pizza = "$basePath/pizza.png";
//   // static const String salad = "$basePath/salad.png";
//   // static const String sweet_bowl = "$basePath/sweet_bowl.png";
//   // Image.asset(
//   // LocalImages.loginViewTop,
//   // width: 240,
//   // ),
//
//   final List<Category> categories = [
//     Category(
//         image: "assets/images/pizza.png",
//         name: "Two slices of pizza with delicious salami",
//         price: ""),
//     Category(
//         image: "assets/images/dessert.png",
//         name: "Dessert is the final course of a meal",
//         price: ""),
//     Category(
//         image: "assets/images/salad.png",
//         name: "Always dress your salad...",
//         price: ""),
//     Category(
//         image: "assets/images/indian_chutney.png",
//         name: "South Indian chutney with spices",
//         price: ""),
//     Category(
//         image: "assets/images/sweet_bowl.png",
//         name: "Which serve after lunch",
//         price: ""),
//   ];
// }
//
// class Category {
//   final String image;
//   final String name;
//   final String price;
//
//   Category({required this.image, required this.name, required this.price});
// }



class FoodApp extends StatelessWidget {
  const FoodApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FoodHomeScreen(),
    );
  }
}

class FoodHomeScreen extends StatelessWidget {
  const FoodHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: const Icon(Icons.menu, color: Colors.black),
        actions: const [
          Icon(Icons.search, color: Colors.black),
          SizedBox(width: 16),
        ],
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "100a Ealing Rd",
              style: TextStyle(color: Colors.black, fontSize: 16),
            ),
            Icon(Icons.arrow_drop_down, color: Colors.black),
            SizedBox(width: 8),
            Text(
              "24 mins",
              style: TextStyle(color: Colors.grey, fontSize: 14),
            ),
          ],
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Title: Hits of the week
              const Text(
                "Hits of the week",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),

              // Featured item card
              Container(
                decoration: BoxDecoration(
                  color: Colors.blue[100],
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Image.asset(
                              'assets/pizza.png',
                              // Replace with your image path
                              height: 80,
                              width: 80,
                              fit: BoxFit.cover,
                            ),
                          ),
                          const SizedBox(width: 16),
                          const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Two slices of pizza with delicious salami",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 8),
                              Text(
                                "\$12.40",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 16),
              // Horizontal category scroll
              const SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    CategoryButton(title: 'Salads'),
                    CategoryButton(title: 'Pizza'),
                    CategoryButton(title: 'Beverages'),
                    CategoryButton(title: 'Snacks'),
                    // Add more categories as needed
                  ],
                ),
              ),

              const SizedBox(height: 16),

              // List of food items
              const FoodItemCard(
                imagePath: 'assets/poke.png', // Replace with actual image path
                title: 'Poke with chicken',
                price: '\$47.00',
                calories: '325 Kcal',
              ),
              const SizedBox(height: 16),
              const FoodItemCard(
                imagePath: 'assets/salad.png', // Replace with actual image path
                title: 'Salad with radishes, tomatoes and mushrooms',
                price: '\$28.00',
                calories: '190 Kcal',
              ),
              // Add more food items as needed
            ],
          ),
        ),
      ),
    );
  }
}

class CategoryButton extends StatelessWidget {
  final String title;

  const CategoryButton({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.black, backgroundColor: Colors.grey[200], shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        onPressed: () {},
        child: Text(title),
      ),
    );
  }
}

class FoodItemCard extends StatelessWidget {
  final String imagePath;
  final String title;
  final String price;
  final String calories;

  const FoodItemCard({super.key, 
    required this.imagePath,
    required this.title,
    required this.price,
    required this.calories,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Image.asset(
            imagePath, // Replace with your image path
            height: 80,
            width: 80,
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(width: 16),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Text(
                  price,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(width: 16),
                Text(
                  calories,
                  style: const TextStyle(
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
