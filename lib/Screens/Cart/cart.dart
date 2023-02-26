

import 'package:flutter/material.dart';
import 'package:hplusmedcare/Utils/colors.dart';

class Cart extends StatefulWidget {
  const Cart({ Key? key }) : super(key: key);

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {

   AppColors colors = AppColors();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
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
                            'Your Cart',
                            style: TextStyle(
                            fontSize: 17,
                            color: colors.textcolor1,
                            fontWeight: FontWeight.w800,
                            ),
                              ),
                        
                    ],
                  ),

                  const SizedBox(height: 15,),

                  Row(
                    children: [
                      Text('2 Items in your cart', style: TextStyle(
                        color: colors.textcolor2,
                        fontSize: 13,
                        fontWeight: FontWeight.w500
                      ),),
                    ],
                  ),

                  const SizedBox(height: 15,),

                  ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap:true,
                    itemCount: 2,
                    itemBuilder: (context, index){
                        return Padding(
                          padding: const EdgeInsets.only(bottom:8.0),
                          child: Container(
                            //height: 80,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: colors.white
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Column(
                                children: [
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Image.asset('images/med2.png',width: 50,height: 50,),
                                      const SizedBox(width: 15,),
                                      Flexible(
                                        child: Text('Levipil 500mg' ,style: TextStyle(
                                          color: colors.textcolor1,
                                          fontSize: 15,
                                          fontWeight: FontWeight.w500
                                        ),),
                                      ),
                                      const Spacer(),
                                      Icon(Icons.delete,color: colors.textcolor2,size: 20,)

                                    ],
                                  ),
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      
                                      const SizedBox(width: 65,),
                                      Flexible(
                                        child: Text('15 TABLETS IN STRIP' ,style: TextStyle(
                                          color: colors.textcolor2,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400
                                        ),),
                                      ),
                                      

                                    ],
                                  ),
                                  const SizedBox(height: 10,),
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      
                                      const SizedBox(width: 65,),
                                      Text('MRP' ,style: TextStyle(
                                        color: colors.textcolor2,
                                        fontSize: 10,
                                        fontWeight: FontWeight.w400
                                      ),),
                                      

                                    ],
                                  ),

                                  const SizedBox(height: 5,),
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      
                                      const SizedBox(width: 65,),
                                      Text('₹100' ,style: TextStyle(
                                        color: colors.textcolor1,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400
                                      ),),
                                      const Spacer(),

                                      Container(
                                        height: 30,
                                        
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(6),
                                          border: Border.all(color: colors.textcolor2)
                                        ),
                                        child: Center(
                                          child: Padding(
                                            padding: const EdgeInsets.only(left:8.0),
                                            child: Row(
                                              children: [
                                        Text('Qty 1' ,style: TextStyle(
                                        color: colors.textcolor1,
                                        fontSize: 15,
                                        fontWeight: FontWeight.w400
                                      ),),
                                      const SizedBox(width: 5,),
                                      Icon(Icons.arrow_drop_down,size: 20,)
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),

                                      

                                    ],
                                  ),

                                ],
                              ),
                            ),
                          ),
                        );
                    }
                    ),

                    const SizedBox(height: 25, child:Divider()),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Add More Items' ,style: TextStyle(
                                        color: colors.dotcolor,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w700
                                      ),),
                        Icon(Icons.add_rounded,size: 20,color: colors.dotcolor,)
                      ],
                    ),

                    const SizedBox(height: 25, child:Divider()),
                    Container(
                      height: 40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        border: Border.all(color: colors.dotcolor)
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10, right: 10,),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Apply Coupon' ,style: TextStyle(
                                          color: colors.dotcolor,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w700
                                        ),),
                          Icon(Icons.arrow_forward_ios,size: 20,color: colors.dotcolor,)
                          ],),
                      )
                    ),
                    const SizedBox(height: 20, ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        border: Border.all(color: colors.textcolor2)
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Bill Summary' ,style: TextStyle(
                                  color: colors.textcolor1,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700
                                ),),
                            const SizedBox(height: 25, ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Total MRP' ,style: TextStyle(
                                      color: colors.textcolor2,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400
                                    ),),
                                Text('₹100' ,style: TextStyle(
                                      color: colors.textcolor2,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400
                                    ),),
                              ],
                            ),
                            const SizedBox(height: 10, ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Discount on MRP' ,style: TextStyle(
                                      color: colors.textcolor2,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400
                                    ),),
                                Text('- ₹20' ,style: TextStyle(
                                      color: colors.dotcolor,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400
                                    ),),
                              ],
                            ),
                            const SizedBox(height: 25,child:Divider() ),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Cart Value' ,style: TextStyle(
                                      color: colors.textcolor2,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400
                                    ),),
                                Text('₹80' ,style: TextStyle(
                                      color: colors.textcolor2,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400
                                    ),),
                              ],
                            ),
                            const SizedBox(height: 10, ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Delivery Charges' ,style: TextStyle(
                                      color: colors.textcolor2,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400
                                    ),),
                                Text('₹99' ,style: TextStyle(
                                      color: colors.textcolor2,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400
                                    ),),
                              ],
                            ),

                             const SizedBox(height: 25,child:Divider() ),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Amount to be paid' ,style: TextStyle(
                                      color: colors.textcolor1,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w700
                                    ),),
                                Text('₹179' ,style: TextStyle(
                                      color: colors.textcolor1,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w700
                                    ),),
                              ],
                            ),

                          ],
                        ),
                      ),
                    )




            ],),
          ),
        ),
      ),
    );
  }
}