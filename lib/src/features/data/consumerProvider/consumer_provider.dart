import 'package:flutter_riverpod/flutter_riverpod.dart';


final nameProvider = Provider((ref) {
  return "hello";
});

final counterProvider = StateProvider((ref) => 0);