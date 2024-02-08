import 'package:app_notification/modal.dart/newplace.dart';
import 'package:app_notification/modal.dart/user_products.dart';
import 'package:app_notification/screens/place_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class placesList extends ConsumerStatefulWidget {
  const placesList({super.key, required this.product});
  final List<Plase> product;

  @override
  ConsumerState<placesList> createState() {
    return _placesListState();
  }
}

class _placesListState extends ConsumerState<placesList> {
  @override
  Widget build(BuildContext context) {
    if (widget.product.isEmpty) {
      return Center(
        child: Text(
          'No places added yet',
          style: Theme.of(context)
              .textTheme
              .bodyLarge!
              .copyWith(color: Theme.of(context).colorScheme.onBackground),
        ),
      );
    }
    return ListView.builder(
      itemCount: widget.product.length,
      itemBuilder: (ctx, index) => ListTile(
        title: Text(
          widget.product[index].title,
          style: Theme.of(context)
              .textTheme
              .titleMedium!
              .copyWith(color: Theme.of(context).colorScheme.onBackground),
        ),
        subtitle: Text(
          widget.product[index].price,
          style: Theme.of(context)
              .textTheme
              .bodySmall!
              .copyWith(color: Theme.of(context).colorScheme.onBackground),
        ),
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (ctx) =>
                  placeDetailsScreen(Product: widget.product[index]),
            ),
          );
        },
        trailing: IconButton(
          icon: Icon(Icons.delete),
          onPressed: () {
            _deleteProduct(widget.product[index].id); // Call delete method
          },
        ),
      ),
    );
  }

  void _deleteProduct(String productId) {
    ref.read(productsListProvider.notifier).deleteProduct(productId);
  }
}
