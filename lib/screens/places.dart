import 'package:app_notification/modal.dart/user_products.dart';
import 'package:app_notification/screens/add_places.dart';
import 'package:app_notification/widget/places_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PlacesScreen extends ConsumerStatefulWidget {
  const PlacesScreen({super.key});
  @override
  ConsumerState<PlacesScreen> createState() {
    return _placesScreenState();
  }
}

class _placesScreenState extends ConsumerState<PlacesScreen> {
  late Future<void> _placesFuture;
  @override
  void initState() {
    super.initState();

    _placesFuture = ref.read(productsListProvider.notifier).loadPlaces();
  }

  @override
  Widget build(BuildContext context) {
    final allproducts = ref.watch(productsListProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text('Products list'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (ctx) => const AddProducts(),
                ),
              );
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: FutureBuilder(
          future: _placesFuture,
          builder: (context, snapshot) =>
              snapshot.connectionState == ConnectionState.waiting
                  ? const Center(child: CircularProgressIndicator())
                  : placesList(product: allproducts),
        ),
      ),
    );
  }
}
