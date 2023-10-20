import 'dart:ui';

import '../main_landing_screen/main_landing_screen.dart';
import '../product_discover_screen/widgets/list_item_widget.dart';
import '../product_page_screen/product_page_screen.dart';
import 'bloc/product_discover_bloc.dart';
import 'models/list_item_model.dart';
import 'models/product_discover_model.dart';
import 'package:dilkara/core/app_export.dart';
import 'package:dilkara/widgets/app_bar/appbar_image.dart';
import 'package:dilkara/widgets/app_bar/appbar_title.dart';
import 'package:dilkara/widgets/app_bar/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Category {
  final String name;
  final String imageUrl;

  Category({
    required this.name,
    required this.imageUrl,
  });
}
class ProductDiscoverScreen extends StatelessWidget {
  static Widget builder(BuildContext context) {
    return BlocProvider<ProductDiscoverBloc>(
        create: (context) => ProductDiscoverBloc(ProductDiscoverState(
            productDiscoverModelObj: ProductDiscoverModel()))
          ..add(ProductDiscoverInitialEvent()),
        child: ProductDiscoverScreen());
  }

  final List<Category> categories = [
    Category(
      name: 'Skin',
      imageUrl: 'https://dilkara.com.au/wp-content/uploads/2023/03/pebblely-2023-04-21T200305.532.jpg',
    ),
    Category(
      name: 'Hair',
      imageUrl: 'https://dilkara.com.au/wp-content/uploads/2023/03/pebblely-2023-04-21T200736.284-300x300.jpg',
    ),
    Category(
      name: 'Treat',
      imageUrl: 'https://dilkara.com.au/wp-content/uploads/2023/03/pebblely-2023-04-21T200736.284-300x300.jpg',
    ),
    // Add more categories here
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
          height: getVerticalSize(56),
          leadingWidth: 40,
          leading: AppbarImage(
              height: getSize(24),
              width: getSize(24),
              svgPath: ImageConstant.img25326b4294154be2a5c5f0d7c083e855,
              margin: getMargin(left: 16, top: 15, bottom: 16),
              onTap: () {
                onTapArrowleft(context);
              }),
          centerTitle: true,
          title: AppbarTitle(text: "Dilkara".tr)),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        itemCount: categories.length,
        itemBuilder: (context, index) {
          final category = categories[index];
          return GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          ProductPageScreen(apiService)));
            },
            child: Card(
              child: Stack(
                fit: StackFit.expand,
                children: <Widget>[
                  Image.network(
                    category.imageUrl,
                    fit: BoxFit.cover,
                  ),
                  BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 0, sigmaY: 0), // Adjust sigmaX and sigmaY for blur intensity
                    child: Container(
                      color: Colors.black.withOpacity(0.1), // Background color with opacity
                    ),
                  ),
                  Center(
                    child: Text(
                category.name,
                style: TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black54, // Text color on top of the image
          ),
          ),
          ),
          ],
          ),));
        },
      ),
    );
  }

  onTapArrowleft(BuildContext context) {
    NavigatorService.goBack();
  }

}


