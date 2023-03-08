// ignore_for_file: non_constant_identifier_names

import 'dart:convert';

import 'package:flutter/foundation.dart';

class AddressModel {

static List<Addres> useraddress = [];
static int selectedaddress = 0;
}




class Address {
  final String id;
  final String user_id;
  final int v;
  final List<Addres> address;
  final String createdAt;
  final String updatedAt;
  Address({
    required this.id,
    required this.user_id,
    required this.v,
    required this.address,
    required this.createdAt,
    required this.updatedAt,
  });

  Address copyWith({
    String? id,
    String? user_id,
    int? v,
    List<Addres>? address,
    String? createdAt,
    String? updatedAt,
  }) {
    return Address(
      id: id ?? this.id,
      user_id: user_id ?? this.user_id,
      v: v ?? this.v,
      address: address ?? this.address,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'user_id': user_id,
      'v': v,
      'address': address.map((x) => x.toMap()).toList(),
      'createdAt': createdAt,
      'updatedAt': updatedAt,
    };
  }

  factory Address.fromMap(Map<String, dynamic> map) {
    return Address(
      id: map['_id'] as String,
      user_id: map['user_id'] as String,
      v: map['__v'].toInt() as int,
      address: List<Addres>.from((map['address'] as List<int>).map<Addres>((x) => Addres.fromMap(x as Map<String,dynamic>),),),
      createdAt: map['createdAt'] as String,
      updatedAt: map['updatedAt'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Address.fromJson(String source) => Address.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Address(id: $id, user_id: $user_id, v: $v, address: $address, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(covariant Address other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.user_id == user_id &&
      other.v == v &&
      listEquals(other.address, address) &&
      other.createdAt == createdAt &&
      other.updatedAt == updatedAt;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      user_id.hashCode ^
      v.hashCode ^
      address.hashCode ^
      createdAt.hashCode ^
      updatedAt.hashCode;
  }
}

class Addres {
  final String name;
  final String mobileNumber;
  final String pinCode;
  final String locality;
  final String address;
  final String cityDistrictTown;
  final String state;
  final String landmark;
  final String addressType;
  final String id;
  Addres({
    required this.name,
    required this.mobileNumber,
    required this.pinCode,
    required this.locality,
    required this.address,
    required this.cityDistrictTown,
    required this.state,
    required this.landmark,
    required this.addressType,
    required this.id,
  });

  Addres copyWith({
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
    return Addres(
      name: name ?? this.name,
      mobileNumber: mobileNumber ?? this.mobileNumber,
      pinCode: pinCode ?? this.pinCode,
      locality: locality ?? this.locality,
      address: address ?? this.address,
      cityDistrictTown: cityDistrictTown ?? this.cityDistrictTown,
      state: state ?? this.state,
      landmark: landmark ?? this.landmark,
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
      'cityDistrictTown': cityDistrictTown,
      'state': state,
      'landmark': landmark,
      'addressType': addressType,
      'id': id,
    };
  }

  factory Addres.fromMap(Map<String, dynamic> map) {
    return Addres(
      name: map['name'] as String,
      mobileNumber: map['mobileNumber'] as String,
      pinCode: map['pinCode'] as String,
      locality: map['locality'] as String,
      address: map['address'] as String,
      cityDistrictTown: map['cityDistrictTown'] as String,
      state: map['state'] as String,
      landmark: map['landmark'] as String,
      addressType: map['addressType'] as String,
      id: map['_id'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Addres.fromJson(String source) => Addres.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Addres(name: $name, mobileNumber: $mobileNumber, pinCode: $pinCode, locality: $locality, address: $address, cityDistrictTown: $cityDistrictTown, state: $state, landmark: $landmark, addressType: $addressType, id: $id)';
  }

  @override
  bool operator ==(covariant Addres other) {
    if (identical(this, other)) return true;
  
    return 
      other.name == name &&
      other.mobileNumber == mobileNumber &&
      other.pinCode == pinCode &&
      other.locality == locality &&
      other.address == address &&
      other.cityDistrictTown == cityDistrictTown &&
      other.state == state &&
      other.landmark == landmark &&
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
      cityDistrictTown.hashCode ^
      state.hashCode ^
      landmark.hashCode ^
      addressType.hashCode ^
      id.hashCode;
  }
}