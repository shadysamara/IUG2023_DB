import 'package:flutter/material.dart';
import 'package:iug_local_storage/mvc/controller/app_provider.dart';
import 'package:iug_local_storage/mvc/models/api_helper.dart';
import 'package:provider/provider.dart';

class ProductsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(title: Text("Products Screen")),
        body: Consumer<AppProvider>(
          builder: (context, provider, x) {
            return provider.products == null
                ? SizedBox()
                : GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 10,
                        crossAxisSpacing: 10),
                    itemCount: provider.products!.length,
                    itemBuilder: (context, index) {
                      return Container(
                        color: Colors.grey,
                        child: Column(
                          children: [
                            Image.network(
                              provider.products![index].image ?? '',
                              height: 140,
                            ),
                            Text(
                              provider.products![index].title ?? '',
                              maxLines: 2,
                            )
                          ],
                        ),
                      );
                    });
          },
        ));
  }
}
