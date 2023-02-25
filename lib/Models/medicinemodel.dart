// ignore_for_file: non_constant_identifier_names, null_closures, unrelated_type_equality_checks

import 'dart:convert';
import 'package:hive/hive.dart';

part 'medicinemodel.g.dart';

class MedicineModel {

  static final pModel = MedicineModel._internal();

  MedicineModel._internal();

  factory MedicineModel() => pModel; 


  static List<Medicine> medicines = [];

  //get product by id
  Medicine getById(int id) => medicines.firstWhere((element) => element.id == id, orElse: null);

  //getproduct by position
  Medicine getByPosition(int pos) => medicines[pos];
}


@HiveType(typeId: 1)

class Medicine {
  @HiveField(0)
  final String id;
  @HiveField(1)
  final String Name;
  @HiveField(2)
  final String Manufacturer_name;
  @HiveField(3)
  final String Type;
  @HiveField(4)
  final String Pack_size_label;
  @HiveField(5)
  final String Price;
  @HiveField(6)
  final String Short_composition;
  @HiveField(7)
  final String Is_discontinued;


  Medicine({
    required this.id,
    required this.Name,
    required this.Manufacturer_name,
    required this.Type,
    required this.Pack_size_label,
    required this.Price,
    required this.Short_composition,
    required this.Is_discontinued,
  });

  Medicine copyWith({
    String? id,
    String? Name,
    String? Manufacturer_name,
    String? Type,
    String? Pack_size_label,
    String? Price,
    String? Short_composition,
    String? Is_discontinued,
  }) {
    return Medicine(
      id: id ?? this.id,
      Name: Name ?? this.Name,
      Manufacturer_name: Manufacturer_name ?? this.Manufacturer_name,
      Type: Type ?? this.Type,
      Pack_size_label: Pack_size_label ?? this.Pack_size_label,
      Price: Price ?? this.Price,
      Short_composition: Short_composition ?? this.Short_composition,
      Is_discontinued: Is_discontinued ?? this.Is_discontinued,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'Name': Name,
      'Manufacturer_name': Manufacturer_name,
      'Type': Type,
      'Pack_size_label': Pack_size_label,
      'Price': Price,
      'Short_composition': Short_composition,
      'Is_discontinued': Is_discontinued,
    };
  }

  factory Medicine.fromMap(Map<String, dynamic> map) {
    return Medicine(
      id: map['id'] as String,
      Name: map['Name'] as String,
      Manufacturer_name: map['Manufacturer_name'] as String,
      Type: map['Type'] as String,
      Pack_size_label: map['Pack_size_label'] as String,
      Price: map['Price'] as String,
      Short_composition: map['Short_composition'] as String,
      Is_discontinued: map['Is_discontinued'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Medicine.fromJson(String source) => Medicine.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Medicine(id: $id, Name: $Name, Manufacturer_name: $Manufacturer_name, Type: $Type, Pack_size_label: $Pack_size_label, Price: $Price, Short_composition: $Short_composition, Is_discontinued: $Is_discontinued)';
  }

  @override
  bool operator ==(covariant Medicine other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.Name == Name &&
      other.Manufacturer_name == Manufacturer_name &&
      other.Type == Type &&
      other.Pack_size_label == Pack_size_label &&
      other.Price == Price &&
      other.Short_composition == Short_composition &&
      other.Is_discontinued == Is_discontinued;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      Name.hashCode ^
      Manufacturer_name.hashCode ^
      Type.hashCode ^
      Pack_size_label.hashCode ^
      Price.hashCode ^
      Short_composition.hashCode ^
      Is_discontinued.hashCode;
  }
}