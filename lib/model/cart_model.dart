class CartModel {
  List<Cart> carts;
  int total;
  int skip;
  int limit;

  CartModel({
    required this.carts,
    required this.total,
    required this.skip,
    required this.limit,
  });

  factory CartModel.fromJson(Map<String, dynamic> json) {
    return CartModel(
      carts: (json['carts'] as List<dynamic>).map((item) => Cart.fromJson(item)).toList(),
      total: json['total'],
      skip: json['skip'],
      limit: json['limit'],
    );
  }


}

class Cart {
  int id;
  List<Product> products;
  double total;
  double discountedTotal;
  int userId;
  int totalProducts;
  int totalQuantity;

  Cart({
    required this.id,
    required this.products,
    required this.total,
    required this.discountedTotal,
    required this.userId,
    required this.totalProducts,
    required this.totalQuantity,
  });

  factory Cart.fromJson(Map<String, dynamic> json) {
    return Cart(
      id: json['id'],
      products: (json['products'] as List<dynamic>).map((item) => Product.fromJson(item)).toList(),
      total: json['total'].toDouble(),
      discountedTotal: json['discountedTotal'].toDouble(),
      userId: json['userId'],
      totalProducts: json['totalProducts'],
      totalQuantity: json['totalQuantity'],
    );
  }

}

class Product {
  int id;
  String title;
  double price;
  int quantity;
  double total;
  double discountPercentage;
  double discountedTotal;
  String thumbnail;

  Product({
    required this.id,
    required this.title,
    required this.price,
    required this.quantity,
    required this.total,
    required this.discountPercentage,
    required this.discountedTotal,
    required this.thumbnail,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      title: json['title'],
      price: json['price'].toDouble(),
      quantity: json['quantity'],
      total: json['total'].toDouble(),
      discountPercentage: json['discountPercentage'].toDouble(),
      discountedTotal: json['discountedTotal'].toDouble(),
      thumbnail: json['thumbnail'],
    );
  }


}
