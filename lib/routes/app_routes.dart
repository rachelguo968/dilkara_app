import 'package:flutter/material.dart';
import 'package:dilkara/presentation/splash_screen/splash_screen.dart';
import 'package:dilkara/presentation/login_screen/login_screen.dart';
import 'package:dilkara/presentation/register_screen/register_screen.dart';
import 'package:dilkara/presentation/main_landing_screen/main_landing_screen.dart';
import 'package:dilkara/presentation/product_discover_screen/product_discover_screen.dart';
import 'package:dilkara/presentation/product_search_screen/product_search_screen.dart';
import 'package:dilkara/presentation/cart_screen/cart_screen.dart';
import 'package:dilkara/presentation/profile_profile_info_tab_container_screen/profile_profile_info_tab_container_screen.dart';
import 'package:dilkara/presentation/product_page_screen/product_page_screen.dart';
import 'package:dilkara/presentation/app_navigation_screen/app_navigation_screen.dart';
import 'package:dilkara/services/woocommerce_service.dart';

class AppRoutes {
  static const String splashScreen = '/splash_screen';

  static const String loginScreen = '/login_screen';

  static const String registerScreen = '/register_screen';

  static const String mainLandingScreen = '/main_landing_screen';

  static const String productDiscoverScreen = '/product_discover_screen';

  static const String productSearchScreen = '/product_search_screen';

  static const String cartScreen = '/cart_screen';

  static const String profileProfileInfoPage = '/profile_profile_info_page';

  static const String profileProfileInfoTabContainerScreen =
      '/profile_profile_info_tab_container_screen';

  static const String profileMyOrdersPage = '/profile_my_orders_page';

  static const String profileSecurityPage = '/profile_security_page';

  static const String profileAddressDetailsPage =
      '/profile_address_details_page';

  static const String productPageScreen = '/product_page_screen';

  static const String appNavigationScreen = '/app_navigation_screen';

  static const String initialRoute = '/initialRoute';

  static Map<String, WidgetBuilder> get routes => {
        splashScreen: SplashScreen.builder,
        loginScreen: LoginScreen.builder,
        registerScreen: RegisterScreen.builder,
        mainLandingScreen: MainLandingScreen.builder,
        productDiscoverScreen: ProductDiscoverScreen.builder,
        productSearchScreen: ProductSearchScreen.builder,
        cartScreen: CartScreen.builder,
        profileProfileInfoTabContainerScreen:
            ProfileProfileInfoTabContainerScreen.builder,
        productPageScreen: (BuildContext context) {
          final apiService = WooCommerceApiService("https://dilkara.com.au/wc-api/v3","ck_5548abde185d8a83fa7781e7c6bce5459f52616c","cs_6ae6830cba04c992ed7bf63ed36f5d1015661015"); // Create an instance of your API service here
          return ProductPageScreen.builder(context, apiService);
          },
        appNavigationScreen: AppNavigationScreen.builder,
        initialRoute: SplashScreen.builder
      };
}
