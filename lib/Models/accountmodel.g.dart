// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'accountmodel.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AccountModelAdapter extends TypeAdapter<AccountModel> {
  @override
  final int typeId = 2;

  @override
  AccountModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return AccountModel(
      id: fields[0] as String,
      name: fields[1] as String,
      email: fields[2] as String,
      contact: fields[3] as String,
      password: fields[4] as String,
      street: fields[5] as String,
      apartment: fields[6] as String,
      zip: fields[7] as String,
      city: fields[8] as String,
      country: fields[9] as String,
      createdAt: fields[10] as String,
      updatedAt: fields[11] as String,
      v: fields[12] as int,
    );
  }

  @override
  void write(BinaryWriter writer, AccountModel obj) {
    writer
      ..writeByte(13)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.email)
      ..writeByte(3)
      ..write(obj.contact)
      ..writeByte(4)
      ..write(obj.password)
      ..writeByte(5)
      ..write(obj.street)
      ..writeByte(6)
      ..write(obj.apartment)
      ..writeByte(7)
      ..write(obj.zip)
      ..writeByte(8)
      ..write(obj.city)
      ..writeByte(9)
      ..write(obj.country)
      ..writeByte(10)
      ..write(obj.createdAt)
      ..writeByte(11)
      ..write(obj.updatedAt)
      ..writeByte(12)
      ..write(obj.v);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AccountModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
