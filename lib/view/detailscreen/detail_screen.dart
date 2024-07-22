import 'package:flutter/material.dart';
import '../../model/cart_model.dart';

class DetailScreen extends StatelessWidget {
  final Product product;

  DetailScreen({required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              height: 200,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(product.thumbnail),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            SizedBox(height: 16),
            Center(
              child: Text(
                product.title,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 8),
            Center(
              child: Text(
                'Price: \$${product.price}',
                style: TextStyle(fontSize: 18, color: Colors.green),
              ),
            ),
            SizedBox(height: 8),
            Center(
              child: Text(
                'Quantity: ${product.quantity}',
                style: TextStyle(fontSize: 18),
              ),
            ),
            SizedBox(height: 8),
            Center(
              child: Text(
                'Total: \$${product.total}',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 8),
            Center(
              child: Text(
                'Discount Percentage: ${product.discountPercentage}%',
                style: TextStyle(fontSize: 18, color: Colors.red),
              ),
            ),
            SizedBox(height: 8),
            Center(
              child: Text(
                'Discounted Total: \$${product.discountedTotal}',
                style: TextStyle(fontSize: 18, color: Colors.blue),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
