import 'dart:io';

import 'package:uuid/uuid.dart';

const uuid = Uuid();

class Plase {
  Plase({
    required this.title,
    required this.price,
    required this.quantity,
    required this.image,
    String? id,
  }) : id = id ?? uuid.v4();
  final String id;
  final String title;
  final String price;
  final String quantity;
  final File image;
}
