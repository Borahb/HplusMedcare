

import 'package:flutter/material.dart';
import 'package:hplusmedcare/Utils/utils.dart';
import 'package:loader_overlay/loader_overlay.dart';
import '../../../Models/cartproductmodel.dart';
import '../../../NetworkLayer/app_exceptions.dart';
import '../../../repositories/cart_repository.dart';


class MedicineViewModel extends ChangeNotifier{


final cartRepo = RemoteCartService();


Future<void> addtocart(String productId,int qty,BuildContext context)async{
  
  context.loaderOverlay.show();
  await cartRepo.addCartItem(productId, qty).then((value){

    context.loaderOverlay.hide();

    Utils.flushbarMessage("Added to your cart", context);

  }).onError((AppException error, stackTrace){
      context.loaderOverlay.hide();
      debugPrint(error.toString());
  });


}

 Stream<int> getCart(Duration refreshTime) async* {
  while (true) {
    await Future.delayed(refreshTime);
    yield await getCartItems();
  }
  }

  Future<int> getCartItems()async{
    List<CartProduct> cartproduct = await RemoteCartService().getCart();
    return cartproduct.length;
  }



}