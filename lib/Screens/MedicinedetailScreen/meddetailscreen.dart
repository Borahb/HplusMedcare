

// ignore_for_file: import_of_legacy_library_into_null_safe

import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:hplusmedcare/Models/medicinemodel.dart';
import 'package:hplusmedcare/Utils/colors.dart';

class Medicinedetail extends StatelessWidget {
  final Medicine medicine;
  const Medicinedetail({ Key? key,required this.medicine}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppColors colors = AppColors();



    return Scaffold(
      body: SafeArea(
        child:SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(
                        left: 32, right: 32, bottom: 32, top: 18),
            child: Column(
              children: [
                  Row(
                    children: [
                      GestureDetector(
                        onTap: (){
                          Navigator.pop(context);
                        },
                        child: const Icon(Icons.arrow_back_ios,size: 20,)),

                        const SizedBox(width: 15,),

                        Text(
                            'Medicine Details',
                            style: TextStyle(
                            fontSize: 17,
                            color: colors.textcolor1,
                            fontWeight: FontWeight.w800,
                            ),
                              ),
                        const Spacer(),
                        Row(
                          children: [
                            Icon(Icons.search,size: 23, color: colors.textcolor3,),
                            const SizedBox(width: 10,),
                            Icon(Icons.shopping_cart,size: 23, color: colors.textcolor3,),
                          ],
                        )
                    ],
                  ),

                  const SizedBox(height: 10,),

                  Row(
                    children: [
                            Text(
                      'Delivery to',
                      style: TextStyle(
                    fontSize: 12,
                    color: colors.textcolor2,
                    fontWeight: FontWeight.w400,
                      ),
                                        ),
                                        Text(
                      ' 781029 Guwahati',
                      style: TextStyle(
                    fontSize: 12,
                    color: colors.textcolor1,
                    fontWeight: FontWeight.w400,
                      ),
                                        ),
                            const SizedBox(width: 5,),
                            Icon(Icons.arrow_drop_down,size: 15, color: colors.textcolor3,),
                          ],
                  ),

                   const SizedBox(height: 25,
                   child: Divider(thickness: 1,),),

                  Row(                   
                    children: [
                    Flexible(
                    child: Text(
                      medicine.Name,
                      style: TextStyle(
                    fontSize: 18,
                    color: colors.textcolor1,
                    fontWeight: FontWeight.w600,
                      ),
                                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 8,),

                  Row(
                  children: [
                  
                  Flexible(
                    child: Text(
                  'BY ${medicine.Manufacturer_name.toUpperCase()}',
                      style: TextStyle(
                    fontSize: 11,
                    color: colors.textcolor2,
                    fontWeight: FontWeight.w400,
                    ),
                                        ),
                  ),
                ],
                    ),

        
                const SizedBox(height: 8,),
          
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  
                Flexible(
                    child: Text(
                      medicine.Pack_size_label.toUpperCase(),
                      style: TextStyle(
                        fontSize: 11,
                        color: colors.textcolor1,
                        fontWeight: FontWeight.w500,
                  ),
                                            ),
                ),
                
                Icon(EvaIcons.heartOutline,size: 23, color: colors.textcolor2,),

                ],
                ),
                const SizedBox(height: 8,),
                Row(
                  children: [
                    const Spacer(),
                    Icon(EvaIcons.shareOutline,size: 23, color: colors.textcolor2,),
                  ],
                ),
              const SizedBox(height: 60,),
              Row(
                    children: [
                      
                      Text(
                      'Inclusive of all taxes',
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
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [                 
                  const SizedBox(height: 8,),
                  Row(
                    children: [                      
                      Text(
                      'MRP',
                      style: TextStyle(
                              fontSize: 14,
                              color: colors.textcolor2,
                              fontWeight: FontWeight.w400,
                      ),
                                                  ),
                    ],
                  ),
                  const SizedBox(height: 8,),

                  Row(
                children: [
                   
                  Text(
                  '₹${medicine.Price}' ,
                  style: TextStyle(
                          fontSize: 20,
                          color: colors.textcolor1,
                          fontWeight: FontWeight.w600,
                  ),
                      ),
                    ],
                  )
                ],
              ),
              const Spacer(),

              GestureDetector(
                child: Container(
                  height: 40,
                  width: 110,
                  decoration: BoxDecoration(
                    color: colors.dotcolor,
                    borderRadius: BorderRadius.circular(6)
                  ),
                  child: Center(
                    child: Text("Add To Cart",style: TextStyle(
                            fontSize: 14,
                            color: colors.textcolor1,
                            fontWeight: FontWeight.w700,
                    ),),
                  ),
                ),
              )

              
            ],
          ),
          const SizedBox(height: 35,
                   child: Divider(thickness: 1,),),

          Row(
              children: [
                Text(
                '2 days return policy' ,
                style: TextStyle(
                        fontSize: 12,
                        color: colors.textcolor2,
                        fontWeight: FontWeight.w400,
                ),
                    ),
                const SizedBox(width: 5,),
                Text(
                'Read More' ,
                style: TextStyle(
                        decoration: TextDecoration.underline,
                        fontSize: 12,
                        color: colors.dotcolor,
                        fontWeight: FontWeight.w400,
                ),
                    ),
                  ],
              ),

          const SizedBox(height: 35,
                   child: Divider(thickness: 1,),),

          Row(
              children: [
                Text(
                'Product Composition' ,
                style: TextStyle(
                        fontSize: 18,
                        color: colors.textcolor1,
                        fontWeight: FontWeight.w600,
                ),
                    ),
                  ],
              ),

            const SizedBox(height: 8,),

            Row(
              children: [
                Flexible(
                  child: Text(
                  medicine.Short_composition ,
                  style: TextStyle(
                          fontSize: 15,
                          color: colors.textcolor2,
                          fontWeight: FontWeight.w400,
                  ),
                      ),
                ),
                  ],
              ),
            const SizedBox(height: 50,
                   child: Divider(thickness: 1,),),

            Row(
              children: [
                Text(
                'Disclaimer',
                style: TextStyle(
                        fontSize: 16,
                        color: colors.textcolor2,
                        fontWeight: FontWeight.w700,
                ),
                    ),
                  ],
              ),

            const SizedBox(height: 8,),

            Row(
              children: [
                Flexible(
                  child: Text(
                  "The information provided herein is supplied to the best of our abilities to make it accurate and reliable as it is published after a review by a team of professionals. This information is solely intended to provide a general overview on the product and must be used for informational purposes only. You should not use the information provided herein to diagnose, prevent, or cure a health problem. Nothing contained on this page is intended to create a doctor-patient relationship, replace or be a substitute for a registered medical practitioner's medical treatment/advice or consultation. The absence of any information or warning to any medicine shall not be considered and assumed as an implied assurance. We highly recommend that you consult your registered medical practitioner for all queries or doubts related to your medical condition. You hereby agree that you shall not make any health or medical-related decision based in whole or in part on anything contained in the Site. Please click here for detailed T&C." ,
                  style: TextStyle(
                          fontSize: 10,
                          color: colors.textcolor2,
                          fontWeight: FontWeight.w400,
                  ),
                      ),
                ),
                  ],
              ),
            




              ],
            ),
          ),
        ) ,),
    );
  }
}