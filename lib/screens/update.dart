import 'package:app_notification/modal.dart/user_products.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AddProducts extends ConsumerStatefulWidget {
  const AddProducts({super.key});
  @override
  ConsumerState<AddProducts> createState() {
    return _AddProducts();
  }
}

class _AddProducts extends ConsumerState<AddProducts> {
  final _titleController = TextEditingController();
  final _priceController = TextEditingController();
  final _quantityController = TextEditingController();

  void _savePlaces() {
    final enterTitel = _titleController.text;
    final enterPrice = _priceController.text;
    final enterquantity = _quantityController.text;

    if (enterTitel.isEmpty || enterPrice.isEmpty || enterquantity.isEmpty) {
      return;
    }
    ref
        .read(productsListProvider.notifier)
        .Updateplace(enterTitel, enterPrice, enterquantity);
    Navigator.of(context).pop();
  }

  @override
  void dispose() {
    _titleController.dispose();
    _priceController.dispose();
    _quantityController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('add a new place'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            TextField(
              decoration: const InputDecoration(labelText: 'Titel'),
              controller: _titleController,
              style: TextStyle(
                color: Theme.of(context).colorScheme.onBackground,
              ),
            ),
            const SizedBox(
              height: 17,
            ),
            TextField(
              decoration: const InputDecoration(labelText: 'price'),
              controller: _priceController,
              keyboardType: TextInputType.number,
              style: TextStyle(
                color: Theme.of(context).colorScheme.onBackground,
              ),
            ),
            const SizedBox(
              height: 17,
            ),
            TextField(
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'Qunantity'),
              controller: _quantityController,
              style: TextStyle(
                color: Theme.of(context).colorScheme.onBackground,
              ),
            ),
            const SizedBox(
              height: 17,
            ),
            ElevatedButton.icon(
              onPressed: _savePlaces,
              icon: const Icon(Icons.add),
              label: const Text("add place"),
            ),
          ],
        ),
      ),
    );
  }
}
