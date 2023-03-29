import 'package:flutter/material.dart';
import '../../../Models/orderModel.dart';
import '../../../repositories/order_repository.dart';

class OrderViewModel extends ChangeNotifier{

  bool isLoaderVisible = false;

  List<Order> orders = [];

  getorders()async{

    isLoaderVisible = true;
    notifyListeners();

    OrderModel ordermodel = await OrderService().getOrders();
    orders = ordermodel.orders;

  
    isLoaderVisible = false;
    notifyListeners();
  }
  

}