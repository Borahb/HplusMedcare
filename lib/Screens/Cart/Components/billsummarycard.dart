import 'package:flutter/material.dart';
import 'package:hplusmedcare/Utils/colors.dart';

class BillSummaryCard extends StatelessWidget {
  const BillSummaryCard({
    Key? key,
    required this.colors,
    required this.totalprice,
    required this.deliverycharges,
  }) : super(key: key);

  final AppColors colors;
  final double totalprice;
  final int deliverycharges;

  @override
  Widget build(BuildContext context) {
    return Container(
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
                Text('₹'+totalprice.toString(),style: TextStyle(
                      color: colors.textcolor2,
                      fontSize: 14,
                      fontWeight: FontWeight.w400
                    ),),
              ],
            ),
            //const SizedBox(height: 10, ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //   children: [
            //     Text('Discount on MRP' ,style: TextStyle(
            //           color: colors.textcolor2,
            //           fontSize: 14,
            //           fontWeight: FontWeight.w400
            //         ),),
            //     Text('- ₹20' ,style: TextStyle(
            //           color: colors.dotcolor,
            //           fontSize: 14,
            //           fontWeight: FontWeight.w400
            //         ),),
            //   ],
            // ),
            const SizedBox(height: 25,child:Divider() ),
    
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Cart Value' ,style: TextStyle(
                      color: colors.textcolor2,
                      fontSize: 14,
                      fontWeight: FontWeight.w400
                    ),),
                Text('₹'+totalprice.toString(),style: TextStyle(
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
                Text('₹'+deliverycharges.toString(),style: TextStyle(
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
                Text('₹${deliverycharges + totalprice}',style: TextStyle(
                      color: colors.textcolor1,
                      fontSize: 14,
                      fontWeight: FontWeight.w700
                    ),),
              ],
            ),
    
          ],
        ),
      ),
    );
  }
}