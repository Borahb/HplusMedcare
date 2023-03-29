// ignore_for_file: non_constant_identifier_names, file_names

import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:hplusmedcare/Models/medicinemodel.dart';

class OrderModel {
  final String id;
  final String user_id;
  final int v;
  final String createdAt;
  final List<Order> orders;
  final String updatedAt;
  OrderModel({
    required this.id,
    required this.user_id,
    required this.v,
    required this.createdAt,
    required this.orders,
    required this.updatedAt,
  });

  OrderModel copyWith({
    String? id,
    String? user_id,
    int? v,
    String? createdAt,
    List<Order>? orders,
    String? updatedAt,
  }) {
    return OrderModel(
      id: id ?? this.id,
      user_id: user_id ?? this.user_id,
      v: v ?? this.v,
      createdAt: createdAt ?? this.createdAt,
      orders: orders ?? this.orders,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'user_id': user_id,
      'v': v,
      'createdAt': createdAt,
      'orders': orders.map((x) => x.toMap()).toList(),
      'updatedAt': updatedAt,
    };
  }

  factory OrderModel.fromMap(Map<String, dynamic> map) {
    return OrderModel(
      id: map['_id'] as String,
      user_id: map['user_id'] as String,
      v: map['__v'].toInt() as int,
      createdAt: map['createdAt'] as String,
      orders: List<Order>.from((map['orders'] as List<dynamic>).map<Order>((x) => Order.fromMap(x as Map<String,dynamic>),),),
      updatedAt: map['updatedAt'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory OrderModel.fromJson(String source) => OrderModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Order(id: $id, user_id: $user_id, v: $v, createdAt: $createdAt, orders: $orders, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(covariant OrderModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.user_id == user_id &&
      other.v == v &&
      other.createdAt == createdAt &&
      listEquals(other.orders, orders) &&
      other.updatedAt == updatedAt;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      user_id.hashCode ^
      v.hashCode ^
      createdAt.hashCode ^
      orders.hashCode ^
      updatedAt.hashCode;
  }
}

class Order {
  final List<Product> products;
  final int grandTotal;
  final ShippingDetails shippingDetails;
  final String orderStatus;
  final String id;
  Order({
    required this.products,
    required this.grandTotal,
    required this.shippingDetails,
    required this.orderStatus,
    required this.id,
  });

  Order copyWith({
    List<Product>? products,
    int? grandTotal,
    ShippingDetails? shippingDetails,
    String? orderStatus,
    String? id,
  }) {
    return Order(
      products: products ?? this.products,
      grandTotal: grandTotal ?? this.grandTotal,
      shippingDetails: shippingDetails ?? this.shippingDetails,
      orderStatus: orderStatus ?? this.orderStatus,
      id: id ?? this.id,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'products': products.map((x) => x.toMap()).toList(),
      'grandTotal': grandTotal,
      'shippingDetails': shippingDetails.toMap(),
      'orderStatus': orderStatus,
      'id': id,
    };
  }

  factory Order.fromMap(Map<String, dynamic> map) {
    return Order(
      products: List<Product>.from((map['products'] as List<dynamic>).map<Product>((x) => Product.fromMap(x as Map<String,dynamic>),),),
      grandTotal: map['grandTotal'].toInt() as int,
      shippingDetails: ShippingDetails.fromMap(map['shippingDetails'] as Map<String,dynamic>),
      orderStatus: map['orderStatus'] as String,
      id: map['_id'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Order.fromJson(String source) => Order.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Order(products: $products, grandTotal: $grandTotal, shippingDetails: $shippingDetails, orderStatus: $orderStatus, id: $id)';
  }

  @override
  bool operator ==(covariant Order other) {
    if (identical(this, other)) return true;
  
    return 
      listEquals(other.products, products) &&
      other.grandTotal == grandTotal &&
      other.shippingDetails == shippingDetails &&
      other.orderStatus == orderStatus &&
      other.id == id;
  }

  @override
  int get hashCode {
    return products.hashCode ^
      grandTotal.hashCode ^
      shippingDetails.hashCode ^
      orderStatus.hashCode ^
      id.hashCode;
  }
}

class Product {
  final Medicine product;
  final int amount;
  final int qty;
  final String id;
  Product({
    required this.product,
    required this.amount,
    required this.qty,
    required this.id,
  });

  Product copyWith({
    Medicine? product,
    int? amount,
    int? qty,
    String? id,
  }) {
    return Product(
      product: product ?? this.product,
      amount: amount ?? this.amount,
      qty: qty ?? this.qty,
      id: id ?? this.id,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'product': product.toMap(),
      'amount': amount,
      'qty': qty,
      'id': id,
    };
  }

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      product: Medicine.fromMap(map['product'] as Map<String,dynamic>),
      amount: map['amount'].toInt() as int,
      qty: map['qty'].toInt() as int,
      id: map['_id'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Product.fromJson(String source) => Product.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Product(product: $product, amount: $amount, qty: $qty, id: $id)';
  }

  @override
  bool operator ==(covariant Product other) {
    if (identical(this, other)) return true;
  
    return 
      other.product == product &&
      other.amount == amount &&
      other.qty == qty &&
      other.id == id;
  }

  @override
  int get hashCode {
    return product.hashCode ^
      amount.hashCode ^
      qty.hashCode ^
      id.hashCode;
  }
}



class ShippingDetails {
  final String name;
  final String mobileNumber;
  final String pinCode;
  final String locality;
  final String address;
  final String addressType;
  final String id;
  ShippingDetails({
    required this.name,
    required this.mobileNumber,
    required this.pinCode,
    required this.locality,
    required this.address,
    required this.addressType,
    required this.id,
  });

  ShippingDetails copyWith({
    String? name,
    String? mobileNumber,
    String? pinCode,
    String? locality,
    String? address,
    String? cityDistrictTown,
    String? state,
    String? landmark,
    String? addressType,
    String? id,
  }) {
    return ShippingDetails(
      name: name ?? this.name,
      mobileNumber: mobileNumber ?? this.mobileNumber,
      pinCode: pinCode ?? this.pinCode,
      locality: locality ?? this.locality,
      address: address ?? this.address,
      addressType: addressType ?? this.addressType,
      id: id ?? this.id,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'mobileNumber': mobileNumber,
      'pinCode': pinCode,
      'locality': locality,
      'address': address,
      'addressType': addressType,
      '_id': id,
    };
  }

  factory ShippingDetails.fromMap(Map<String, dynamic> map) {
    return ShippingDetails(
      name: map['name'] as String,
      mobileNumber: map['mobileNumber'] as String,
      pinCode: map['pinCode'] as String,
      locality: map['locality'] as String,
      address: map['address'] as String,
      addressType: map['addressType'] as String,
      id: map['_id'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory ShippingDetails.fromJson(String source) => ShippingDetails.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ShippingDetails(name: $name, mobileNumber: $mobileNumber, pinCode: $pinCode, locality: $locality, address: $address, addressType: $addressType, _id: $id)';
  }

  @override
  bool operator ==(covariant ShippingDetails other) {
    if (identical(this, other)) return true;
  
    return 
      other.name == name &&
      other.mobileNumber == mobileNumber &&
      other.pinCode == pinCode &&
      other.locality == locality &&
      other.address == address &&
      other.addressType == addressType &&
      other.id == id;
  }

  @override
  int get hashCode {
    return name.hashCode ^
      mobileNumber.hashCode ^
      pinCode.hashCode ^
      locality.hashCode ^
      address.hashCode ^
      addressType.hashCode ^
      id.hashCode;
  }
}