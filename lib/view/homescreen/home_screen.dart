import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/cart_controller.dart';
import '../detailscreen/detail_screen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final CartController cartController = Get.find<CartController>();
    TextEditingController searchController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: Text('Cart Application'),
      ),
      body: Obx(() {
        if (cartController.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        } else if (cartController.errorMessage.isNotEmpty) {
          return Center(
              child: Text('Error: ${cartController.errorMessage.value}'));
        } else if (cartController.cartModel == null ||
            cartController.cartModel!.carts.isEmpty) {
          return Center(child: Text('No carts available'));
        } else {
          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextField(
                  controller: searchController,
                  decoration: InputDecoration(
                    labelText: 'Search',
                    border: OutlineInputBorder(),
                    suffixIcon: Icon(Icons.search),
                  ),
                  onChanged: (value) {
                    cartController.cartModel?.carts = cartController
                            .cartModel?.carts
                            .where((cart) => cart.products.any((product) =>
                                product.title
                                    .toLowerCase()
                                    .contains(value.toLowerCase())))
                            .toList() ??
                        [];
                  },
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: cartController.cartModel?.carts.length ?? 0,
                  itemBuilder: (context, index) {
                    final cart = cartController.cartModel!.carts[index];
                    // Display only one product per cart
                    final product =
                        cart.products.isNotEmpty ? cart.products[0] : null;

                    return product != null
                        ? GestureDetector(
                            onTap: () {
                              Get.to(() => DetailScreen(product: product));
                            },
                            child: Container(
                              margin: EdgeInsets.all(10),
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(8),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.2),
                                    spreadRadius: 2,
                                    blurRadius: 5,
                                    offset: Offset(0, 3),
                                  ),
                                ],
                              ),
                              child: Row(
                                children: [
                                  Container(
                                    width: 80,
                                    height: 80,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: NetworkImage(product.thumbnail),
                                        fit: BoxFit.cover,
                                      ),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                  ),
                                  SizedBox(width: 10),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          product.title,
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16),
                                        ),
                                        Text('Price: \$${product.price}'),
                                        Text('Quantity: ${product.quantity}'),
                                        Text('Total: \$${product.total}'),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )
                        : SizedBox.shrink();
                  },
                ),
              ),
            ],
          );
        }
      }),
    );
  }
}
