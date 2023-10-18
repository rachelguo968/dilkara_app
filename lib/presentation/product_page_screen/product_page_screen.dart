import 'dart:convert';
import 'package:dilkara/presentation/product_search_screen/product_search_screen.dart';
import 'package:dilkara/widgets/app_bar/appbar_image.dart';
import 'package:dilkara/widgets/app_bar/custom_app_bar.dart';
import 'package:provider/provider.dart';
import '../../models/DBHelper.dart';
import '../../models/cart.dart';
import '../../models/cartprovider.dart';
import '../../models/item.dart';
import '../cart_screen/cart_screen.dart';
import '../product_detail_screen/product_detail_screen.dart';
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
      final productList = response['products'] as List<dynamic>;
      final castedProductList =
          productList.cast<Map<String, dynamic>>().toList();
      this.productList = castedProductList;
      // Initialize both lists with the products data
      filteredProductList = castedProductList;
      return castedProductList;
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
                  NavigatorService.navigatorKey.currentState!
                      .pushNamed(AppRoutes.productSearchScreen);
                },
                icon: Icon(Icons.search), // Use the search icon
                color: Colors.black,
              ),
            ],
          ),
          Stack(
            alignment: Alignment.topRight,
            children: [
              IconButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => CartScreen()));
                },
                icon: Icon(Icons.shopping_cart), // Use the cart icon
                color: Colors.black,
              ),
              Consumer<CartProvider>(
                builder: (context, value, child) {
                  final itemCount = value.getCounter();
                  return itemCount > 0
                      ? Positioned(
                          right: 0,
                          child: CircleAvatar(
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
                          ),
                        )
                      : SizedBox.shrink();
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

                return GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => ProductDetailScreen(
                          productDetails: product, // Pass the product details
                        ),
                      ),
                    );
                  },
                  child: Card(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Builder(
                            builder: (context) {
                              if (productitemlist.isNotEmpty) {
                                return Image.network(
                                  productitemlist[productList.indexOf(product)].image,
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
                              Text(productName ?? 'No Name', textAlign: TextAlign.center),
                              Text('\$${product['price'] ?? '0.00'}', textAlign: TextAlign.center),
                              if (product['categories'] != null)
                                Text(
                                  'Categories: ${product['categories'].join(', ')}',
                                  style: TextStyle(fontWeight: FontWeight.bold),
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
                              backgroundColor: MaterialStateProperty.all<Color>(Colors.black54),
                            ),
                            child: const Text('Add to Cart'),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          }
        },
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
