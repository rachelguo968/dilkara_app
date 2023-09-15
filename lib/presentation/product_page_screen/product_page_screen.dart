import 'bloc/product_page_bloc.dart';
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
                  title: Text(productName ?? 'No Name'),
                  subtitle: Text('\$${product['price'] ?? '0.00'}'),
                );
              },
            );
          }
        },
      ),
    );
  }
}




