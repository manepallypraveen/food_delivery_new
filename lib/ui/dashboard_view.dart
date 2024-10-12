import 'package:flutter/material.dart';
import 'package:food_delivery/ui/horizontal_container_list.dart';
import 'package:food_delivery/widgets/common_widgets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../configs/app_font.dart';
import '../configs/app_images.dart';
import '../configs/local_images.dart';
import '../configs/theme_config.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Category {
  final String image;
  final String name;
  final String price;

  Category({required this.image, required this.name, required this.price});
}

class CategoryFoodList {
  final int Id;
  final String name;
  final String description;
  final String price;
  final String discount;
  final String calaries;
  final String grams;
  final String proteins;
  final String fats;
  final String carbs;
  final String image;
  final String producType;

  CategoryFoodList({
    required this.Id,
    required this.name,
    required this.description,
    required this.price,
    required this.discount,
    required this.calaries,
    required this.grams,
    required this.proteins,
    required this.fats,
    required this.carbs,
    required this.image,
    required this.producType,
  });
}

final List<Color> kMixedColors = [
  const Color(0xff87C6FE),
  const Color(0xffCBCAFF),
  const Color(0xfffbcef1),
  const Color(0xffd6bc9d),
  const Color(0xff71A5D7),
  const Color(0xff72CCD4),
];

final List<Category> categories = [
  Category(
      image: "assets/images/pizza.png",
      name: "Two slices of pizza with delicious salami.",
      price: "\$12.05"),
  Category(
      image: "assets/images/dessert.png",
      name: "Dessert is the final course of a meal.",
      price: "\$16.30"),
  Category(
      image: "assets/images/salad.png",
      name: "Salad with egg, cheese and shrimps.",
      price: "\$9.25"),
  Category(
      image: "assets/images/indian_chutney.png",
      name: "South Indian chutney with spices.",
      price: "\$47.35"),
  Category(
      image: "assets/images/sweet_bowl.png",
      name: "Which serve after lunch.",
      price: "\$4.65"),
];

