import 'package:app_notification/modal.dart/newplace.dart';
import 'package:flutter/material.dart';

class placeDetailsScreen extends StatelessWidget {
  const placeDetailsScreen({super.key, required this.Product});
  final Plase Product;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(Product.title)),
        body: Center(
          child: Padding(
            padding: EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text('Products Price:${Product.price}',
                        style: const TextStyle(
                          color: Colors.black,
                        )),
                    Text('Products Price:${Product.quantity}',
                        style: TextStyle(color: Colors.black)),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
        ));
  }
}
