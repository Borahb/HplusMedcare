
import 'package:flutter/material.dart';
import 'package:hplusmedcare/Models/cartproductmodel.dart';
import 'package:hplusmedcare/Screens/Cart/Components/addmoreitem.dart';
import 'package:hplusmedcare/Screens/Cart/Components/appbar.dart';
import 'package:hplusmedcare/Screens/Cart/Components/applycouponbar.dart';
import 'package:hplusmedcare/Screens/Cart/Components/billsummarycard.dart';
import 'package:hplusmedcare/Screens/Cart/Components/bottomtotalprice.dart';
import 'package:hplusmedcare/Screens/Cart/Components/totalitemscard.dart';
import 'package:hplusmedcare/Service/RemoteService/remote_cart_service.dart';
import 'package:hplusmedcare/Utils/colors.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';


class Cart extends StatefulWidget {
  const Cart({ Key? key }) : super(key: key);

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {


   AppColors colors = AppColors();
   List<CartProduct> cartproduct = [];
   late double  totalprice;
   int deliverycharges = 99;
   int total = 0; 
   bool _isLoaderVisible = false;

   getCartItems()async{
    cartproduct = await RemoteCartService().getCart();
    totalprice = totalPrice();
    total = totalprice.toInt() + deliverycharges;
    
    setState(() {
    });
   }

   removeCartItem(String pid)async{
    bool ? res = await RemoteCartService().removeCartItem(pid);
    if(res == true){
      
      setState(() {
        getCartItems();
      });
    }
   }

   double totalPrice (){
    return cartproduct.map((e) => e.product.Price * e.qty).fold(0, (total, current) => total + current);
  }

   @override
  void initState() {
    totalprice = totalPrice();
    getCartItems();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return LoaderOverlay(
      useDefaultLoading: false,
      overlayWidget: Center(
        child: SpinKitFadingCircle(
          color: colors.dotcolor,
          size:50,
        )
        ),
      child: Scaffold(
      bottomSheet: BottomtotalPriceSheet(colors: colors, total: total),

        body: cartproduct.isNotEmpty ? SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(left: 32, right: 32, bottom: 90, top: 18),

              child: Column(
                children: [
                    Appbar(colors: colors),
    
                    const SizedBox(height: 15,),
    
                    Totalitemscard(cartproduct: cartproduct, colors: colors),
    
                    const SizedBox(height: 15,),
    
                    ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap:true,
                      itemCount: cartproduct.length,
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
                                          child: Text(cartproduct[index].product.Name ,style: TextStyle(
                                            color: colors.textcolor1,
                                            fontSize: 15,
                                            fontWeight: FontWeight.w500
                                          ),),
                                        ),
                                        const Spacer(),
                                        GestureDetector(
                                          onTap:()async{
                                            context.loaderOverlay.show();                     
                                            setState(() {
                                            _isLoaderVisible = context.loaderOverlay.visible;
                                            });
                                            getCartItems();
                                            bool ? res = await RemoteCartService().removeCartItem(cartproduct[index].product.id);
                                            
                                            if (_isLoaderVisible) {
                                              context.loaderOverlay.hide();
                                              }
                                            setState(() {
                                              _isLoaderVisible = context.loaderOverlay.visible;
                                            });
                                             //print(res);
                                             //print(cartproduct[index].product.id);
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
                                          child: Text(cartproduct[index].product.Pack_size_label.toUpperCase(),style: TextStyle(
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
                                        Text('₹${cartproduct[index].product.Price * cartproduct[index].qty }',style: TextStyle(
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
                                          Text(cartproduct[index].qty.toString(),style: TextStyle(
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
                            ),
                          );
                      }
                      ),
    
                    const SizedBox(height: 25, child:Divider()),
    
                    Addmoreitem(colors: colors),
    
                    const SizedBox(height: 25, child:Divider()),
                      
                    Applycouponbar(colors: colors),

                    const SizedBox(height: 20, ),

                    BillSummaryCard(colors: colors, totalprice: totalprice, deliverycharges: deliverycharges)
              ],),
            ),
          ),
        ): const Center(child: CircularProgressIndicator(),)
      ),
    ) ;
  }
}











