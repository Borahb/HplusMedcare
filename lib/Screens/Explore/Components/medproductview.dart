import 'package:flutter/material.dart';
import 'package:hplusmedcare/Models/medicinemodel.dart';
import 'package:hplusmedcare/Screens/Explore/Components/medcard.dart';
import 'package:hplusmedcare/Screens/MedicinedetailScreen/meddetailscreen.dart';
import 'package:hplusmedcare/Utils/colors.dart';

class Medproductview extends StatelessWidget {
  const Medproductview({
    Key? key,
    required this.present,
    required List<Medicine> foundmedicine,
    required this.colors,
  }) : _foundmedicine = foundmedicine, super(key: key);

  final int present;
  final List<Medicine> _foundmedicine;
  final AppColors colors;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,                      
                itemCount: (present <= MedicineModel.medicines.length) ? _foundmedicine.length + 1 : _foundmedicine.length,
                itemBuilder: (context, index) {
                  return (index == _foundmedicine.length ) ?
                      const Center(
                        child:CircularProgressIndicator()
                      )
                    :GestureDetector(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder:(context)=> Medicinedetail(
                          medicine: _foundmedicine[index]
                          )
                            ));
                      },
                      child: MedCard(colors: colors, medDataToShow: _foundmedicine, index: index,));
                },
                
              );
  }
}