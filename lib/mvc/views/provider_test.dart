// import 'package:flutter/material.dart';
// import 'package:iug_local_storage/custom_textfield.dart';
// import 'package:iug_local_storage/mvc/controller/iug_provider.dart';
// import 'package:provider/provider.dart';

// class ProviderTestScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     // TODO: implement build
//     return Scaffold(
//         floatingActionButton: FloatingActionButton(onPressed: () {
//           Navigator.of(context).push(MaterialPageRoute(builder: (context) {
//             return ProviderTest2();
//           }));
//         }),
//         appBar: AppBar(),
//         body: Column(children: [
//           SwitchListTile(
//               title: Text(Provider.of<IugProvider>(context).isDark
//                   ? "Switch to Light Mode"
//                   : "Switch to Dark Mode"),
//               value: Provider.of<IugProvider>(context).isDark,
//               onChanged: (v) {
//                 Provider.of<IugProvider>(context,listen: false).changeIsDark();
//               })
//         ]));
//   }
// }

// class ProviderTest2 extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     // TODO: implement build
//     return Scaffold(
//       appBar: AppBar(),
//     );
//   }
// }
