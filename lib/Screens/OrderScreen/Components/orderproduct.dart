import 'package:flutter/material.dart';
import '../../../Models/orderModel.dart';
import '../../../Utils/colors.dart';

class OrderProduct extends StatelessWidget {
  final Order order;
  const OrderProduct({super.key,required this.order});

  @override
  Widget build(BuildContext context) {
    AppColors colors = AppColors();
    
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 90, top: 18),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 32, right: 32),
                  child: Row(
                  children: [
                  GestureDetector(
                  onTap: (){
                    Navigator.pop(context);
                  },
                  child: const Icon(Icons.arrow_back_ios,size: 20,)),
                
                  const SizedBox(width: 15,),
                
                  Text(
                  'Orders',
                  style: TextStyle(
                  fontSize: 17,
                  color: colors.textcolor1,
                  fontWeight: FontWeight.w800,
                  ),
                    ),
                            
                  ],),
                ),

                 const SizedBox(height: 25,),

                 Container(
                  height: 50,
                  color: (order.orderStatus == 'Order in Progress') ? colors.dotcolor : colors.green,
                  width: double.infinity,
                  child: Padding(
                  padding: const EdgeInsets.only(left: 32, right: 32),
                  child: Center(
                  child: Row(
                  children: [
                  
                  Text(order.orderStatus.toUpperCase(),style: TextStyle(
                  color: colors.white,
                  fontSize: 13,
                  fontWeight: FontWeight.w600
                  ),),
                  ],
                  ),
                  ),
                  ),
                 ),

                 Container(
                  height: 60,
                  color: colors.white,
                  width: double.infinity,
                  child: Padding(
                  padding: const EdgeInsets.only(left: 32, right: 32),
                  child: Center(
                  child: Padding(
                  padding: const EdgeInsets.only(top: 10,bottom: 10),
                  child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                  Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                  Text("Order ID: ",style: TextStyle(
                  color: colors.textcolor1,
                  fontSize: 13,
                  fontWeight: FontWeight.w400
                  ),),
                  const SizedBox(height: 3,),
                  Text(order.id,style: TextStyle(
                  color: colors.textcolor1,
                  fontSize: 13,
                  fontWeight: FontWeight.w500
                    ),)
                          ],
                        ),
                        
                        ],
                                      ),
                      ),
                    ),
                  ),
                 ),

                  const SizedBox(height: 15,),

                  Container(
                  color: colors.white,
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 32, right: 32),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 10,bottom: 10),
                      child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                      Text('Shipment',style: TextStyle(
                      color: colors.textcolor2,
                      fontSize: 18,
                      fontWeight: FontWeight.w600
                      ),),

                      const SizedBox(height: 15,),

                      Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                        border: Border.all(color: colors.textcolor2),
                        borderRadius: BorderRadius.circular(6)
                        ),
                        child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 20, right: 32,top: 15),
                          child: Text('Items',style: TextStyle(
                          color: colors.textcolor1,
                          fontSize: 15,
                          fontWeight: FontWeight.w500
                          ),),
                        ),
                        const SizedBox(height: 20,),
                          
                        ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: order.products.length,
                        itemBuilder: (context,index){
                        return Padding(
                        padding: const EdgeInsets.only(bottom: 5),
                        child: Column(
                        children: [
                        Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                        const SizedBox(width: 5,),
                        Image.asset('images/med2.png',width: 30,height: 30,),
                        const SizedBox(width: 15,),
                        Flexible(
                        child: Text(order.products[index].product.Name ,style: TextStyle(
                        color: colors.textcolor1,
                        fontSize: 15,
                        fontWeight: FontWeight.w500
                      ),),
                        ),
                                      
                        ],
                      ),
                                              
                      Padding(
                        padding: const EdgeInsets.only(right:20),
                        child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                        const SizedBox(width: 50,),
                        Flexible(
                        child: Text(order.products[index].product.Pack_size_label.toUpperCase(),style: TextStyle(
                        color: colors.textcolor2,
                        fontSize: 11,
                        fontWeight: FontWeight.w400
                        ),),
                          ),
                      
                        const Spacer(),
                        Text('QTY ${order.products[index].qty}',style: TextStyle(
                        color: colors.textcolor2,
                        fontSize: 11,
                        fontWeight: FontWeight.w500
                        ),)
                      
                            ],
                        ),
                      ),
                      const SizedBox(height: 10,),
                      Padding(
                        padding: const EdgeInsets.only(right:20),
                        child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                        const SizedBox(width: 50,),
                        Flexible(
                        child: Text('₹${order.products[index].product.Price * order.products[index].qty}',style: TextStyle(
                        color: colors.textcolor1,
                        fontSize: 15,
                        fontWeight: FontWeight.w500
                        ),),
                          ),
                            ],
                        ),
                      ),

                      const SizedBox(height: 25,child: Divider(),)
                        ],
                        ),
                      );
                      }
                                
                      ),

                      Padding(
                      padding: const EdgeInsets.only(left: 20, right: 32,bottom: 15),
                      child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                      Text('Shipment Total',style: TextStyle(
                      color: colors.textcolor1,
                      fontSize: 12,
                      fontWeight: FontWeight.w400
                      ),),
                      const SizedBox(height:5,),
                      Text('₹${order.grandTotal}',style: TextStyle(
                      color: colors.textcolor1,
                      fontSize: 16,
                      fontWeight: FontWeight.w600
                      ),),
                      ],
                      ),
                      )                       
                      ],
                      ),
                      ),

                      const SizedBox(height: 10,)
                      
                      ],
                                    ),
                    ),
                  ),
                 ),

                const SizedBox(height: 10,),

                Padding(
                padding: const EdgeInsets.only(left: 32,),
                child: Row(
                children: [
                Text('Bill Summary',style: TextStyle(
                color: colors.textcolor1,
                fontSize: 16,
                fontWeight: FontWeight.w600
                ),),
                ],
                  ),
                ),
              
              const SizedBox(height: 10,),

              Padding(
                padding: const EdgeInsets.only(left: 32, right: 32,),
                child: Container(
                decoration: BoxDecoration(
                border: Border.all(color: colors.textcolor2),
                borderRadius: BorderRadius.circular(6),
                color: colors.white
                ),
                child: Column(
                children: [
                Padding(
                padding: const EdgeInsets.only(top:10,left: 10, right: 10,),
                child: Row(
                children: [
                Text('Cart Value',style: TextStyle(
                color: colors.textcolor1,
                fontSize: 13,
                fontWeight: FontWeight.w400
                ),),
                const Spacer(),
                Text('₹${order.grandTotal}',style: TextStyle(
                color: colors.textcolor1,
                fontSize: 13,
                fontWeight: FontWeight.w400
                ),),
                    ],
                  ),
                ),

                Padding(
                padding: const EdgeInsets.only(top:10,left: 10, right: 10,),
                child: Row(
                children: [
                Text('Delivery Charges',style: TextStyle(
                color: colors.textcolor1,
                fontSize: 13,
                fontWeight: FontWeight.w400
                ),),
                const Spacer(),
                Text('Free',style: TextStyle(
                color: colors.dotcolor,
                fontSize: 13,
                fontWeight: FontWeight.w400
                    ),),
                    ],
                  ),
                ),

                const SizedBox(height: 15,child: Divider(),),

                Padding(
                padding: const EdgeInsets.only(left: 10, right: 10,),
                child: Row(
                children: [
                Text('Order Total',style: TextStyle(
                color: colors.textcolor1,
                fontSize: 13,
                fontWeight: FontWeight.w600
                ),),
                const Spacer(),
                Text('₹${order.grandTotal}',style: TextStyle(
                color: colors.textcolor1,
                fontSize: 13,
                fontWeight: FontWeight.w600
                ),),
                ],
                      ),
                    ),

                const SizedBox(height: 15,child: Divider(),),

                Padding(
                padding: const EdgeInsets.only(left: 10, right: 10,),
                child: Row(
                children: [
                Text('PAYMENT MODE',style: TextStyle(
                color: colors.textcolor1,
                fontSize: 13,
                fontWeight: FontWeight.w500
                ),), 
                ],
                ),
                ),

                Padding(
                padding: const EdgeInsets.only(top:15,left: 10, right: 10,bottom:10),
                child: Row(
                children: [
                Text('COD',style: TextStyle(
                color: colors.textcolor1,
                fontSize: 13,
                fontWeight: FontWeight.w400
                ),), 
                ],
                ),
                ),
                ]) ,
                ),
              ),

              const SizedBox(height: 15,),

              Container(
                width: double.infinity,
                color: colors.white,
                child: Padding(
                padding: const EdgeInsets.only(top:15,left: 32, right: 32,bottom:10),
                child: Column(
                children: [
                Row(
                  children: [
                    Text('Other Details',style: TextStyle(
                    color: colors.textcolor1,
                    fontSize: 16,
                    fontWeight: FontWeight.w600
                    ),),
                  ],
                  ),

                  const SizedBox(height: 25,child: Divider(),),

                  Row(
                  children: [
                  Text('Shipping Address',style: TextStyle(
                  color: colors.textcolor2,
                  fontSize: 13,
                  fontWeight: FontWeight.w400
                  ),),
                  ],
                  ),

                  const SizedBox(height: 15,),

                  Row(
                  children: [
                  Flexible(
                    child: Text('${order.shippingDetails.address}, ${order.shippingDetails.locality}, ${order.shippingDetails.pinCode} ',style: TextStyle(
                    color: colors.textcolor1,
                    fontSize: 14,
                    fontWeight: FontWeight.w500
                    ),),
                  ),
                  ],
                  ),

                  const SizedBox(height: 15,),

                  Row(
                  children: [
                  Text('Patient Details',style: TextStyle(
                  color: colors.textcolor2,
                  fontSize: 13,
                  fontWeight: FontWeight.w400
                  ),),
                  ],
                  ),

                  const SizedBox(height: 5,),
                  
                  Row(
                  children: [
                  Text(order.shippingDetails.name,style: TextStyle(
                  color: colors.textcolor1,
                  fontSize: 14,
                  fontWeight: FontWeight.w500
                  ),),
                  ],
                  ),

                  const SizedBox(height: 10,),





                    ],
                  ),
                ),
              ),













              ],
            ),
          ),
        ),
      ),
    );
  }
}