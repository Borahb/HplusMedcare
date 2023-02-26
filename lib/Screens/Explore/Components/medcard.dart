import 'package:flutter/material.dart';
import 'package:hplusmedcare/Models/medicinemodel.dart';
import 'package:hplusmedcare/Utils/colors.dart';

class MedCard extends StatelessWidget {
  const MedCard({
    Key? key,

    required this.colors,
    required this.medDataToShow,
    required this.index
  }) : super(key: key);

  final AppColors colors;
  final List<Medicine> medDataToShow;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom:8),
      child: Container(
        decoration: BoxDecoration(
            color: colors.white,
            borderRadius: BorderRadius.circular(8)),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
               
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset('images/med2.png',width: 80,height: 60,),
            const SizedBox(width: 4,),

        Flexible(
          child: Text(
             medDataToShow[index].Name,
            style: TextStyle(
                    fontSize: 14,
                    color: colors.textcolor1,
                    fontWeight: FontWeight.w800,
            ),
                                        ),
        ),
          ],
        ),

        Row(
          children: [
          const SizedBox(width: 84,),  
          Flexible(
            child: Text(
            'BY ${medDataToShow[index].Manufacturer_name.toUpperCase()}',
            style: TextStyle(
                    fontSize: 10,
                    color: colors.textcolor2,
                    fontWeight: FontWeight.w400,
            ),
                                        ),
          ),
          ],
        ),

        
        const SizedBox(height: 8,),
          
          Row(
            children: [
              const SizedBox(width: 84,),  
              Flexible(
                child: Text(
                medDataToShow[index].Pack_size_label.toUpperCase(),
                style: TextStyle(
                        fontSize: 10,
                        color: colors.textcolor1,
                        fontWeight: FontWeight.w400,
                ),
                                            ),
              ),


            ],
          ),
          const SizedBox(height: 19,),
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const SizedBox(width: 84,), 
                      Text(
                      'MRP',
                      style: TextStyle(
                              fontSize: 10,
                              color: colors.textcolor2,
                              fontWeight: FontWeight.w400,
                      ),
                                                  ),
                    ],
                  ),

                  Row(
                children: [
                  const SizedBox(width: 84,), 
                  Text(
                  '₹${medDataToShow[index].Price}' ,
                  style: TextStyle(
                          fontSize: 14,
                          color: colors.textcolor1,
                          fontWeight: FontWeight.w800,
                  ),
        ),
                ],
              )
                ],
              ),
              const Spacer(),

              GestureDetector(
                child: Container(
                  height: 28,
                  width: 70,
                  decoration: BoxDecoration(
                    color: colors.dotcolor,
                    borderRadius: BorderRadius.circular(6)
                  ),
                  child: Center(
                    child: Text("Add",style: TextStyle(
                            fontSize: 14,
                            color: colors.textcolor1,
                            fontWeight: FontWeight.w700,
                    ),),
                  ),
                ),
              )

              
            ],
          ),
          
            ],
          ),
        ),
      ),
    );
  }
}