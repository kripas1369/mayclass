import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mayclass/src/core/network/product_service/service.dart';


// final nameProvider = Provider((ref) {
//   return "hello";
// });
//
// final counterProvider = StateProvider((ref) => 0);

final productServiceProvider = Provider((ref) {
  return ProductService();
});

final productListProvider = FutureProvider((ref) {
  final providerService = ref.read(productServiceProvider);
  return providerService.fetchProduct();
});