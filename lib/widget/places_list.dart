import 'package:app_notification/modal.dart/newplace.dart';
import 'package:app_notification/screens/place_details.dart';
import 'package:flutter/material.dart';

class placesList extends StatelessWidget {
  const placesList({super.key, required this.product});
  final List<Plase> product;

  @override
  Widget build(BuildContext context) {
    if (product.isEmpty) {
      return Center(
        child: Text(
          'no placess add yet',
          style: Theme.of(context)
              .textTheme
              .bodyLarge!
              .copyWith(color: Theme.of(context).colorScheme.onBackground),
        ),
      );
    }
    return ListView.builder(
      itemCount: product.length,
      itemBuilder: (ctx, index) => ListTile(
        title: Text(
          product[index].title,
          style: Theme.of(context)
              .textTheme
              .titleMedium!
              .copyWith(color: Theme.of(context).colorScheme.onBackground),
        ),
        subtitle: Text(
          product[index].price,
          style: Theme.of(context)
              .textTheme
              .bodySmall!
              .copyWith(color: Theme.of(context).colorScheme.onBackground),
        ),
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (ctx) => placeDetailsScreen(Product: product[index]),
            ),
          );
        },
      ),
    );
  }
}
