import 'package:flutter/material.dart';
import '../../../Models/cartproductmodel.dart';
import '../../../repositories/cart_repository.dart';

class HomeScreenViewModel extends ChangeNotifier{


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