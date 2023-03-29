// ignore_for_file: use_build_context_synchronously
import 'package:flutter/material.dart';
import 'package:hplusmedcare/Screens/OrderScreen/Components/orderproduct.dart';
import 'package:hplusmedcare/Screens/OrderScreen/ViewModel/order_view_model.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import '../../Utils/colors.dart';
import 'package:intl/intl.dart';

class Orders extends StatefulWidget {
  const Orders({super.key});

  @override
  State<Orders> createState() => _OrdersState();
}

class _OrdersState extends State<Orders> {

  AppColors colors = AppColors();

  getFormattedDateFromFormattedString(
  { required value,
    required String currentFormat,
    required String desiredFormat,
    isUtc = false }) {
  DateTime? dateTime = DateTime.now();
  if (value != null || value.isNotEmpty) {
    try {
      dateTime = DateFormat(currentFormat).parse(value, isUtc).toLocal();
    } catch (e) {
      //print("$e");
    }
  }
  return dateTime;
  }
  

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
    Provider.of<OrderViewModel>(context,listen: false).getorders();
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
            body: SafeArea(

            child: Consumer<OrderViewModel>(
              builder: (context,value,child) {
                return Padding(
                padding: const EdgeInsets.only(left: 32, right: 32, bottom: 90, top: 18),
                child: SingleChildScrollView(
                child:Column(
                children: [
                Appbar(colors: colors),
                
                const SizedBox(height: 25,),
                
                value.isLoaderVisible ? 
                               
                const Center(child: CircularProgressIndicator(),) 

                : value.orders.isEmpty ?    

                Center(
                child: Column(
                children: [
                const SizedBox(height: 100,),
                Lottie.asset('images/78016-no-order-found.json'),
                const SizedBox(height: 25,),
                Text('You have not placed any orders yet!', style: TextStyle(
                color: colors.textcolor1,
                fontSize: 16,
                fontWeight: FontWeight.w400
                ),)
                ],
                ),             
                ) : 
                
                ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: value.orders.length,
                  shrinkWrap: true,
                  itemBuilder: (context,index){
                  return GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>OrderProduct(order: value.orders[index])));
                  },
                  child: Padding(
                  padding: const EdgeInsets.only(bottom: 15),
                  child: Container(
                  decoration: BoxDecoration(
                  border: Border.all(color: colors.textcolor2),
                  borderRadius: BorderRadius.circular(6.0)
                  ),
                  child: Padding(
                  padding: const EdgeInsets.only(right: 10.0,top:10.0),
                  child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                  Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                    Text(value.orders[index].shippingDetails.name,style: TextStyle(
                    color: colors.textcolor2,
                    fontSize: 13,
                    fontWeight: FontWeight.w500
                    ),),
                  
                    const SizedBox(height: 25,),
                          
                    ListView.builder( 
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,                             
                    itemCount: value.orders[index].products.length,
                    itemBuilder: (context,_){
                    return Text('⬤  ${value.orders[index].products[_].product.Name}',style: TextStyle(
                    color: colors.textcolor1,
                    fontSize: 15,
                    fontWeight: FontWeight.w300
                    ),);
                      }
                      ),
                    ],
                    ),
                  ),
                  
                  
                  const SizedBox(height: 25,),
        
                  Container(
                    height: 25,
                    width:  (value.orders[index].orderStatus == 'Order in Progress') ? 115 : 75,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(6.0)),
                      color: (value.orders[index].orderStatus == 'Order in Progress') ? colors.dotcolor : colors.green,
                    ),
                    
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                      children: [
                      Text(value.orders[index].orderStatus.toUpperCase(),style: TextStyle(
                      color: colors.white,
                      fontSize: 10,
                      fontWeight: FontWeight.w500
                      ),),
                      ],
                      ),
                    ),
                  ),
          
                  
                              
                  // Row(
                  //   children: [
                  //   Text("Placed On: ",style: TextStyle(
                  //   color: colors.textcolor1,
                  //   fontSize: 13,
                  //   fontWeight: FontWeight.w500
                  //   ),),
                  //   Text(orders[index].orderStatus,style: TextStyle(
                  //   color: (orders[index].orderStatus == 'pending') ? colors.dotcolor : colors.green,
                  //   fontSize: 13,
                  //   fontWeight: FontWeight.w500
                  //   ),),
                  //   ],
                    // ) 
                      ],
                      ),
                      ),
                      ),
                      ),
                      );
                      }
                      )
                      ],
                      ) ,
                      ),
                      );
              }
            ),
                  ),
                  );
                  }
}

class Appbar extends StatelessWidget {
  const Appbar({
    super.key,
    required this.colors,
  });

  final AppColors colors;

  @override
  Widget build(BuildContext context) {
    return Row(
            children: [
          Text(
              'Orders',
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