import 'package:flutter/material.dart';
import 'package:hplusmedcare/Models/categorymodel.dart';
import 'package:hplusmedcare/Utils/colors.dart';

class Categorygridview extends StatelessWidget {
  const Categorygridview({
    Key ?key,
    required this.colors,
  }) : super(key: key);

  final AppColors colors;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap:true,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 2,
      crossAxisSpacing: 13,
      mainAxisSpacing:12,
      mainAxisExtent: 120,
      
      ),
      itemCount: CategoryModel.category.length,
      itemBuilder: (context,index){
        return GestureDetector(
          onTap: (){
            // Navigator.push(context, MaterialPageRoute(builder:(context)=> ProductDetailScreen(
            //     product: ProductModel.products[index],
            //     index: index,
            //     )));
          },
          child: Container(
            
            decoration: BoxDecoration(
              color: CategoryModel.category[index].color,
              borderRadius: BorderRadius.circular(8)
            ),
            child: Center(
              child:Text(CategoryModel.category[index].name, style: TextStyle(
              fontSize: 14,
              color: colors.white,
            fontWeight: FontWeight.w700,
            ),)
            ),
          )
     ); },
      );
  }
}