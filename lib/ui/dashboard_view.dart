import 'package:flutter/material.dart';
import 'package:food_delivery/ui/cart_list_bottomSheet.dart';
import 'package:food_delivery/ui/horizontal_container_list.dart';
import 'package:food_delivery/widgets/common_widgets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../configs/app_font.dart';
import '../configs/app_images.dart';
import '../configs/theme_config.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'cart_database.dart';
import 'cart_item_model.dart';
import 'food_details_bottomSheet.dart';

class Category {
  final String image;
  final String name;
  final String price;

  Category({required this.image, required this.name, required this.price});
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

final List<CartItem> categoriesAllList = [
  CartItem(
    id: 0,
    name: "Super-easy Greek salad.",
    size: "",
    description:
        "A traditional Greek salad consists of sliced cucumbers, tomatoes, green bell pepper, red onion, olives, and feta cheese. This classic combination is delicious, so I stick to it, just adding a handful of mint leaves for a fresh finishing touch. ",
    price: '10.00',
    discount: "10",
    calories: "350",
    grams: "240",
    proteins: "240",
    fats: "240",
    carbs: "240",
    image: "assets/images/salad1.png",
    productType: "Salads",
  ),
  CartItem(
    id: 1,
    name: "Chicken caesar salad.",
    size: "",
    description:
        "Caesar salad is made with romaine lettuce, croutons, Parmesan cheese, and Caesar dressing.",
    price: "15.00",
    discount: "10",
    calories: "550",
    grams: "240",
    proteins: "240",
    fats: "240",
    carbs: "240",
    image: "assets/images/salad2.png",
    productType: "Salads",
  ),
  CartItem(
    id: 2,
    name: "Italian Pizza.",
    size: "",
    description:
        "Italian pizza is a flatbread dish that originated in Naples, Italy and is made with a variety of toppings baked on a leavened wheat dough base",
    price: "16.00",
    discount: "10",
    calories: "1200",
    grams: "240",
    proteins: "240",
    fats: "240",
    carbs: "240",
    image: "assets/images/pizza1.png",
    productType: "Pizza",
  ),
  CartItem(
    id: 3,
    name: "New York Style Pizza.",
    size: "",
    description:
        "New York-style pizza is a large, hand-tossed pizza with a thin, crispy crust and wide slices that can be folded. It's typically topped with tomato sauce and mozzarella cheese, but can also include other toppings like vegetables, pepperoni, or sausage. Here are some characteristics of New York-style pizza",
    price: "14.00",
    discount: "10",
    calories: "890",
    grams: "240",
    proteins: "240",
    fats: "240",
    carbs: "240",
    image: "assets/images/pizza2.png",
    productType: "Pizza",
  ),
  CartItem(
    id: 4,
    name: "Beer",
    size: "",
    description:
        "Beer is an alcoholic beverage that is made by brewing and fermenting starches from cereal grains, typically malted barley, and flavored with hops",
    price: "4.00",
    discount: "10",
    calories: "130",
    grams: "240",
    proteins: "240",
    fats: "240",
    carbs: "240",
    image: "assets/images/beverages1.png",
    productType: "Beverages",
  ),
  CartItem(
    id: 5,
    name: "Hot chocolate",
    size: "",
    description:
        "Hot chocolate is a hot drink made by melting chocolate or cocoa powder in hot milk or water, and usually with a sweetener.",
    price: "2.00",
    discount: "10",
    calories: "250",
    grams: "240",
    proteins: "240",
    fats: "240",
    carbs: "240",
    image: "assets/images/beverages2.png",
    productType: "Beverages",
  ),
  CartItem(
    id: 6,
    name: "Frankie.",
    size: "",
    description:
        "India's flavorful street food, also known as the Mumbai Burrito, Bombay Burrito, or roti wrap ",
    price: "6.00",
    discount: "10",
    calories: "250",
    grams: "240",
    proteins: "240",
    fats: "240",
    carbs: "240",
    image: "assets/images/snacks1.png",
    productType: "Snacks",
  ),
  CartItem(
    id: 7,
    name: "french fries",
    size: "",
    description:
        "French fries, also known as chips, finger chips, or french-fried potatoes, are a side dish or snack made from deep-fried potato strips",
    price: "8.00",
    discount: "10",
    calories: "350",
    grams: "240",
    proteins: "240",
    fats: "240",
    carbs: "240",
    image: "assets/images/snacks2.png",
    productType: "Snacks",
  ),
  CartItem(
    id: 8,
    name: "chocolate brownie",
    size: "",
    description:
        "Chocolate brownies are a baked American dessert or snack that are thick and square or rectangular in shape, and made with chocolate, flour, sugar, eggs, and fat",
    price: "47.00",
    discount: "10",
    calories: "240",
    grams: "240",
    proteins: "240",
    fats: "240",
    carbs: "240",
    image: "assets/images/desserts1.png",
    productType: "Desserts",
  ),
  CartItem(
    id: 9,
    name: "Cookies",
    size: "",
    description:
        "A Cookie is a small text based file given to you by a visited website that helps identify you to that site.",
    price: "53.00",
    discount: "10",
    calories: "450",
    grams: "240",
    proteins: "240",
    fats: "240",
    carbs: "240",
    image: "assets/images/desserts2.png",
    productType: "Desserts",
  )
];

final List<String> productTypes =
    categoriesAllList.map((category) => category.productType).toSet().toList();

class DashboardView extends ConsumerStatefulWidget {
  const DashboardView({super.key});

