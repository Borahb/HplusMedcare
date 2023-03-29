// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:hplusmedcare/Models/addressmodel.dart';
import 'package:hplusmedcare/Screens/Cart/Components/SavedAddress/selectaddress.dart';
import 'package:hplusmedcare/Screens/Cart/Components/addmoreitem.dart';
import 'package:hplusmedcare/Screens/Cart/Components/appbar.dart';
import 'package:hplusmedcare/Screens/Cart/Components/applycouponbar.dart';
import 'package:hplusmedcare/Screens/Cart/Components/billsummarycard.dart';
import 'package:hplusmedcare/Screens/Cart/Components/bottomtotalprice.dart';
import 'package:hplusmedcare/Screens/Cart/Components/totalitemscard.dart';
import 'package:hplusmedcare/Screens/Cart/ViewModel/cart_view_model.dart';
import 'package:hplusmedcare/Utils/colors.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:provider/provider.dart';
import 'Components/manageaddress.dart';



class Cart extends StatefulWidget {
  const Cart({ Key? key }) : super(key: key);

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {

   AppColors colors = AppColors();

   @override
   void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
    Provider.of<CartViewModel>(context,listen: false).getCart(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    final orderviewmodel = Provider.of<CartViewModel>(context);

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
              )
              ),
              child: Scaffold(
              body: SafeArea(
              child: SingleChildScrollView(
              child: Padding(
              padding: const EdgeInsets.only(left: 32, right: 32, bottom: 90, top: 18),

              child: Column(
              children: [
              Appbar(colors: colors),
    
              const SizedBox(height: 15,),

              orderviewmodel.loading ? const Center(child: CircularProgressIndicator()) : orderviewmodel.cartproduct.isNotEmpty ? Column(
              children: [
              Totalitemscard(cartproduct: orderviewmodel.cartproduct, colors: colors),
              const SizedBox(height: 15,),
    
              ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap:true,
              itemCount: orderviewmodel.cartproduct.length,
              itemBuilder: (context, index){
              return Padding(
              padding: const EdgeInsets.only(bottom:8.0),
              child: Container(
                //height: 80,
              width: double.infinity,
              decoration: BoxDecoration(
              color: colors.white,
              borderRadius: BorderRadius.circular(6)
              ),
              child:  Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
              children: [
              Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
              Image.asset('images/med2.png',width: 50,height: 50,),
              const SizedBox(width: 15,),
              Flexible(
                child: Text(orderviewmodel.cartproduct[index].product.Name ,style: TextStyle(
                color: colors.textcolor1,
                fontSize: 15,
                fontWeight: FontWeight.w500
              ),),
              ),

              const Spacer(),

              GestureDetector(
              onTap:(){
                debugPrint(orderviewmodel.cartproduct[index].product.id);
                orderviewmodel.removeCartItem(orderviewmodel.cartproduct[index].product.id, context);
              },
              child: Icon(Icons.delete,color: colors.textcolor2,size: 25,))

              ],
              ),

              const SizedBox(height: 15,),

              Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                
              const SizedBox(width: 65,),
              Flexible(
              child: Text(orderviewmodel.cartproduct[index].product.Pack_size_label.toUpperCase(),style: TextStyle(
              color: colors.textcolor2,
              fontSize: 12,
              fontWeight: FontWeight.w500
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

              const SizedBox(height: 3,),
              Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                
              const SizedBox(width: 65,),
              Text('₹${orderviewmodel.cartproduct[index].product.Price * orderviewmodel.cartproduct[index].qty }',style: TextStyle(
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
                Text(orderviewmodel.cartproduct[index].qty.toString(),style: TextStyle(
                color: colors.textcolor1,
                fontSize: 15,
                fontWeight: FontWeight.w400
                ),),
                const SizedBox(width: 5,),
                const Icon(Icons.arrow_drop_down,size: 20,)
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
                ) ,
                );
                }
                ),
    
                const SizedBox(height: 25, child:Divider()),

                Addmoreitem(colors: colors),

                const SizedBox(height: 25, child:Divider()),
                  
                Applycouponbar(colors: colors),

                const SizedBox(height: 20, ),

                BillSummaryCard(colors: colors, totalprice: orderviewmodel.totalprice, deliverycharges: orderviewmodel.deliverycharges),

                const SizedBox(height: 20,),

                AddressModel.useraddress.isEmpty ? Container() : GestureDetector(
                onTap: (){
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> const SelectAddress()));
                },
                child: Flexible(
                child: Container(
                width: double.infinity,
                height: 70,
                decoration:BoxDecoration(
                  color: Colors.grey.shade200
                ),
                child: Padding(
                padding: const EdgeInsets.only(left: 10, right: 10, top: 25),
                child:Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                Row(
                children: [
                Text('DELIVER TO ${AddressModel.useraddress[AddressModel.selectedaddress].addressType.toUpperCase()}', style: TextStyle(
                color: colors.textcolor1,
                fontSize: 10,
                fontWeight: FontWeight.w600
                ),),
                const Spacer(),
                            
                Text('Change', style: TextStyle(
                color: colors.dotcolor,
                fontSize: 10,
                fontWeight: FontWeight.w600
                ),),
                            
                  ],
                ),
                              
                Text('${AddressModel.useraddress[AddressModel.selectedaddress].address} ${AddressModel.useraddress[AddressModel.selectedaddress].locality}' , style: TextStyle(
                  color: colors.textcolor1,
                  fontSize: 10,
                  fontWeight: FontWeight.w400
                ),
                overflow: TextOverflow.ellipsis,
                
                )
                ],
                ),
                ),
                ),
                ),
                ),

                const SizedBox(height:15),

              AddressModel.useraddress.isEmpty ? TextButton(
              style: ButtonStyle(
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5.0),
              )),
              foregroundColor: MaterialStateProperty.all<Color>(colors.dotcolor),
              backgroundColor: MaterialStateProperty.all<Color>(colors.dotcolor) ),
              onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>const CartAddressForm()));
              },
              child: SizedBox(
              height: 30,
              width: double.infinity,
              child: Center(
              child: Text("Add Delivery Address",style: TextStyle(
              fontSize: 14,
              color: colors.white,
              fontWeight: FontWeight.w700,
                  ),),
                ),
              ),
              ) : BottomtotalPriceSheet(colors: colors,total: orderviewmodel.total,)


              ],
              ): Center(
              child:Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              const SizedBox(height: 100,),
              Image.asset('images/cart.png'),
              const SizedBox(height: 25,),
              Text('Your Medcine cart is empty!', style: TextStyle(
              color: colors.textcolor1,
              fontSize: 16,
              fontWeight: FontWeight.w500
              ),)
            ],
            ) ,),
    
              
              ],  ),
            ),
          ),
        )
      ),
    ) ;
  }
}











