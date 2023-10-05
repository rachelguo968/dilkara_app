import 'dart:convert';
import 'package:http/http.dart' as http;

class Item {
  final String name;
  final String unit;
  final double price;
  final String image;

  Item({
    required this.name,
    required this.unit,
    required this.price,
    required this.image,
  });

  factory Item.fromJson(Map<String, dynamic> json) {
    try {
      final name = json['title'];
      final dimensions = json['dimensions'];
      final price = json['price'];
      final images = json['images'];

      if (name != null &&
          dimensions != null &&
          price != null &&
          images != null) {
        return Item(
          name: name,
          unit: dimensions['unit'] ?? '',
          price: double.tryParse(price.toString()) ?? 0.0,
          image: images.isNotEmpty ? images[0]['src'] ?? '' : '',
        );
      } else {
        throw Exception('Invalid JSON data in Item.fromJson');
      }
    } catch (e) {
      print('Error parsing JSON in Item.fromJson: $e');
      throw Exception('Failed to parse JSON in Item.fromJson');
    }
  }

  static Future<List<Item>> fetchProducts() async {
    try {
      final response = await http.get(
        Uri.parse('https://dilkara.com.au/wc-api/v3/products'),
        headers: {
          'Authorization': 'Basic ' +
              base64Encode(utf8.encode(
                  'ck_5548abde185d8a83fa7781e7c6bce5459f52616c:cs_6ae6830cba04c992ed7bf63ed36f5d1015661015')),
        },
      );

      if (response.statusCode == 200) {
        final dynamic jsonResponse = jsonDecode(response.body);
        if (jsonResponse is Map<String, dynamic> &&
            jsonResponse.containsKey('products')) {
          final List<dynamic> products = jsonResponse['products'];
          return products.map((json) => Item.fromJson(json)).toList();
        } else {
          throw Exception('Invalid JSON structure: "products" key not found');
        }
      } else {
        print('API Request Failed with status code: ${response.statusCode}');
        print('Response Body: ${response.body}');
        throw Exception('Failed to load products from the API');
      }
    } catch (e) {
      print('Error in fetchProducts: $e');
      throw Exception('Failed to load products in item dart');
    }
  }
}

List<Item> productitemlist = [];

void loadProductsFromApi() async {
  try {
    final apiProducts = await Item.fetchProducts();
    productitemlist.addAll(apiProducts);
  } catch (e) {
    print('Error loading products from API: $e');
  }
}
