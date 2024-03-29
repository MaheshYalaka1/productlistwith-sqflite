import 'dart:io';

import 'package:app_notification/modal.dart/newplace.dart';

import 'package:app_notification/modal.dart/user_products.dart';
import 'package:app_notification/widget/image_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class placeDetailsScreen extends ConsumerStatefulWidget {
  const placeDetailsScreen({super.key, required this.Product});
  final Plase Product;

  @override
  ConsumerState<placeDetailsScreen> createState() {
    return _placeDetailsScreenState();
  }
}

class _placeDetailsScreenState extends ConsumerState<placeDetailsScreen> {
  bool _isEditing = false;
  TextEditingController _titleController = TextEditingController();
  TextEditingController _priceController = TextEditingController();
  TextEditingController _quantityController = TextEditingController();
  File? _selectedImage;

  @override
  void initState() {
    super.initState();
    // Initialize the controllers with the existing values
    _titleController.text = widget.Product.title;
    _priceController.text = widget.Product.price.toString();
    _quantityController.text = widget.Product.quantity.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Product list')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image.file(
                widget.Product.image,
                fit: BoxFit.cover,
                width: 150,
                height: 100,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  _isEditing
                      ? _textkeybord(_titleController, 'Product Title')
                      : _buildText('Product Title: ${widget.Product.title}'),
                  _isEditing
                      ? _buildTextField(_priceController, 'Product Price')
                      : _buildText('Product Price: ${widget.Product.price}'),
                  _isEditing
                      ? _buildTextField(_quantityController, 'Product Quantity')
                      : _buildText(
                          'Product Quantity: ${widget.Product.quantity}'),
                  _selectImage(_selectedImage)
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    if (_isEditing) {
                      _savePlaces(); // Call _savePlaces method when editing is done
                    }
                    _isEditing = !_isEditing; // Toggle editing mode
                  });
                },
                child: Text(_isEditing ? 'Done' : 'Edit'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _savePlaces() {
    final updateTitle = _titleController.text;
    final updatePrice = _priceController.text;
    final updateQuantity = _quantityController.text;
    final productId = widget.Product.id;

    if (updateTitle.isEmpty ||
        updatePrice.isEmpty ||
        updateQuantity.isEmpty ||
        _selectedImage == null) {
      return;
    }
    ref.read(productsListProvider.notifier).updatePlace(
        productId, updateTitle, updatePrice, updateQuantity, _selectedImage!);
    Navigator.of(context).pop();
  }

  Widget _buildText(String text) {
    return Text(
      text,
      style: const TextStyle(
        color: Colors.black,
      ),
    );
  }

  Widget _buildTextField(TextEditingController controller, String labelText) {
    return TextField(
      controller: controller,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        labelText: labelText,
      ),
    );
  }

  Widget _textkeybord(TextEditingController controller, String labelText) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: labelText,
      ),
    );
  }

  Widget _selectImage(File? selectedImage) {
    return _isEditing
        ? ImageInput(
            onPicked: (File image) {
              setState(() {
                _selectedImage = image;
              });
            },
          )
        : SizedBox(
            height: 10,
          ); // Render an empty SizedBox if not editing
  }
}
