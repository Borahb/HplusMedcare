import 'dart:convert';
import 'package:hive/hive.dart';
//part 'accountmodel.g.dart';




@HiveType(typeId: 2)
class AccountModel {
  @HiveField(0)
  final String id;
  @HiveField(1)
  final String name;
  @HiveField(2)
  final String email;
  @HiveField(3)
  final String contact;
  @HiveField(4)
  final String password;
  @HiveField(5)
  @HiveField(10)
  final String createdAt;
  @HiveField(11)
  final String updatedAt;
  @HiveField(12)
  final int v;
  AccountModel({
    required this.id,
    required this.name,
    required this.email,
    required this.contact,
    required this.password,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  AccountModel copyWith({
    String? id,
    String? name,
    String? email,
    String? contact,
    String? password,
    String? country,
    String? createdAt,
    String? updatedAt,
    int? v,
  }) {
    return AccountModel(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      contact: contact ?? this.contact,
      password: password ?? this.password,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      v: v ?? this.v,
    );
  }
static late  AccountModel accoundata;


  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'email': email,
      'contact': contact,
      'password': password,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      'v': v,
    };
  }

  factory AccountModel.fromMap(Map<String, dynamic> map) {
    return AccountModel(
      id: map['_id'] as String,
      name: map['name'] as String,
      email: map['email'] as String,
      contact: map['contact'] as String,
      password: map['password'] as String,
      createdAt: map['createdAt'] as String,
      updatedAt: map['updatedAt'] as String,
      v: map['__v'].toInt() as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory AccountModel.fromJson(String source) => AccountModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'AccountModel(id: $id, name: $name, email: $email, contact: $contact, password: $password, createdAt: $createdAt, updatedAt: $updatedAt, v: $v)';
  }

  @override
  bool operator ==(covariant AccountModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.name == name &&
      other.email == email &&
      other.contact == contact &&
      other.password == password &&
      other.createdAt == createdAt &&
      other.updatedAt == updatedAt &&
      other.v == v;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      name.hashCode ^
      email.hashCode ^
      contact.hashCode ^
      password.hashCode ^
      createdAt.hashCode ^
      updatedAt.hashCode ^
      v.hashCode;
  }
}