final List<CategoryFoodList> categoriesAllList = [
  CategoryFoodList(
      Id: 0,
      name: "Super-easy Greek salad.",
      description:
          "A traditional Greek salad consists of sliced cucumbers, tomatoes, green bell pepper, red onion, olives, and feta cheese. This classic combination is delicious, so I stick to it, just adding a handful of mint leaves for a fresh finishing touch. ",
      price: '10.00',
      discount: "10",
      calaries: "350",
      grams: "240",
      proteins: "240",
      fats: "240",
      carbs: "240",
      image: "assets/images/salad1.png",
      producType: "Salads"),
  CategoryFoodList(
      Id: 1,
      name: "Chicken caesar salad.",
      description:
          "Caesar salad is made with romaine lettuce, croutons, Parmesan cheese, and Caesar dressing.",
      price: "15.00",
      discount: "10",
      calaries: "550",
      grams: "240",
      proteins: "240",
      fats: "240",
      carbs: "240",
      image: "assets/images/salad2.png",
      producType: "Salads"),
  CategoryFoodList(
      Id: 2,
      name: "Italian Pizza.",
      description:
          "Italian pizza is a flatbread dish that originated in Naples, Italy and is made with a variety of toppings baked on a leavened wheat dough base",
      price: "16.00",
      discount: "10",
      calaries: "1200",
      grams: "240",
      proteins: "240",
      fats: "240",
      carbs: "240",
      image: "assets/images/pizza1.png",
      producType: "Pizza"),
  CategoryFoodList(
      Id: 3,
      name: "New York Style Pizza.",
      description:
          "New York-style pizza is a large, hand-tossed pizza with a thin, crispy crust and wide slices that can be folded. It's typically topped with tomato sauce and mozzarella cheese, but can also include other toppings like vegetables, pepperoni, or sausage. Here are some characteristics of New York-style pizza",
      price: "14.00",
      discount: "10",
      calaries: "890",
      grams: "240",
      proteins: "240",
      fats: "240",
      carbs: "240",
      image: "assets/images/pizza2.png",
      producType: "Pizza"),
  CategoryFoodList(
      Id: 4,
      name: "Beer",
      description:
          "Beer is an alcoholic beverage that is made by brewing and fermenting starches from cereal grains, typically malted barley, and flavored with hops",
      price: "4.00",
      discount: "10",
      calaries: "130",
      grams: "240",
      proteins: "240",
      fats: "240",
      carbs: "240",
      image: "assets/images/beverages1.png",
      producType: "Beverages"),
  CategoryFoodList(
      Id: 5,
      name: "Hot chocolate",
      description:
          "Hot chocolate is a hot drink made by melting chocolate or cocoa powder in hot milk or water, and usually with a sweetener.",
      price: "2.00",
      discount: "10",
      calaries: "250",
      grams: "240",
      proteins: "240",
      fats: "240",
      carbs: "240",
      image: "assets/images/beverages2.png",
      producType: "Beverages"),
  CategoryFoodList(
      Id: 6,
      name: "Frankie.",
      description:
          "India's flavorful street food, also known as the Mumbai Burrito, Bombay Burrito, or roti wrap ",
      price: "6.00",
      discount: "10",
      calaries: "250",
      grams: "240",
      proteins: "240",
      fats: "240",
      carbs: "240",
      image: "assets/images/snacks1.png",
      producType: "Snacks"),
  CategoryFoodList(
      Id: 7,
      name: "french fries",
      description:
          "French fries, also known as chips, finger chips, or french-fried potatoes, are a side dish or snack made from deep-fried potato strips",
      price: "8.00",
      discount: "10",
      calaries: "350",
      grams: "240",
      proteins: "240",
      fats: "240",
      carbs: "240",
      image: "assets/images/snacks2.png",
      producType: "Snacks"),
  CategoryFoodList(
      Id: 8,
      name: "chocolate brownie",
      description:
          "Chocolate brownies are a baked American dessert or snack that are thick and square or rectangular in shape, and made with chocolate, flour, sugar, eggs, and fat",
      price: "47.00",
      discount: "10",
      calaries: "240",
      grams: "240",
      proteins: "240",
      fats: "240",
      carbs: "240",
      image: "assets/images/desserts1.png",
      producType: "Desserts"),
  CategoryFoodList(
      Id: 9,
      name: "Cookies",
      description:
          "A Cookie is a small text based file given to you by a visited website that helps identify you to that site.",
      price: "53.00",
      discount: "10",
      calaries: "450",
      grams: "240",
      proteins: "240",
      fats: "240",
      carbs: "240",
      image: "assets/images/desserts2.png",
      producType: "Desserts")
];

final List<String> productTypes = categoriesAllList
    .map((category) => category.producType)
    .toSet() // Remove duplicates
    .toList();

class DashboardView extends ConsumerStatefulWidget {
  const DashboardView({super.key});

  @override
  ConsumerState<DashboardView> createState() => _DashboardViewState();
}

