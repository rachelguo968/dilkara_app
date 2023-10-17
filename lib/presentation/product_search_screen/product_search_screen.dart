import 'package:dilkara/models/DBHelper.dart';
import 'package:dilkara/models/cart.dart';
import 'package:dilkara/models/cartprovider.dart';
import 'package:dilkara/presentation/cart_screen/cart_screen.dart';
import 'package:dilkara/services/woocommerce_service.dart';
import 'package:dilkara/widgets/app_bar/appbar_image.dart';
import 'package:dilkara/widgets/app_bar/appbar_title.dart';
import 'package:dilkara/widgets/app_bar/custom_app_bar.dart';
import 'package:provider/provider.dart';

import '../product_search_screen/widgets/list1_item_widget.dart';
import 'bloc/product_search_bloc.dart';
import 'models/list1_item_model.dart';
import 'models/product_search_model.dart';
import 'package:dilkara/core/app_export.dart';
import 'package:dilkara/widgets/custom_search_view.dart';
import 'package:flutter/material.dart';

import 'dart:convert';

import 'package:dilkara/core/app_export.dart';
import 'package:dilkara/models/item.dart';
import 'package:http/http.dart' as http;

class ProductSearchScreen extends StatefulWidget {
  final WooCommerceApiService apiService;
  ProductSearchScreen(this.apiService);

  static Widget builder(
      BuildContext context, WooCommerceApiService apiService) {
    return BlocProvider<ProductSearchBloc>(
      create: (context) => ProductSearchBloc(ProductSearchState(
        productSearchModelObj: ProductSearchModel(),
      ))
        ..add(ProductSearchInitialEvent()),
      child: ProductSearchScreen(apiService),
    );
  }

  @override
  _ProductSearchScreen createState() => _ProductSearchScreen();
}

class _ProductSearchScreen extends State<ProductSearchScreen> {
  List<dynamic> productList = [];
  List<dynamic> filteredProductList = [];
  late Future<List<Map<String, dynamic>>> products;
  TextEditingController searchController = TextEditingController();

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
          initialPrice: productitemlist[index].price,
          productPrice: productitemlist[index].price,
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
      appBar: CustomAppBar(
        height: getVerticalSize(
          64,
        ),
        leadingWidth: 39,
        leading: AppbarImage(
          height: getSize(
            24,
          ),
          width: getSize(
            24,
          ),
          svgPath: ImageConstant.imgMenuBlack900,
          margin: getMargin(
            left: 15,
            top: 18,
            bottom: 22,
          ),
        ),
        centerTitle: true,
        title: AppbarTitle(
          text: "Dilkara".tr,
        ),
        styleType: Style.bgFillWhiteA700,
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
                color: Colors.black,
              ),
              Consumer<CartProvider>(
                builder: (context, value, child) {
                  final itemCount = value.getCounter();
                  return itemCount > 0
                      ? CircleAvatar(
                          radius: 10,
                          backgroundColor: Colors.grey,
                          child: Text(
                            itemCount.toString(),
                            style: const TextStyle(
                              color: Colors.black,
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
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: searchController,
              onChanged: (value) {
                filterProducts(value);
              },
              decoration: InputDecoration(
                labelText: 'Search Products',
              ),
            ),
          ),
          Expanded(
            child: FutureBuilder<dynamic>(
              future: products,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: SizedBox(
                      width: 50.0, // Set the size of the container
                      height: 50.0,
                      child: CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.grey),
                        strokeWidth: 4,
                      ),
                    ),
                  );
                } else if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else {
                  productList = snapshot.data as List<dynamic>;
                  return GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.75,
                    ),
                    itemCount: filteredProductList.length,
                    itemBuilder: (context, index) {
                      final product = filteredProductList[index];
                      final productName = product['title'] as String?;

                      return Card(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Builder(
                                builder: (context) {
                                  if (productitemlist.isNotEmpty) {
                                    return Image.network(
                                      productitemlist[
                                              productList.indexOf(product)]
                                          .image,
                                      fit: BoxFit.cover,
                                    );
                                  } else {
                                    return Container(
                                      color: Colors.grey,
                                    );
                                  }
                                },
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(productName ?? 'No Name',
                                      textAlign: TextAlign.center),
                                  Text('\$${product['price'] ?? '0.00'}',
                                      textAlign: TextAlign.center),
                                  if (product['categories'] != null)
                                    Text(
                                      'Categories: ${product['categories'].join(', ')}',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                      textAlign: TextAlign.center,
                                    ),
                                ],
                              ),
                            ),
                            SizedBox(
                              width: double.infinity,
                              child: ElevatedButton(
                                onPressed: () {
                                  saveData(productList.indexOf(product));
                                },
                                style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                          Colors.black54),
                                ),
                                child: const Text('Add to Cart'),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }

  void filterProducts(String query) {
    setState(() {
      filteredProductList = productList.where((product) {
        final productName = (product['title'] as String?) ?? '';
        return productName.toLowerCase().contains(query.toLowerCase());
      }).toList();
    });
  }
}
