import 'dart:convert';
import 'package:provider/provider.dart';
import '../../models/DBHelper.dart';
import '../../models/cart.dart';
import '../../models/cartprovider.dart';
import '../../models/item.dart';
import '../cart_screen/cart_screen.dart';
import 'bloc/product_page_bloc.dart';
import 'package:http/http.dart' as http;
import 'models/product_page_model.dart';
import 'package:dilkara/core/app_export.dart';
import 'package:flutter/material.dart';
import 'package:dilkara/services/woocommerce_service.dart';
import 'package:dilkara/widgets/app_bar/appbar_title.dart';

class ProductPageScreen extends StatefulWidget {
  final WooCommerceApiService apiService;
  ProductPageScreen(this.apiService); // Constructor that takes apiService

  static Widget builder(
      BuildContext context, WooCommerceApiService apiService) {
    return BlocProvider<ProductPageBloc>(
      create: (context) => ProductPageBloc(
          ProductPageState(productPageModelObj: ProductPageModel()))
        ..add(ProductPageInitialEvent()),
      child: ProductPageScreen(
          apiService), // Pass apiService to the widget constructor
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
    loadProductsFromApi();
    final cart = Provider.of<CartProvider>(context);
    final dbHelper = DBHelper();
    void saveData(int index) {
      dbHelper
          .insert(
        Cart(
          id: index,
          productId: index.toString(),
          productName: productitemlist[index].name,
          initialPrice: productitemlist[index].price.toInt(),
          productPrice: productitemlist[index].price.toInt(),
          quantity: ValueNotifier(1),
          unitTag: productitemlist[index].unit,
          image: productitemlist[index].image,
        ),
      )
          .then((value) {
        cart.addTotalPrice(productitemlist[index].price.toDouble());
        cart.addCounter();
        print('Product Added to cart');
      }).onError((error, stackTrace) {
        print(error.toString());
      });
    }
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Dilkara'),
        actions: [
          Stack(
            alignment: Alignment.topRight,
            children: [
              IconButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => CartScreen()));
                },
                icon: const Icon(Icons.shopping_cart),
              ),
              Consumer<CartProvider>(
                builder: (context, value, child) {
                  final itemCount = value.getCounter();
                  return itemCount > 0
                      ? CircleAvatar(
                          radius: 10,
                          backgroundColor: Colors.red,
                          child: Text(
                            itemCount.toString(),
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        )
                      : const SizedBox
                          .shrink(); // Hide the badge when count is 0
                },
              ),
            ],
          ),
          const SizedBox(
            width: 20.0,
          ),
        ],
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
                  leading: Builder(
                    builder: (context) {
                      if (productitemlist.isNotEmpty) {
                        return Image.network(
                          productitemlist[index].image,
                          width: 80,
                          height: 80,
                          fit: BoxFit.cover,
                        );
                      } else {
                        return Container(
                          width: 80,
                          height: 80,
                          color: Colors.grey,
                        );
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
                        saveData(index);
                      },
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(Colors.black54),
                      ),
                      child: const Text('Add to Cart')),
                );
              },
            );
          }
        },
      ),
    );
  }
}