  @override
  ConsumerState<DashboardView> createState() => _DashboardViewState();
}

class _DashboardViewState extends ConsumerState<DashboardView> {

  @override
  void initState() {
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
          IconButton(
            iconSize: 20,
            onPressed: () {},
            icon: Icon(Icons.search_outlined, color: ThemeColor.black),
          ),
          IconButton(
            iconSize: 20,
            icon: Icon(Icons.shopping_cart, color: ThemeColor.black),
            onPressed: () async {
              List<CartItem> cartItems =
                  await CartDatabaseHelper().getCartItems();
              cartItems.length > 0
                  ? _cartListBottomSheet()
                  : flutterToast('No Data Display', ThemeColor.resendColor);
            },
          ),
          // if (_cartItemCount > 0)
          //   Positioned(
          //     right: 0,
          //     child: Container(
          //       padding: EdgeInsets.all(6),
          //       decoration: BoxDecoration(
          //         color: ThemeColor.resendColor,
          //         borderRadius: BorderRadius.circular(12),
          //       ),
          //       constraints: BoxConstraints(
          //         minWidth: 24,
          //         minHeight: 24,
          //       ),
          //       child: Text(
          //         '$_cartItemCount',
          //         style: TextStyle(
          //           color: Colors.white,
          //           fontSize: 12,
          //           fontWeight: FontWeight.bold,
          //         ),
          //         textAlign: TextAlign.center,
          //       ),
          //     ),
          //   ),
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
                        height: selectedIndex == index ? 140 : 100,
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

  List<CartItem>? filteredList = [];
  bool isFiltering = false;

  void updateFilter(String productType) {
    setState(() {
      filteredList = [];
      setState(() {
        filteredList = categoriesAllList
            .where((category) => category.productType == productType)
            .toList();
      });
    });
  }

  Widget _FilteredList() {
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
                              '${filteredList![index].calories} Kcal',
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
                _foodDetailsPageBottomSheet(filteredList![index]);
              },
            );
          },
        ));
  }

  Widget _defaultList() {
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
                              '${categoriesAllList[index].calories} Kcal',
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
                _foodDetailsPageBottomSheet(categoriesAllList[index]);
              },
            );
          },
        ));
  }

  void _foodDetailsPageBottomSheet(CartItem list) async {
    String? size = await CartDatabaseHelper().getItemSizeById(list.id);
    await showModalBottomSheet(
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(50),
          topRight: Radius.circular(50),
        ),
      ),
      context: context,
      builder: (ctx) {
        return FoodDetailsBottomSheet(
          list: list,
          size: size != null ? int.parse(size) : 0,
        );
      },
    );
  }

  void _cartListBottomSheet() async {
    List<CartItem> cartItems = await CartDatabaseHelper().getCartItems();

    await showModalBottomSheet(
        isScrollControlled: true,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(50), topRight: Radius.circular(50))),
        context: context,
        builder: (ctx) {
          return CartListBottomsheet(
            cartItems: cartItems,
          );
        });
  }
}

void addOrUpdateToCart(CartItem item, String size, BuildContext context) async {
  final db = await CartDatabaseHelper().database;
  List<Map<String, dynamic>> existingItem = await db.query(
    'cart',
    where: 'id = ?',
    whereArgs: [item.id],
  );
  if (existingItem.isNotEmpty) {
    CartItem updatedCartItem = CartItem(
      id: item.id,
      name: item.name,
      size: size,
      description: item.description,
      price: item.price,
      discount: item.discount,
      calories: item.calories,
      grams: item.grams,
      proteins: item.proteins,
      fats: item.fats,
      carbs: item.carbs,
      image: item.image,
      productType: item.productType,
    );
    await db.update(
      'cart',
      updatedCartItem.toMap(),
      where: 'id = ?',
      whereArgs: [item.id],
    );
    // flutterToast('Item updated in cart', ThemeColor.buttonColor);
  } else {
    CartItem cartItem = CartItem(
      id: item.id,
      name: item.name,
      size: size,
      description: item.description,
      price: item.price,
      discount: item.discount,
      calories: item.calories,
      grams: item.grams,
      proteins: item.proteins,
      fats: item.fats,
      carbs: item.carbs,
      image: item.image,
      productType: item.productType,
    );
    await CartDatabaseHelper().insertCartItem(cartItem);
    // flutterToast('Product added to cart.', ThemeColor.buttonColor);
  }
}

void clearCart() async {
  await CartDatabaseHelper().clearCart();
}
