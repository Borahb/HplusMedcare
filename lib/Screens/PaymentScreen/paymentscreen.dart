// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:hplusmedcare/Utils/colors.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:provider/provider.dart';
import '../../Models/addressmodel.dart';
import 'ViewModel/payment_view_model.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({ Key? key,required this.total }) : super(key: key);
  final int total;
  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {

  AppColors colors = AppColors();
  

  @override
  Widget build(BuildContext context) {

    final paymentviemodel = Provider.of<PaymentViewModel>(context);
    
    return LoaderOverlay(
      useDefaultLoading: false,
      overlayWidget: Center(
        child: Container(
        width: 70,
        height: 60,
        decoration: BoxDecoration(
        color: colors.white,
        borderRadius: BorderRadius.circular(6)
        ),
        child: Center(
        child: CircularProgressIndicator(
        color: colors.dotcolor,
        ),
        ),
        ),
        ),
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(left: 32, right: 32, bottom: 90, top: 18),
              child: Column(
                children: [
    
                Appbar(colors: colors),
    
                const SizedBox(height: 35,),
    
                Row(
                children: [
                Text(
                'Amount to be paid',
                style: TextStyle(
                fontSize: 18,
                color: colors.textcolor1,
                fontWeight: FontWeight.w800,
                ),
                ),
    
                const Spacer(),
    
                Text(
                '₹${widget.total}',
                style: TextStyle(
                fontSize: 18,
                color: colors.textcolor1,
                fontWeight: FontWeight.w800,
                ),
                ),
                  
                ],
                ),

                const SizedBox(height: 15,),

                Row(
                children: [
                Text(
                'Price Breakdown',
                style: TextStyle(
                fontSize: 14,
                color: colors.dotcolor,
                fontWeight: FontWeight.w800,
                ),
                ),
    
                const SizedBox(width: 10,),
    
                Icon(Icons.arrow_forward_ios,color: colors.dotcolor,size: 15,)
                ],
                ),
    
                const SizedBox(height: 25, child: Divider(),),
    
                Row(
                children: [
                Text(
                'UPI',
                style: TextStyle(
                fontSize: 15,
                color: colors.textcolor1,
                fontWeight: FontWeight.w800,
                ),
                ),
                ],
                ),
                
                const SizedBox(height: 8,),
                
                Row(
                children: [
                Image.asset('images/discount.png',height: 20,width: 20,),
                const SizedBox(width: 10,),
                Flexible(
                child: Text(
                'Get cashback upto ₹100 or gift vouchers on all UPI transactions!',
                style: TextStyle(
                fontSize: 12,
                color: colors.textcolor1,
                fontWeight: FontWeight.w400,
                ),
                ),
                ),
                ],
                ),
    
                const SizedBox(height:35 ,),
    
                UPIPaymentOptions(colors: colors),
    
                const SizedBox(height: 35, child: Divider(),),
    
                Row(
                children:[
                Icon(Icons.add,color:colors.dotcolor,size: 20,),
                const SizedBox(width: 5,),
                Text(
                'Add New UPI ID',
                style: TextStyle(
                fontSize: 15,
                color: colors.dotcolor,
                fontWeight: FontWeight.w800,
                ),
                )
                ]
                ),
    
                const SizedBox(height: 35, child: Divider(),),
    
                PaymentOtherOptions(colors: colors, onpressed: ()async{
  
                  paymentviemodel.placeorder(
                    AddressModel.useraddress[AddressModel.selectedaddress].name, 
                    AddressModel.useraddress[AddressModel.selectedaddress].mobileNumber, 
                    AddressModel.useraddress[AddressModel.selectedaddress].pinCode, 
                    AddressModel.useraddress[AddressModel.selectedaddress].locality, 
                    AddressModel.useraddress[AddressModel.selectedaddress].address,  
                    AddressModel.useraddress[AddressModel.selectedaddress].addressType,
                    context
                    );   

                },),
    
              ],),
            ),
          ),
        ),
      ),
    );
  }
}

class UPIPaymentOptions extends StatelessWidget {
  const UPIPaymentOptions({
    super.key,
    required this.colors,
  });

