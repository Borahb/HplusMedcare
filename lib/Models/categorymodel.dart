import 'package:flutter/material.dart';

class CategoryModel {


  static final List<Category> category = [
    Category(name: 'Mom & Baby', color: Colors.pink,),
    Category(name: 'Fighting the infection', color: Colors.green,),
    Category(name: 'Diabetes', color: Colors.blueAccent),
    Category(name: 'Antibiotics', color: Colors.redAccent,),
    Category(name: 'Drugs', color: Colors.orangeAccent,),
    Category(name: 'Women', color: Colors.blue,),
    Category(name: 'Cosmetic', color: Colors.lightBlue,),
    Category(name: 'Men', color: Colors.yellow,),
  ];
}






class Category{
  final String name;
  final Color color;
  const Category({required this.name,required this.color});
}