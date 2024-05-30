import 'package:flutter/material.dart';
import 'package:mayclass/src/config/utils/constant/color.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mayclass/src/features/data/consumerProvider/consumer_provider.dart';


class Homepage extends ConsumerWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final text = ref.watch(nameProvider);
    final productValue = ref.watch(productListProvider);

    return Scaffold(
      appBar: AppBar(backgroundColor: appbarcolor,),
      body: productValue.when(
          data: (products)=> ListView.builder(
            itemCount: products.length,
            itemBuilder: (context,index){
              final product = products[index];
              return Card(
                child: ListTile(
                  title: Text(product.title!),
                  subtitle: Text(product.category!),
                  trailing: Image.network(product.image!),
                ),
              );
            },
          ),
          error: (err, stack)=> Center(child: Text("error"),),
          loading: ()=> CircularProgressIndicator()
      )
    );
  }
}
