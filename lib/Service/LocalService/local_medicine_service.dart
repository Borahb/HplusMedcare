import 'package:hive/hive.dart';
import 'package:hplusmedcare/Models/medicinemodel.dart';

class LocalMedicineService{
  final Box<Medicine> _medicineBox = Hive.box('Medicine');

  // Future<void> init() async {
  //   _medicineBox = await Hive.openBox<Medicine>('Medicine');
  // }


  Future<void> assignAllMedicines({required List<Medicine> medicines })async{
    await _medicineBox.clear();
    await _medicineBox.addAll(medicines);
  }


  List<Medicine> getMedicines() => _medicineBox.values.toList();
}