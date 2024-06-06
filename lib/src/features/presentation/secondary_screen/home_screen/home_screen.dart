import 'package:flutter/material.dart';
import 'package:mayclass/src/config/utils/constant/color.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mayclass/src/features/data/consumerProvider/consumer_provider.dart';
import 'package:mayclass/src/features/presentation/secondary_screen/edit_profile/edit_profile.dart';
import 'package:shared_preferences/shared_preferences.dart';

final nameProvider = StateProvider<String>((ref) => "");
final passwordProvider = StateProvider<String>((ref) => "");

class Homepage extends ConsumerStatefulWidget {


  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends ConsumerState<Homepage> {
  @override
  void initState() {
    super.initState();
    _loadName();
    print(_loadName());
    print(_loadName());
    print(_loadName());
    print(_loadName());
  }

  Future<void> _loadName() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String name = prefs.getString("mobilenumber") ?? "";
    String password = prefs.getString("password")??"";
    ref.read(nameProvider.notifier).state = name;
    ref.read(passwordProvider.notifier).state = password;
  }


  @override
  Widget build(BuildContext context) {
    final name = ref.watch(nameProvider);
    final productValue = ref.watch(productListProvider);
    final password = ref.watch(passwordProvider);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: appbarcolor,
        title: Text("This is your $name"),
        actions: [
          IconButton(onPressed: (){
            Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => EditProfile()
                )
            );
          },
              icon: Icon(Icons.person))
        ],
      ),
      body: productValue.when(
        data: (products) => ListView.builder(
          itemCount: products.length,
          itemBuilder: (context, index) {
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
        error: (err, stack) => Center(
          child: Text("Error"),
        ),
        loading: () => Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
