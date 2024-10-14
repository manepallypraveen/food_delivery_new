import 'package:flutter/material.dart';
import 'package:food_delivery/widgets/common_widgets.dart';
import '../configs/app_font.dart';
import '../configs/app_images.dart';
import '../configs/theme_config.dart';
import 'cart_database.dart';
import 'cart_item_model.dart';
import 'dashboard_view.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CartListBottomsheet extends ConsumerStatefulWidget {
  const CartListBottomsheet({
    required this.cartItems,
    super.key,
  });

  final List<CartItem> cartItems;

  @override
  ConsumerState<CartListBottomsheet> createState() =>
      _CartListBottomsheetState();
}

class _CartListBottomsheetState extends ConsumerState<CartListBottomsheet> {
  int _cutleryCounter = 0;

  void _incrementCounter() {
    setState(() {
      _cutleryCounter++;
    });
  }

  void _decrementCounter() {
    setState(() {
      if (_cutleryCounter > 0) {
        _cutleryCounter--;
      }
    });
  }

  List<int> _listCounters = [];
  var totalPrice = 0.0;

  @override
  void initState() {
    super.initState();
    initializeListCounters();
  }

  void initializeListCounters() {
    _listCounters = List<int>.filled(widget.cartItems.length, 0);
    for (int i = 0; i < widget.cartItems.length; i++) {
      _listCounters[i] = int.parse(widget.cartItems[i].size);
      totalPrice = totalPrice +
          double.parse(_listCounters[i].toString()) *
              double.parse(widget.cartItems[i].price);
    }
  }

  void _incrementListCounter(int index) {
    setState(() {
      _listCounters[index]++;
      // totalPrice = double.parse(_listCounters[index].toString()) * double.parse(cartItems[index].price);
    });
  }

  void _decrementListCounter(int index) {
    setState(() {
      if (_listCounters[index] > 0) {
        _listCounters[index]--;
      }
    });
  }

