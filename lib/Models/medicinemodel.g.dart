// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'medicinemodel.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MedicineAdapter extends TypeAdapter<Medicine> {
  @override
  final int typeId = 1;

  @override
  Medicine read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Medicine(
      id: fields[0] as String,
      Name: fields[1] as String,
      Manufacturer_name: fields[2] as String,
      Type: fields[3] as String,
      Pack_size_label: fields[4] as String,
      Price: fields[5] as String,
      Short_composition: fields[6] as String,
      Is_discontinued: fields[7] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Medicine obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.Name)
      ..writeByte(2)
      ..write(obj.Manufacturer_name)
      ..writeByte(3)
      ..write(obj.Type)
      ..writeByte(4)
      ..write(obj.Pack_size_label)
      ..writeByte(5)
      ..write(obj.Price)
      ..writeByte(6)
      ..write(obj.Short_composition)
      ..writeByte(7)
      ..write(obj.Is_discontinued);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MedicineAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
