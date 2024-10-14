import 'package:flutter/material.dart';
import 'package:food_delivery/widgets/common_widgets.dart';
import '../configs/app_font.dart';
import '../configs/theme_config.dart';
import '../configs/utils.dart';
import 'cart_item_model.dart';
import 'dashboard_view.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class FoodDetailsBottomSheet extends ConsumerStatefulWidget {
  const FoodDetailsBottomSheet(
      {required this.list, required this.size, super.key});

  final int size;
  final CartItem list;

  @override
  ConsumerState<FoodDetailsBottomSheet> createState() =>
      _FoodDetailsBottomSheetState();
}

class _FoodDetailsBottomSheetState
    extends ConsumerState<FoodDetailsBottomSheet> {
  int _counter = 0;

  @override
  void initState() {
    _counter = widget.size;
    super.initState();
  }

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _decrementCounter() {
    setState(() {
      if (_counter > 0) {
        _counter--;
      }
    });
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
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
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
                          widget.list.image,
                          height: 150,
                          width: 150,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ],
                ),
                heightSizedBox(10),
                Text(
                  widget.list.name,
                  style: AppFont.fontStyle(
                    color: ThemeColor.black,
                    fontWeight: FontWeight.w600,
                    size: 20,
                  ),
                ),
                heightSizedBox(10),
                Text(
                  widget.list.description,
                  style: AppFont.fontStyle(
                    color: ThemeColor.hintColor,
                    size: 12,
                  ),
                ),
                heightSizedBox(20),
                Container(
                  height: 80,
                  decoration: BoxDecoration(
                    color: ThemeColor.white,
                    border: Border.all(
                      width: 1,
                      color: ThemeColor.hintColor,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      widthSizedBox(5),
                      _buildNutritionalInfo(widget.list.calories, 'Kcal'),
                      _buildNutritionalInfo(widget.list.grams, 'grams'),
                      _buildNutritionalInfo(widget.list.proteins, 'proteins'),
                      _buildNutritionalInfo(widget.list.fats, 'fats'),
                      _buildNutritionalInfo(widget.list.carbs, 'carbs'),
                      widthSizedBox(5),
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
                    Icon(Icons.keyboard_arrow_right, color: ThemeColor.black),
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
                          width: 1,
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
                            onPressed: () {
                              _decrementCounter();
                            },
                          ),
                          widthSizedBox(6),
                          Text(
                            '$_counter',
                            style: AppFont.fontStyle(
                              color: ThemeColor.black,
                              size: 20,
                            ),
                          ),
                          widthSizedBox(6),
                          IconButton(
                            icon: Icon(
                              Icons.add,
                              color: ThemeColor.iconColor,
                            ),
                            onPressed: () {
                              _incrementCounter();
                            },
                          ),
                          widthSizedBox(10),
                        ],
                      ),
                    ),
                    widthSizedBox(20),
                    GestureDetector(
                      onTap: () {
                        if (_counter > 0) {
                          Navigator.pop(context);
                          customSnackBar(context,
                              '${_counter.toDouble() * double.parse(widget.list.price)}');
                          addOrUpdateToCart(
                              widget.list, _counter.toString(), context);
                        } else {
                          flutterToast(
                              'Select the quantity before adding to cart',
                              ThemeColor.resendColor);
                        }
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
                              '\$${_counter.toDouble() * double.parse(widget.list.price)}',
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
          )
        ],
      ),
    );
  }

  Widget _buildNutritionalInfo(String value, String label) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          value,
          style: AppFont.fontStyle(
            color: ThemeColor.black,
            fontWeight: FontWeight.w600,
            size: 12,
          ),
        ),
        heightSizedBox(5),
        Text(
          label,
          style: AppFont.fontStyle(
            color: ThemeColor.hintColor,
            size: 12,
          ),
        ),
      ],
    );
  }
}
