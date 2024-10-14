class CartItem {
  final int id;
  final String name;
  final String size;
  final String description;
  final String price;
  final String discount;
  final String calories;
  final String grams;
  final String proteins;
  final String fats;
  final String carbs;
  final String image;
  final String productType;

  CartItem({
    required this.id,
    required this.name,
    required this.size,
    required this.description,
    required this.price,
    required this.discount,
    required this.calories,
    required this.grams,
    required this.proteins,
    required this.fats,
    required this.carbs,
    required this.image,
    required this.productType,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'size': size,
      'description': description,
      'price': price,
      'discount': discount,
      'calories': calories,
      'grams': grams,
      'proteins': proteins,
      'fats': fats,
      'carbs': carbs,
      'image': image,
      'productType': productType,
    };
  }
}
