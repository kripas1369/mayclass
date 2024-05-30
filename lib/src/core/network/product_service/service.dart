import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../models/product_model.dart';

class ProductService {
  final String baseurl = "https://fakestoreapi.com/products";

  Future<List<Product>> fetchProduct() async {
    final response = await http.get(Uri.parse(baseurl));

    if (response.statusCode == 200) {
      List<dynamic> body = jsonDecode(response.body);
      List<Product> products = body.map((dynamic e) => Product.fromJson(e)).toList();
      print(response.body);  // Ensure this is used for debugging
      return products;
    } else {
      throw Exception("Failed to load products");
    }
  }
}
