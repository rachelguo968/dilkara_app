import 'package:http/http.dart' as http;
import 'dart:convert';

class WooCommerceApiService {
  final String apiUrl;
  final String consumerKey;
  final String consumerSecret;

  WooCommerceApiService(this.apiUrl, this.consumerKey, this.consumerSecret);


  Future<dynamic> fetchProducts() async {
    final response = await http.get(
      Uri.parse("https://dilkara.com.au/wc-api/v3/products?per_page=66"),
      headers: {
        'Authorization': 'Basic ${base64Encode(utf8.encode('$consumerKey:$consumerSecret'))}',
      },
    );

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load products');
    }
  }

}


