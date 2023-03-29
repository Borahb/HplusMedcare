

import 'package:flutter/material.dart';
import 'package:loader_overlay/loader_overlay.dart';
import '../../../Models/cartproductmodel.dart';
import '../../../NetworkLayer/app_exceptions.dart';
import '../../../repositories/cart_repository.dart';

class CartViewModel extends ChangeNotifier{

List<CartProduct> cartproduct = [];
double  totalprice = 0;
int deliverycharges = 0;
int total = 0; 
bool loading = false;

final orderRepo = RemoteCartService();

double totalPrice (){
return cartproduct.map((e) => e.product.Price * e.qty).fold(0, (total, current) => total + current);
}

Future<void> getCart(BuildContext context)async{

  loading = true;
  notifyListeners();

  await orderRepo.getCart().then((value){

    debugPrint("cartproduct {$value.toString()}");
    cartproduct = value;
    totalprice = totalPrice();
    total = totalprice.toInt() + deliverycharges;

    loading = false;
    notifyListeners();

  }).onError((AppException error, stackTrace){

      loading = false;
      notifyListeners();
      debugPrint(error.toString());
    
  });

}

Future<void> removeCartItem(String productId,BuildContext context)async{

  context.loaderOverlay.show(); 

  await orderRepo.removeCartItem(productId).then((value){

    context.loaderOverlay.hide();
    getCart(context);

  }).onError((AppException error, stackTrace){

      loading = false;
      notifyListeners();
      debugPrint(error.toString());
    
  });

}












}