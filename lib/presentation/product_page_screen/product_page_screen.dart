import 'dart:convert';
import 'bloc/product_page_bloc.dart';
import 'package:http/http.dart' as http;
import 'models/product_page_model.dart';
import 'package:dilkara/core/app_export.dart';
import 'package:flutter/material.dart';
import 'package:dilkara/services/woocommerce_service.dart';
import 'package:dilkara/widgets/app_bar/appbar_image.dart';
import 'package:dilkara/widgets/app_bar/appbar_title.dart';
import 'package:dilkara/widgets/app_bar/custom_app_bar.dart';


class ProductPageScreen extends StatefulWidget {
  final WooCommerceApiService apiService;
  ProductPageScreen(this.apiService); // Constructor that takes apiService

  static Widget builder(BuildContext context, WooCommerceApiService apiService) {
    return BlocProvider<ProductPageBloc>(
      create: (context) => ProductPageBloc(
          ProductPageState(productPageModelObj: ProductPageModel()))
        ..add(ProductPageInitialEvent()),
      child: ProductPageScreen(apiService), // Pass apiService to the widget constructor
    );
  }

  @override
  _ProductPageScreen createState() => _ProductPageScreen();
}

class _ProductPageScreen extends State<ProductPageScreen> {
  late Future<List<Map<String, dynamic>>> products;

  @override
  void initState() {
    super.initState();
    products = fetchAndParseProducts();
  }

  Future<List<Map<String, dynamic>>> fetchAndParseProducts() async {
    final response = await widget.apiService.fetchProducts();

    if (response is Map<String, dynamic> && response.containsKey('products')) {
      // Handle the map structure here and extract the list of products
      final productList = response['products'] as List<dynamic>;
      return productList.cast<Map<String, dynamic>>().toList();
    } else {
      // Handle the case where the response is not as expected
      throw Exception('Unexpected API response format');
    }
  }

  Future<String> getProductImage(int productId) async {
    final String apiUrl =
        'https://dilkara.com.au/wc-api/v3/products/$productId';

    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      final Map<String, dynamic> productData = json.decode(response.body);

      if (productData.containsKey('images') &&
          productData['images'] is List &&
          productData['images'].isNotEmpty) {
        final List<dynamic> images = productData['images'];
        final String imageUrl = images[0]['src'];

        if (imageUrl != null && imageUrl.isNotEmpty) {
          return imageUrl;
        }
      }
    }
    return 'https://dilkara.com.au/wp-content/uploads/2023/03/brandmark-design-3.png';
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: AppbarTitle(text: "Dilkara".tr),
      ),
      body: FutureBuilder<dynamic>(
        future: products,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else {
            final productList = snapshot.data as List<dynamic>;
            return ListView.builder(
              itemCount: productList.length,
              itemBuilder: (context, index) {
                final product = productList[index];
                final productName = product['title'] as String?;
                return ListTile(
                  leading: FutureBuilder(
                    future: getProductImage(product['id']), // Replace with your own function to fetch the image URL
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.done) {
                        if (snapshot.hasData) {
                          return Image.network(
                            (snapshot.data as String?) ?? '', // Cast to String or use an empty string if it's null
                            width: 80,
                            height: 80,
                            fit: BoxFit.cover,
                          );
                        } else {
                          // If image URL is not available, you can display a placeholder or an empty container
                          return Container(width: 80, height: 80, color: Colors.grey);
                        }
                      } else {
                        // While waiting for the image to load, you can display a loading indicator
                        return CircularProgressIndicator();
                      }
                    },
                  ),
                  title: Text(productName ?? 'No Name'),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('\$${product['price'] ?? '0.00'}'),
                      if (product['categories'] != null)
                        Text(
                          'Categories: ${product['categories'].join(', ')}',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                    ],
                  ),
                  trailing: ElevatedButton(
                    onPressed: () {
                      // Implement your add-to-cart logic here
                      // You can use a function to add the product to the cart
                    },
                    child: Text('Add to Cart'),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}