class _DashboardViewState extends ConsumerState<DashboardView> {
  @override
  void initState() {
    for (var type in productTypes) {
      print('praveen type $type');
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: GestureDetector(
          onTap: () {
            // Navigator.pop(context);
          },
          child: Icon(Icons.menu, color: ThemeColor.black),
        ),
        title: Container(
          decoration: BoxDecoration(
            color: ThemeColor.black,
            borderRadius: BorderRadius.circular(16),
          ),
          height: 30,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Banjarahills road 15,",
                style: AppFont.fontStyle(color: ThemeColor.white, size: 10),
              ),
              Icon(Icons.arrow_drop_down, color: ThemeColor.white),
              widthSizedBox(8),
              Text(
                "24 mins",
                style: AppFont.fontStyle(color: ThemeColor.white, size: 10),
              ),
            ],
          ),
        ),
        actions: [
          Icon(Icons.search_outlined, color: ThemeColor.black),
          widthSizedBox(16)
        ],
        centerTitle: true,
      ),
      backgroundColor: ThemeColor.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: ltrb(left: 16),
                child: Text(
                  "Hits of the week",
                  style: AppFont.fontStyle(
                    size: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              heightSizedBox(16),
              HorizontalContainerList(
                // selectedCardHeightRatio: 0.4,
                // unSelectedCardHeightRatio: 0.2,
                itemCount: categories.length,
                itemColor: (index) {
                  return kMixedColors[index % kMixedColors.length];
                },
                itemBuilder: (index, selectedIndex) {
                  final category = categories[index];
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: selectedIndex == index ? 120 : 80,
                        child: Image.asset(category.image),
                      ),
                      heightSizedBox(16),
                      Padding(
                        padding: ltrb(left: 16, right: 16),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Text(
                                category.name,
                                style: AppFont.fontStyle(
                                    color: ThemeColor.black,
                                    fontWeight: FontWeight.w600,
                                    size: selectedIndex == index ? 16 : 12),
                              ),
                            ),
                            widthSizedBox(8),
                            Container(
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: ThemeColor.black,
                                borderRadius: BorderRadius.circular(16),
                              ),
                              height: 30,
                              width: selectedIndex == index ? 70 : 60,
                              child: Text(
                                category.price,
                                style: AppFont.fontStyle(
                                    color: ThemeColor.white,
                                    fontWeight: selectedIndex == index
                                        ? FontWeight.bold
                                        : FontWeight.normal,
                                    size: selectedIndex == index ? 16 : 12),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  );
                },
              ),
              heightSizedBox(20),
              Padding(
                padding: ltrb(left: 20, right: 20),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      padding: ltrb(left: 3, right: 3, top: 3, bottom: 3),
                      decoration: BoxDecoration(
                        color: ThemeColor.backgroundColor,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10)),
                      ),
                      // duration: const Duration(seconds: 1),
                      child: GestureDetector(
                        child: SvgPicture.asset(
                          AppImages.filter_circle,
                        ),
                        onTap: () {
                          setState(() {
                            isFiltering = false;
                          });
                        },
                      ),
                    ),
                    Expanded(
                      child: SizedBox(
                        height: 30,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: productTypes.length,
                          // controller: _scrollController,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                setState(() {
                                  isFiltering = true;
                                  updateFilter(productTypes[index]);
                                });
                              },
                              child: Padding(
                                padding: ltrb(left: 5, right: 5),
                                child: Container(
                                  padding: ltrb(left: 10, right: 10),
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    color: ThemeColor.backgroundColor,
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(10)),
                                  ),
                                  child: Text(
                                    textAlign: TextAlign.center,
                                    productTypes[index],
                                    style: AppFont.fontStyle(
                                        fontWeight: FontWeight.w600,
                                        color: ThemeColor.black,
                                        size: 12),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              isFiltering ? _FilteredList() : _defaultList(),
              heightSizedBox(50)
            ],
          ),
        ),
      ),
    );
  }

  List<CategoryFoodList>? filteredList = [];
  bool isFiltering = false;

  void updateFilter(String productType) {
    setState(() {
      filteredList = [];
      setState(() {
        filteredList = categoriesAllList
            .where((category) => category.producType == productType)
            .toList();
      });
    });
  }

  void customSnackBar() {
    snackbarEvent('24 min', '\$${47.00}', context);
  }

  Widget _FilteredList() {
    print('praveen filter $isFiltering ');
    print('praveen filteredList $filteredList ');

    return SizedBox(
        height: 450,
        child: ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: filteredList!.length,
          itemBuilder: (context, index) {
            return InkWell(
              child: Padding(
                padding: ltrb(left: 15, right: 15, top: 15, bottom: 15),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 50.0,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(50.0),
                        child: Image.asset(
                          filteredList![index].image,
                          height: 150,
                          width: 150,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    widthSizedBox(20),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          textAlign: TextAlign.center,
                          filteredList![index].name,
                          style: AppFont.fontStyle(
                              fontWeight: FontWeight.w500,
                              color: ThemeColor.black,
                              size: 12),
                        ),
                        heightSizedBox(10),
                        Row(
                          children: [
                            Container(
                              padding:
                                  ltrb(left: 10, right: 10, bottom: 5, top: 5),
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: ThemeColor.backgroundColor,
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(15)),
                              ),
                              child: Text(
                                textAlign: TextAlign.center,
                                '\$${filteredList![index].price}',
                                style: AppFont.fontStyle(
                                    fontWeight: FontWeight.w600,
                                    color: ThemeColor.black,
                                    size: 12),
                              ),
                            ),
                            widthSizedBox(15),
                            Text(
                              textAlign: TextAlign.center,
                              '${filteredList![index].calaries} Kcal',
                              style: AppFont.fontStyle(
                                  fontWeight: FontWeight.w500,
                                  color: ThemeColor.unSelectColor,
                                  size: 12),
                            )
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              ),
              onTap: () {
                _foodDetailsBottomSheet(filteredList![index]);
              },
            );
          },
        ));
  }

  Widget _defaultList() {
    print('praveen filter $isFiltering ');
    print('praveen filteredList $filteredList ');

    return SizedBox(
        height: 450,
        child: ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: categoriesAllList.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              child: Padding(
                padding: ltrb(left: 15, right: 15, top: 15, bottom: 15),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 50.0,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(50.0),
                        child: Image.asset(
                          categoriesAllList[index].image,
                          height: 150,
                          width: 150,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    widthSizedBox(20),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          textAlign: TextAlign.center,
                          categoriesAllList[index].name,
                          style: AppFont.fontStyle(
                              fontWeight: FontWeight.w500,
                              color: ThemeColor.black,
                              size: 12),
                        ),
                        heightSizedBox(10),
                        Row(
                          children: [
                            Container(
                              padding:
                                  ltrb(left: 10, right: 10, bottom: 5, top: 5),
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: ThemeColor.backgroundColor,
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(15)),
                              ),
                              child: Text(
                                textAlign: TextAlign.center,
                                '\$${categoriesAllList![index].price}',
                                style: AppFont.fontStyle(
                                    fontWeight: FontWeight.w600,
                                    color: ThemeColor.black,
                                    size: 12),
                              ),
                            ),
                            widthSizedBox(15),
                            Text(
                              textAlign: TextAlign.center,
                              '${categoriesAllList[index].calaries} Kcal',
                              style: AppFont.fontStyle(
                                  fontWeight: FontWeight.w500,
                                  color: ThemeColor.unSelectColor,
                                  size: 12),
                            )
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              ),
              onTap: () {
                _foodDetailsBottomSheet(categoriesAllList[index]);
              },
            );
          },
        ));
  }

  void _foodDetailsBottomSheet(CategoryFoodList list) async {
    await showModalBottomSheet(
        isScrollControlled: true,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(50), topRight: Radius.circular(50))),
        context: context,
        builder: (ctx) {
          return Padding(
            padding: MediaQuery.of(context).viewInsets,
            child: Wrap(
              children: [
                Container(
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(30))),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.end,
                      //   children: [
                      //     IconButton(
                      //       icon: const Icon(Icons.clear),
                      //       onPressed: () {
                      //         Navigator.pop(context);
                      //       },
                      //     ),
                      //   ],
                      // ),
                      heightSizedBox(10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CircleAvatar(
                            backgroundColor: ThemeColor.white,
                            radius: 100.0,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(50.0),
                              child: Image.asset(
                                list.image,
                                height: 150,
                                width: 150,
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            list.name,
                            style: AppFont.fontStyle(
                                color: ThemeColor.black,
                                fontWeight: FontWeight.w600,
                                size: 20),
                          ),
                          heightSizedBox(10),
                          Text(
                            list.description,
                            style: AppFont.fontStyle(
                                color: ThemeColor.hintColor, size: 12),
                          ),
                          heightSizedBox(20),
                          Container(
                            height: 80,
                            decoration: BoxDecoration(
                              color: ThemeColor.white,
                              border: Border.all(
                                width: 1, //
                                color: ThemeColor.hintColor,
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                widthSizedBox(5),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      list.calaries,
                                      style: AppFont.fontStyle(
                                          color: ThemeColor.black,
                                          fontWeight: FontWeight.w600,
                                          size: 12),
                                    ),
                                    heightSizedBox(5),
                                    Text(
                                      'Kcal',
                                      style: AppFont.fontStyle(
                                          color: ThemeColor.hintColor,
                                          size: 12),
                                    ),
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      list.grams,
                                      style: AppFont.fontStyle(
                                          color: ThemeColor.black,
                                          fontWeight: FontWeight.w600,
                                          size: 12),
                                    ),
                                    heightSizedBox(5),
                                    Text(
                                      'grams',
                                      style: AppFont.fontStyle(
                                          color: ThemeColor.hintColor,
                                          size: 12),
                                    ),
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      list.proteins,
                                      style: AppFont.fontStyle(
                                          color: ThemeColor.black,
                                          fontWeight: FontWeight.w600,
                                          size: 12),
                                    ),
                                    heightSizedBox(5),
                                    Text(
                                      'proteins',
                                      style: AppFont.fontStyle(
                                          color: ThemeColor.hintColor,
                                          size: 12),
                                    ),
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      list.fats,
                                      style: AppFont.fontStyle(
                                          color: ThemeColor.black,
                                          fontWeight: FontWeight.w600,
                                          size: 12),
                                    ),
                                    heightSizedBox(5),
                                    Text(
                                      'fats',
                                      style: AppFont.fontStyle(
                                          color: ThemeColor.hintColor,
                                          size: 12),
                                    ),
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      list.carbs,
                                      style: AppFont.fontStyle(
                                          color: ThemeColor.black,
                                          fontWeight: FontWeight.w600,
                                          size: 12),
                                    ),
                                    heightSizedBox(5),
                                    Text(
                                      'carbs',
                                      style: AppFont.fontStyle(
                                          color: ThemeColor.hintColor,
                                          size: 12),
                                    ),
                                  ],
                                ),
                                widthSizedBox(5)
                              ],
                            ),
                          ),
                          heightSizedBox(20),
                          Row(
                            children: [
                              Text(
                                'Add in poke',
                                style: AppFont.fontStyle(
                                  color: ThemeColor.black,
                                  fontWeight: FontWeight.w600,
                                  size: 20,
                                ),
                              ),
                              const Spacer(),
                              // This pushes the right Icon to the far right
                              Icon(
                                Icons.keyboard_arrow_right,
                                color: ThemeColor.black,
                              ),
                            ],
                          ),
                          heightSizedBox(30),
                          Row(
                            children: [
                              Container(
                                height: 40,
                                decoration: BoxDecoration(
                                  color: ThemeColor.lightGreyColor,
                                  border: Border.all(
                                    width: 1, //
                                    color: ThemeColor.lightGreyColor,
                                  ),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    widthSizedBox(10),
                                    IconButton(
                                      icon: Icon(
                                        Icons.remove,
                                        color: ThemeColor.iconColor,
                                      ),
                                      onPressed: () {},
                                    ),
                                    widthSizedBox(10),
                                    Text(
                                      '1',
                                      style: AppFont.fontStyle(
                                          color: ThemeColor.black, size: 20),
                                    ),
                                    widthSizedBox(10),
                                    IconButton(
                                      icon: Icon(
                                        Icons.add,
                                        color: ThemeColor.iconColor,
                                      ),
                                      onPressed: () {},
                                    ),
                                    widthSizedBox(10),
                                  ],
                                ),
                              ),
                              widthSizedBox(20),
                              GestureDetector(
                                onTap: () {
                                  Navigator.pop(context);
                                  customSnackBar();
                                },
                                child: Container(
                                  height: 40,
                                  decoration: BoxDecoration(
                                    color: ThemeColor.black,
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      widthSizedBox(10),
                                      Text(
                                        'Add to cart',
                                        style: AppFont.fontStyle(
                                          color: ThemeColor.white,
                                          fontWeight: FontWeight.w400,
                                          size: 16,
                                        ),
                                      ),
                                      widthSizedBox(20),
                                      Text(
                                        '\$${list.price}',
                                        style: AppFont.fontStyle(
                                          color: ThemeColor.white,
                                          fontWeight: FontWeight.w400,
                                          size: 16,
                                        ),
                                      ),
                                      widthSizedBox(10),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          heightSizedBox(30),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          );
        });
  }

  snackbarEvent(time, price, BuildContext context) {
    showSnackBarClickEvent(
        backgroundColor: Colors.black,
        time: time,
        price: price,
        duration: const Duration(seconds: 2),
        context: context);
  }

  void showSnackBarClickEvent(
      {required BuildContext context,
      required String time,
      required String price,
      Color? backgroundColor,
      Duration? duration}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          side: BorderSide(color: ThemeColor.black, width: 1),
          borderRadius: BorderRadius.circular(12),
        ),
        elevation: 0,
        duration: duration ?? const Duration(seconds: 3),
        backgroundColor: backgroundColor ?? Colors.black87,
        content: InkWell(
          onTap: () {
            _cartListBottomSheet();
          },
          child: SizedBox(
            height: 30,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  textAlign: TextAlign.center,
                  'Cart',
                  style: AppFont.fontStyle(
                      fontWeight: FontWeight.w500,
                      color: ThemeColor.white,
                      size: 14),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      textAlign: TextAlign.center,
                      time,
                      style: AppFont.fontStyle(
                          fontWeight: FontWeight.w500,
                          color: ThemeColor.white,
                          size: 12),
                    ),
                    SvgPicture.asset(
                      AppImages.dot,
                      color: ThemeColor.white,
                    ),
                    Text(
                      textAlign: TextAlign.center,
                      price,
                      style: AppFont.fontStyle(
                          fontWeight: FontWeight.w500,
                          color: ThemeColor.white,
                          size: 16),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _cartListBottomSheet() async {
    await showModalBottomSheet(
        isScrollControlled: true,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(50), topRight: Radius.circular(50))),
        context: context,
        builder: (ctx) {
          return Padding(
            padding: MediaQuery.of(context).viewInsets,
            child: Wrap(
              children: [
                Container(
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(30))),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.end,
                      //   children: [
                      //     IconButton(
                      //       icon: const Icon(Icons.clear),
                      //       onPressed: () {
                      //         Navigator.pop(context);
                      //       },
                      //     ),
                      //   ],
                      // ),
                      heightSizedBox(20),
                      Text(
                        "We will deliver in 24 minutes to the address:",
                        style: AppFont.fontStyle(
                          size: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      heightSizedBox(20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "100a Ealing Road",
                            style: AppFont.fontStyle(
                              size: 14,
                              color: ThemeColor.black,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          widthSizedBox(5),
                          Text(
                            "Change address",
                            style: AppFont.fontStyle(
                                color: ThemeColor.hintColor,
                                fontWeight: FontWeight.w600,
                                size: 12),
                          ),
                        ],
                      ),
                      heightSizedBox(30),
                      Row(
                        children: [
                          CircleAvatar(
                            backgroundColor: ThemeColor.white,
                            radius: 30.0,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(50.0),
                              child: Image.asset(
                                'assets/images/salad1.png',
                                height: 150,
                                width: 150,
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                          widthSizedBox(20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Poak with chicken and corn",
                                    style: AppFont.fontStyle(
                                      size: 14,
                                      color: ThemeColor.black,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  heightSizedBox(5),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      GestureDetector(
                                        onTap: () {},
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color: ThemeColor.backgroundColor,
                                            borderRadius:
                                                const BorderRadius.all(
                                                    Radius.circular(10)),
                                          ),
                                          alignment: Alignment.center,
                                          // duration: const Duration(seconds: 1),
                                          child: Icon(
                                            Icons.remove,
                                            color: ThemeColor.black,
                                          ),
                                          height: 35,
                                          width: 35,
                                        ),
                                      ),
                                      widthSizedBox(10),
                                      Text(
                                        "1",
                                        style: AppFont.fontStyle(
                                          size: 16,
                                          color: ThemeColor.black,
                                          fontWeight: FontWeight.normal,
                                        ),
                                      ),
                                      widthSizedBox(10),
                                      GestureDetector(
                                        onTap: () {},
                                        child: Container(
                                          height: 35,
                                          width: 35,
                                          alignment: Alignment.center,
                                          decoration: BoxDecoration(
                                            color: ThemeColor.backgroundColor,
                                            borderRadius:
                                                const BorderRadius.all(
                                                    Radius.circular(10)),
                                          ),
                                          // duration: const Duration(seconds: 1),
                                          child: Icon(
                                            Icons.add,
                                            color: ThemeColor.black,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              widthSizedBox(30),
                              Text(
                                '\$47.00',
                                style: AppFont.fontStyle(
                                  color: ThemeColor.black,
                                  fontWeight: FontWeight.w600,
                                  size: 16,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                      heightSizedBox(30),
                      commonDivider(
                        thickness: 1.0,
                        indent: 0,
                        endIndent: 0,
                        color: ThemeColor.borderColor,
                        height: 1,
                      ),
                      heightSizedBox(30),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 24,
                            child: Image.asset(
                              LocalImages.fork,
                            ),
                          ),
                          Text(
                            "Cutlery",
                            style: AppFont.fontStyle(
                              size: 14,
                              color: ThemeColor.black,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  GestureDetector(
                                    onTap: () {},
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: ThemeColor.backgroundColor,
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(10)),
                                      ),
                                      alignment: Alignment.center,
                                      // duration: const Duration(seconds: 1),
                                      child: Icon(
                                        Icons.remove,
                                        color: ThemeColor.black,
                                      ),
                                      height: 35,
                                      width: 35,
                                    ),
                                  ),
                                  widthSizedBox(10),
                                  Text(
                                    "1",
                                    style: AppFont.fontStyle(
                                      size: 16,
                                      color: ThemeColor.black,
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                  widthSizedBox(10),
                                  GestureDetector(
                                    onTap: () {},
                                    child: Container(
                                      height: 35,
                                      width: 35,
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                        color: ThemeColor.backgroundColor,
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(10)),
                                      ),
                                      // duration: const Duration(seconds: 1),
                                      child: Icon(
                                        Icons.add,
                                        color: ThemeColor.black,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                      heightSizedBox(30),
                      commonDivider(
                        thickness: 1.0,
                        indent: 0,
                        endIndent: 0,
                        color: ThemeColor.borderColor,
                        height: 1,
                      ),
                      heightSizedBox(30),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Delivery",
                                style: AppFont.fontStyle(
                                  size: 14,
                                  color: ThemeColor.black,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              heightSizedBox(5),
                              Text(
                                "free delivery from \$30",
                                style: AppFont.fontStyle(
                                  size: 14,
                                  color: ThemeColor.hintColor,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                          widthSizedBox(30),
                          Text(
                            '\$0.00',
                            style: AppFont.fontStyle(
                              color: ThemeColor.black,
                              fontWeight: FontWeight.w600,
                              size: 16,
                            ),
                          ),
                        ],
                      ),
                      heightSizedBox(80),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Payment Method",
                                style: AppFont.fontStyle(
                                  size: 14,
                                  color: ThemeColor.hintColor,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              heightSizedBox(5),
                              Row(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      color: ThemeColor.white,
                                      border: Border.all(
                                        width: 1, //
                                        color: ThemeColor.black,
                                      ),
                                      borderRadius: BorderRadius.circular(4),
                                    ),
                                    padding: ltrb(left: 4,right:4 ,top: 2,bottom: 2),
                                    child: Row(
                                      children: [
                                        Icon(
                                          Icons.apple,
                                          size: 10,
                                          color: ThemeColor.black,
                                        ),
                                        widthSizedBox(2),
                                        Text(
                                          "Pay",
                                          style: AppFont.fontStyle(
                                            size: 10,
                                            color: ThemeColor.black,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  widthSizedBox(10),
                                  Text(
                                    "Apple pay",
                                    style: AppFont.fontStyle(
                                      size: 14,
                                      color: ThemeColor.black,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          widthSizedBox(30),
                          Icon(
                            Icons.keyboard_arrow_right,
                            color: ThemeColor.black,
                          ),
                        ],
                      ),
                      heightSizedBox(30),
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Container(
                          height: 50,
                          decoration: BoxDecoration(
                            color: ThemeColor.black,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: ltrb(left: 20),
                                child: Text(
                                  textAlign: TextAlign.center,
                                  'Pay',
                                  style: AppFont.fontStyle(
                                      fontWeight: FontWeight.w500,
                                      color: ThemeColor.white,
                                      size: 14),
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    textAlign: TextAlign.center,
                                    '24 min',
                                    style: AppFont.fontStyle(
                                        fontWeight: FontWeight.w500,
                                        color: ThemeColor.white,
                                        size: 12),
                                  ),
                                  SvgPicture.asset(
                                    AppImages.dot,
                                    color: ThemeColor.white,
                                  ),
                                  Text(
                                    textAlign: TextAlign.center,
                                    '\$${47.00}',
                                    style: AppFont.fontStyle(
                                        fontWeight: FontWeight.w500,
                                        color: ThemeColor.white,
                                        size: 16),
                                  ),
                                  widthSizedBox(20)
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          );
        });
  }
}

// {
// "Status": true,
// "Message": "food loaded successfully!",
// "Data": {
// "foodData": [
// {
// "Id": 0,
// "name": "Super-easy Greek salad.",
// "description": "A traditional Greek salad consists of sliced cucumbers, tomatoes, green bell pepper, red onion, olives, and feta cheese. This classic combination is delicious, so I stick to it, just adding a handful of mint leaves for a fresh finishing touch. ",
// "price": "$10.00",
// "discount": "10",
// "calaries": "350",
// "grams": "240",
// "proteins": "240",
// "fats": "240",
// "carbs": "240",
// "image": "assets/images/salad1.png",
// "producType": "salads"
// },
// {
// "Id": 1,
// "name": "Chicken caesar salad.",
// "description": "Caesar salad is made with romaine lettuce, croutons, Parmesan cheese, and Caesar dressing.",
// "price": "$15.00",
// "discount": "10",
// "calaries": "550",
// "grams": "240",
// "proteins": "240",
// "fats": "240",
// "carbs": "240",
// "image": "assets/images/salad2.png",
// "producType": "salads"
// },
// {
// "Id": 2,
// "name": "Italian Pizza.",
// "description": "Italian pizza is a flatbread dish that originated in Naples, Italy and is made with a variety of toppings baked on a leavened wheat dough base",
// "price": "$16.00",
// "discount": "10",
// "calaries": "1200",
// "grams": "240",
// "proteins": "240",
// "fats": "240",
// "carbs": "240",
// "image": "assets/images/pizza1.png",
// "producType": "pizzas"
// },
// {
// "Id": 3,
// "name": "New York Style Pizza.",
// "description": "New York-style pizza is a large, hand-tossed pizza with a thin, crispy crust and wide slices that can be folded. It's typically topped with tomato sauce and mozzarella cheese, but can also include other toppings like vegetables, pepperoni, or sausage. Here are some characteristics of New York-style pizza",
// "price": "$14.00",
// "discount": "10",
// "calaries": "890",
// "grams": "240",
// "proteins": "240",
// "fats": "240",
// "carbs": "240",
// "image": "assets/images/pizza2.png",
// "producType": "pizzas"
// },
// {
// "Id": 4,
// "name": "Beer",
// "description": "Beer is an alcoholic beverage that is made by brewing and fermenting starches from cereal grains, typically malted barley, and flavored with hops",
// "price": "$4.00",
// "discount": "10",
// "calaries": "130",
// "grams": "240",
// "proteins": "240",
// "fats": "240",
// "carbs": "240",
// "image": "assets/images/beverages1.png",
// "producType": "beverages"
// },
// {
// "Id": 5,
// "name": "Hot chocolate",
// "description": "Hot chocolate is a hot drink made by melting chocolate or cocoa powder in hot milk or water, and usually with a sweetener.",
// "price": "$2.00",
// "discount": "10",
// "calaries": "250",
// "grams": "240",
// "proteins": "240",
// "fats": "240",
// "carbs": "240",
// "image": "assets/images/beverages2.png",
// "producType": "beverages"
// ",
// "
// "Id": 6,
// "name": "Frankie.",
// "description": "India's flavorful street food, also known as the Mumbai Burrito, Bombay Burrito, or roti wrap ",
// "price": "$6.00",
// "discount": "10",
// "calaries": "250",
// "grams": "240",
// "proteins": "240",
// "fats": "240",
// "carbs": "240",
// "image": "assets/images/snacks.png",
// "producType": "snacks"
// ",
// "
// "Id": 7,
// "name": "french fries",
// "description": "French fries, also known as chips, finger chips, or french-fried potatoes, are a side dish or snack made from deep-fried potato strips",
// "price": "$8.00",
// "discount": "10",
// "calaries": "350",
// "grams": "240"
// "proteins": "240",
// "fats": "240",
// "carbs": "240",
// "image": "assets/images/snacks2.png",
// "producType": "snacks"
// ",
// "
// "Id": 8,
// "name": "chocolate brownie",
// "description": "Chocolate brownies are a baked American dessert or snack that are thick and square or rectangular in shape, and made with chocolate, flour, sugar, eggs, and fat",
// "price": "$47.00",
// "discount": "10",
// "calaries": "240",
// "grams": "240",
// "proteins": "240",
// "fats": "240",
// "carbs": "240",
// "image": "assets/images/desserts1.png",
// "producType": "desserts"
// ",
// "
// "Id": 9,
// "name": "Cookies",
// "description": "A Cookie is a small text based file given to you by a visited website that helps identify you to that site.",
// "price": "$53.00",
// "discount": "10",
// "calaries": "450",
// "grams": "240",
// "proteins": "240",
// "fats": "240",
// "carbs": "240",
// "image": "assets/images/desserts2.png",
// "producType": "desserts"
// }
// ]
// }
// }
