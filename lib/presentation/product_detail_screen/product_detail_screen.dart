import 'package:dilkara/presentation/main_landing_screen/main_landing_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../models/DBHelper.dart';
import '../../models/cart.dart';
import '../../models/cartprovider.dart';
import '../../models/item.dart';
import '../../services/woocommerce_service.dart';
import 'package:flutter_html/flutter_html.dart';


import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart'; // Import the HTML widget

class ProductDetailScreen extends StatefulWidget {
  final Map<String, dynamic> productDetails;

  ProductDetailScreen({required this.productDetails});

  @override
  _ProductDetailScreenState createState() => _ProductDetailScreenState(); // Return the state class
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product Details'),
        backgroundColor: Colors.black54,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              height: 200, // Set the desired maximum height for the image carousel
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: widget.productDetails['images'].length, // Use widget to access productDetails
                itemBuilder: (context, index) {
                  final image = widget.productDetails['images'][index]; // Use widget
                  return Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Image.network(
                      image['src'],
                      fit: BoxFit.cover,
                      height: 200,
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    widget.productDetails['title'] ?? 'No Name', // Use widget
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    '\$${widget.productDetails['price'] ?? '0.00'}', // Use widget
                    style: TextStyle(fontSize: 18),
                  ),
                  if (widget.productDetails['categories'] != null) // Use widget
                    Text(
                      'Categories: ${widget.productDetails['categories'].join(', ')}', // Use widget
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  SizedBox(height: 16),
                  Text(
                    'Description:',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Html(
                    data: widget.productDetails['description'],
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(Colors.black54),
                      ),
                      child: const Text('Add to Cart'),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