  Widget _buildListOfCart(List<CartItem> cartItems, int index) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: ThemeColor.white,
        radius: 30.0,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(50.0),
          child: Image.asset(
            cartItems[index].image,
            height: 150,
            width: 150,
            fit: BoxFit.fill,
          ),
        ),
      ),
      title: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            cartItems[index].name,
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
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  IconButton(
                    onPressed: () {
                      _decrementListCounter(index);
                      if (_listCounters[index] > 0) {
                        addOrUpdateToCart(
                          cartItems[index],
                          _listCounters[index].toString(),
                          context,
                        );
                      } else {
                        deleteFromCart(cartItems[index].id, context);
                      }
                    },
                    icon: Container(
                      height: 32,
                      width: 32,
                      decoration: BoxDecoration(
                        color: ThemeColor.backgroundColor,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10)),
                      ),
                      alignment: Alignment.center,
                      // duration: const Duration(seconds: 1),
                      child: Icon(
                        Icons.remove,
                        color: ThemeColor.black,
                      ),
                    ),
                  ),
                  widthSizedBox(5),
                  Text(
                    _listCounters[index] == int.parse(cartItems[index].size)
                        ? cartItems[index].size
                        : '${_listCounters[index]}',
                    style: AppFont.fontStyle(
                      size: 16,
                      color: ThemeColor.black,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  widthSizedBox(5),
                  IconButton(
                    onPressed: () {
                      _incrementListCounter(index);
                      addOrUpdateToCart(
                        cartItems[index],
                        _listCounters[index].toString(),
                        context,
                      );
                    },
                    icon: Container(
                      height: 32,
                      width: 32,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: ThemeColor.backgroundColor,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10)),
                      ),
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
      trailing: Text(
        _listCounters[index] == int.parse(cartItems[index].size)
            ? '\$${double.parse(cartItems[index].size) * double.parse(cartItems[index].price)}'
            : '\$${double.parse(_listCounters[index].toString()) * double.parse(cartItems[index].price)}',
        style: AppFont.fontStyle(
          color: ThemeColor.black,
          fontWeight: FontWeight.w600,
          size: 16,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: MediaQuery.of(context).viewInsets,
      child: Wrap(
        children: [
          Container(
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(30))),
            padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    heightSizedBox(20),
                    Padding(
                      padding: ltrb(left: 20, right: 20, top: 20),
                      child: Column(
                        children: [
                          Text(
                            "We will deliver in 24 minutes to the address:",
                            style: AppFont.fontStyle(
                                size: 24,
                                fontWeight: FontWeight.bold,
                                letterSpacing: -1),
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
                          heightSizedBox(10),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: widget.cartItems.length > 0 ? 150 : 40,
                      child: widget.cartItems.length > 0 &&
                              widget.cartItems != null
                          ? ListView.builder(
                              scrollDirection: Axis.vertical,
                              itemCount: widget.cartItems != null
                                  ? widget.cartItems!.length
                                  : null,
                              itemBuilder: (context, index) {
                                return _buildListOfCart(
                                    widget.cartItems!, index);
                              },
                            )
                          : Center(
                              child: Text(
                                'No Data to Display',
                                style: AppFont.fontStyle(
                                  color: ThemeColor.black,
                                  fontWeight: FontWeight.w600,
                                  size: 16,
                                ),
                              ),
                            ),
                    ),
                    Padding(
                      padding: ltrb(left: 20, right: 20),
                      child: Column(
                        children: [
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
                                  AppImages.fork,
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
                                      IconButton(
                                        onPressed: () {
                                          _decrementCounter();
                                        },
                                        icon: Container(
                                          height: 32,
                                          width: 32,
                                          decoration: BoxDecoration(
                                            color: ThemeColor.backgroundColor,
                                            borderRadius:
                                                const BorderRadius.all(
                                                    Radius.circular(10)),
                                          ),
                                          alignment: Alignment.center,
                                          child: Icon(
                                            Icons.remove,
                                            color: ThemeColor.black,
                                          ),
                                        ),
                                      ),
                                      widthSizedBox(5),
                                      Text(
                                        '${_cutleryCounter}',
                                        style: AppFont.fontStyle(
                                          size: 16,
                                          color: ThemeColor.black,
                                          fontWeight: FontWeight.normal,
                                        ),
                                      ),
                                      widthSizedBox(5),
                                      IconButton(
                                        onPressed: () {
                                          _incrementCounter();
                                        },
                                        icon: Container(
                                          height: 32,
                                          width: 32,
                                          alignment: Alignment.center,
                                          decoration: BoxDecoration(
                                            color: ThemeColor.backgroundColor,
                                            borderRadius:
                                                const BorderRadius.all(
                                                    Radius.circular(10)),
                                          ),
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
                          heightSizedBox(30),
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
                                            width: 1,
                                            color: ThemeColor.black,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(4),
                                        ),
                                        padding: ltrb(
                                            left: 4,
                                            right: 4,
                                            top: 2,
                                            bottom: 2),
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
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
                                        '\$${totalPrice}',
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
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  void deleteFromCart(int id, BuildContext context) async {
    final db = await CartDatabaseHelper().database;
    List<Map<String, dynamic>> existingItem = await db.query(
      'cart',
      where: 'id = ?',
      whereArgs: [id],
    );
    if (existingItem.isNotEmpty) {
      await db.delete(
        'cart',
        where: 'id = ?',
        whereArgs: [id],
      );
      flutterToast('Product deleted from cart', ThemeColor.buttonColor);
      // removeItemFromList(id);
    } else {
      flutterToast('Specific item which does not exist in the cart to delete.',
          ThemeColor.resendColor);
    }
  }

// void removeItemFromList(int id) {
//   setState(() {
//     int indexToRemove = widget.cartItems.indexWhere((item) => item.id == id);
//     if (indexToRemove != -1) {
//       widget.cartItems.removeAt(indexToRemove);
//       _listCounters.removeAt(indexToRemove);
//     }
//   });
// }
}
