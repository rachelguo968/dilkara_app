import 'package:dilkara/models/cartprovider.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'core/app_export.dart';
import 'services/woocommerce_service.dart';

/// A global key to access the state of [ScaffoldMessenger] widget from anywhere
/// in the application.
var globalMessengerKey = GlobalKey<ScaffoldMessengerState>();

void main() {
  final apiUrl = "https://dilkara.com.au/wc-api/v3";
  final consumerKey = "ck_5548abde185d8a83fa7781e7c6bce5459f52616c";
  final consumerSecret = "cs_6ae6830cba04c992ed7bf63ed36f5d1015661015";
  final apiService = WooCommerceApiService(apiUrl, consumerKey, consumerSecret);

  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]).then((value) {
    PrefUtils().init();
    Logger.init(kReleaseMode ? LogMode.live : LogMode.debug);
    runApp(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => CartProvider()),
        ],
        child: MyApp(),
      ),
    );
  });
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: NavigatorService.navigatorKey,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        visualDensity: VisualDensity.standard,
      ),
      scaffoldMessengerKey: globalMessengerKey,
      //for setting localization strings
      supportedLocales: const [
        Locale('en', ''),
      ],
      localizationsDelegates: const [
        AppLocalizationDelegate(),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      title: 'dilkara',
      initialRoute: AppRoutes.initialRoute,
      routes: AppRoutes.routes,
    );
  }
}
