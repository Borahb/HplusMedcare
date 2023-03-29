// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'dart:convert';

import 'package:hplusmedcare/Models/medicinemodel.dart';

class CartProduct {
  final int qty;
  final Medicine product;
  const CartProduct({
    required this.qty,
    required this.product,
  });

  CartProduct copyWith({
    int? qty,
    Medicine? product,
  }) {
    return CartProduct(
      qty: qty ?? this.qty,
      product: product ?? this.product,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'qty': qty,
      'product': product.toMap(),
    };
  }

  factory CartProduct.fromMap(Map<String, dynamic> map) {
    return CartProduct(
      qty: map['qty'] as int,
      product: Medicine.fromMap(map['product'] as Map<String,dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory CartProduct.fromJson(String source) => CartProduct.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'CartProduct(qty: $qty, product: $product)';

  @override
  bool operator ==(covariant CartProduct other) {
    if (identical(this, other)) return true;
  
    return 
      other.qty == qty &&
      other.product == product;
  }

  @override
  int get hashCode => qty.hashCode ^ product.hashCode;
}
