import 'package:flutter/material.dart';
import 'package:hplusmedcare/Models/medicinemodel.dart';
import 'package:hplusmedcare/Screens/Explore/Components/medcard.dart';
import 'package:hplusmedcare/Screens/MedicinedetailScreen/meddetailscreen.dart';
import 'package:hplusmedcare/Utils/colors.dart';

class Medproductview extends StatelessWidget {
  const Medproductview({
    Key? key,
    required List<Medicine> foundmedicine,
    required this.colors,
    required this.error,
    required this.isLastPage,
    required this.pageNumber,
    required this.numberOfMedsPerRequest,
    required this.loading,
    required this.nextPageTrigger,

  }) : _foundmedicine = foundmedicine, super(key: key);

  final List<Medicine> _foundmedicine;
  final AppColors colors;
  final bool isLastPage;
  final int pageNumber;
  final bool error;
  final bool loading;
  final int numberOfMedsPerRequest ;
  final int nextPageTrigger;


  @override
  Widget build(BuildContext context) {
    return ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,                      
                itemCount: _foundmedicine.length + (isLastPage ? 0 : 1),
                itemBuilder: (context, index) {
                  return GestureDetector(
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