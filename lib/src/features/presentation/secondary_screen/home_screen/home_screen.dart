// import 'package:flutter/material.dart';
// import 'package:mayclass/src/config/utils/constant/color.dart';
//
// class Homepage extends StatefulWidget {
//   const Homepage({super.key});
//
//   @override
//   State<Homepage> createState() => _HomepageState();
// }
//
// class _HomepageState extends State<Homepage> {
//
//   int counter = 0;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       floatingActionButton: FloatingActionButton(
//         child: Icon(Icons.navigation),
//         backgroundColor: Colors.green,
//         foregroundColor: Colors.white,
//         onPressed: () => {},
//       ),
//       appBar: AppBar(backgroundColor: appbarcolor,),
//       body: Column(
//         children: [
//           Text("Our new counter app"),
//           Text("$counter"),
//           MaterialButton(
//               onPressed: (){
//                 setState(() {
//                   counter ++;
//                 });                // return print("clicked done");
//               },
//             child: Text("+"),
//           ),
//           MaterialButton(
//             onPressed: (){
//               setState(() {
//                 counter --;
//               });                // return print("clicked done");
//             },
//             child: Text("-"),
//           ),
//         ],
//       ),
//     );
//
//   }
// }


import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mayclass/src/features/data/consumerProvider/consumer_provider.dart';

class Homepage extends ConsumerWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {

    final text = ref.watch(nameProvider);
    final counter = ref.watch(counterProvider);
    return  Scaffold(
      appBar: AppBar(title:Text("counter with riverpod") ,),
      body: Column(
        children: [
          Text(text),
          Text("Our new counter app"),
          Text("$counter"),
        MaterialButton(
              onPressed: (){
                ref.read(counterProvider.notifier).state++;
              },
            child: Text("+"),
          ),
          MaterialButton(
            onPressed: (){
              ref.read(counterProvider.notifier).state--;
            },
            child: Text("-"),
          ),
          MaterialButton(
            onPressed: (){
              // ref.invalidate(counterProvider);
              ref.refresh(counterProvider);
            },
            child: Icon(Icons.refresh),
          ),
        ],
      )
    );
  }
}