  final AppColors colors;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          children: [
            Container(
              width: 75,
              decoration: BoxDecoration(
                border: Border.all(color: colors.textcolor2),
                borderRadius: BorderRadius.circular(6),
              ),
              child: Center(
                child: Image.asset('images/google_gpay_icon.png',height: 50,width: 50,)
                ),
                ),
                const SizedBox(height:8 ,),
                Text(
        'Google Pay',
        style: TextStyle(
        fontSize: 12,
        color: colors.textcolor1,
        fontWeight: FontWeight.w400,
        ),
          )
          ],
        ),
        const SizedBox(width: 15,),
        Column(
          children: [
            Container(
              height: 53,
              width: 75,
              decoration: BoxDecoration(
                border: Border.all(color: colors.textcolor2),
                borderRadius: BorderRadius.circular(6),
              ),
              child: Center(
                child: Image.asset('images/phonepe-logo-icon.png',height: 35,width: 50,)
                ),
                ),
                const SizedBox(height:8 ,),
                Text(
        'Phonepe UPI',
        style: TextStyle(
        fontSize: 12,
        color: colors.textcolor1,
        fontWeight: FontWeight.w400,
        ),
          )
          ],
        ),

        const SizedBox(width: 15,),

        Column(
          children: [
            Container(
              height: 53,
              width: 75,
              decoration: BoxDecoration(
                border: Border.all(color: colors.textcolor2),
                borderRadius: BorderRadius.circular(6),
              ),
              child: Center(
                child: Image.asset('images/Paytm-Logo.wine.png',height: 60,width: 50,)
                ),
                ),
                const SizedBox(height:8 ,),
                Text(
        'Paytm UPI',
        style: TextStyle(
        fontSize: 12,
        color: colors.textcolor1,
        fontWeight: FontWeight.w400,
        ),
          )
          ],
        ),


      ],
    );
  }
}

class PaymentOtherOptions extends StatelessWidget {
  const PaymentOtherOptions({
    super.key,
    required this.colors,
    required this.onpressed,
  });

  final AppColors colors;
  final Function()? onpressed;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(
                'Other Options',
                style: TextStyle(
                fontSize: 15,
                color: colors.textcolor1,
                fontWeight: FontWeight.w800,
                ),
                  ),
          ],
        ),
        const SizedBox(height: 25,),


              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset('images/debit-card.png',height: 37,width: 50,),
                  const SizedBox(width: 15,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                      'Credit/Debit Card',
                      style: TextStyle(
                      fontSize: 16,
                      color: colors.textcolor1,
                      fontWeight: FontWeight.w700,
                      ),
                        ),
                        const SizedBox(height: 3,),
                      Text(
                      'Up to 150 off on HSBC Cashback \nCredit Card',
                      style: TextStyle(
                      fontSize: 12,
                      color: colors.textcolor2,
                      fontWeight: FontWeight.w400,
                      ),
                        ),
                    ],
                  )

                ],
              ),

              const SizedBox(height: 35, child: Divider(),),

              TextButton(
                onPressed: onpressed,                
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset('images/cash-on-delivery.png',height: 37,width: 50,),
                    const SizedBox(width: 15,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                        'Cash on Delivery',
                        style: TextStyle(
                        fontSize: 16,
                        color: colors.textcolor1,
                        fontWeight: FontWeight.w700,
                        ),
                          ),
                          const SizedBox(height: 3,),
                        Text(
                        'Pay via Cash/UPI on delivery or Pay now',
                        style: TextStyle(
                        fontSize: 12,
                        color: colors.textcolor2,
                        fontWeight: FontWeight.w400,
                        ),
                          ),
                      ],
                    )
              
                  ],
                ),
              ),

              const SizedBox(height: 35, child: Divider(),),
      ],
    );
  }
}

class Appbar extends StatelessWidget {
  const Appbar({
    Key? key,
    required this.colors,
  }) : super(key: key);

  final AppColors colors;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: (){
            Navigator.pop(context);
          },
          child: const Icon(Icons.arrow_back_ios,size: 20,)),

          const SizedBox(width: 15,),

          Text(
              'Payment Options',
              style: TextStyle(
              fontSize: 17,
              color: colors.textcolor1,
              fontWeight: FontWeight.w800,
              ),
                ),
          
      ],
    );
  }
}