import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:hplusmedcare/Screens/Explore/Components/medcard.dart';
import 'package:hplusmedcare/Screens/Explore/ViewModel/explore_view_model.dart';
import 'package:hplusmedcare/Screens/MedicinedetailScreen/meddetailscreen.dart';
import 'package:hplusmedcare/repositories/medicine_repository.dart';
import 'package:flutter/material.dart';
import 'package:hplusmedcare/Models/medicinemodel.dart';
import 'package:hplusmedcare/Utils/colors.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';


class Explore extends StatefulWidget {
  const Explore({Key? key}) : super(key: key);

  @override
  State<Explore> createState() => _ExploreState();
}

class _ExploreState extends State<Explore> {

  
  AppColors colors = AppColors();

  @override
  void initState() {

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
    Provider.of<ExploreViewModel>(context,listen: false).isLastPage = false;
    Provider.of<ExploreViewModel>(context,listen: false).pageNumber =0;
    Provider.of<ExploreViewModel>(context,listen: false).error =false;
    });
    
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
          final exploreviewmodel = Provider.of<ExploreViewModel>(context);

          return NotificationListener<ScrollNotification>(
          onNotification: (ScrollNotification scrollInfo) {
          if (scrollInfo.metrics.pixels ==
          scrollInfo.metrics.maxScrollExtent) {
          exploreviewmodel.runFilter(exploreviewmodel.search,context);
          }
          return true;
          },
          child: Scaffold(
          body: SafeArea(
          child: SingleChildScrollView(
          child: Padding(
          padding: const EdgeInsets.only(left: 16, right: 16, bottom: 32, top: 18),

          child: Column(
          children: [

          Row(
            children: [
              GestureDetector(
              onTap: (){
              Navigator.pop(context);
              },
              child: const Icon(Icons.arrow_back,size: 25,)),
              const Spacer(),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.80,
                height: 50,
                child: TextField(
                textInputAction: TextInputAction.search,
                onChanged: (value){
                  
                },
                onSubmitted: (value){
                  
                setState(() {
                exploreviewmodel.search = value;
                exploreviewmodel.runFilter(exploreviewmodel.search,context);
                });
                },
                decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(
                vertical: 10.0, horizontal: 15),
                hintText: "Search",
                suffixIcon: const Icon(Icons.search),
                // prefix: Icon(Icons.search),
                border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15.0),
                borderSide: const BorderSide(),
                ),
                ),
                ),
              ),
            ],
          ),

          const SizedBox(
          height: 20,
          ),


          exploreviewmodel.isLoading ? ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: 5,
          itemBuilder: (context,index){
            return Shimmer.fromColors(
          baseColor: Colors.grey.shade300,
          highlightColor: Colors.grey.shade100,
          child: ShimmerCard(colors: colors));
          }
          ): ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,                      
          itemCount: exploreviewmodel.foundmedicine.length + (exploreviewmodel.isLastPage ? 0 : 1),
          itemBuilder: (context, index) {

          if(exploreviewmodel.foundmedicine.isEmpty){
          return const Center(
          child: Center(
          child: Column(
          children: [
          //Image.asset('images/Search_SVG.png'),
          Text('Search Medicine'),
          ],
          )),
          );
          }

          if (index == exploreviewmodel.foundmedicine.length) {
          if (exploreviewmodel.error) {
          return Center(
          child: errorDialog(size: 15)
          );
          } else {
          return ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: 5,
          itemBuilder: (context,index){
          return Shimmer.fromColors(
          baseColor: Colors.grey.shade300,
          highlightColor: Colors.grey.shade100,
          child: ShimmerCard(colors: colors));
          }
          );
          }
          }

          return GestureDetector(
          onTap: () {
          Navigator.push(context, MaterialPageRoute(builder:(context)=> Medicinedetail(
          medicine: exploreviewmodel.foundmedicine[index]
          )
          ));
          },
          child: MedCard(colors: colors, medDataToShow: exploreviewmodel.foundmedicine, index: index,));
          },
        
          )
              
          ]),
          )),
          )),
          );
            
  }

Widget errorDialog({required double size}){
    return SizedBox(
      height: 180,
      width: 200,
      child:  Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
      Text('An error occurred when fetching the posts.',
      style: TextStyle(
      fontSize: size,
      fontWeight: FontWeight.w500,
      color: Colors.black
      ),
      ),
      const SizedBox(height: 10,),
      CupertinoButton(
      onPressed:  ()  {
      // setState(() {
          
      // //exploreviewmodel.error = false;
      // //loadMedData();
      // });
      },
      child: const Text("Retry", style: TextStyle(fontSize: 20, color: Colors.purpleAccent),)),
        ],
      ),
    );
  }
}

class ShimmerCard extends StatelessWidget {
  const ShimmerCard({
    Key? key,
    required this.colors,
  }) : super(key: key);

  final AppColors colors;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom:8),
      child: Container(
        height: 225,
        width: double.infinity,
        decoration:BoxDecoration(
          color: Colors.white12,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 80,
                  height: 60,
                  decoration:BoxDecoration(
              color: colors.white,
              borderRadius: BorderRadius.circular(5),
                )
                ),
              const SizedBox(width: 4,),

            Container(
                  width: 90,
                  height: 30,
                  decoration:BoxDecoration(
              color: colors.white,
              borderRadius: BorderRadius.circular(5),
                )
                ),
              ],
               ),

               Row(
            children: [
            const SizedBox(width: 84,),  
            Expanded(
              child: Container(
                    height: 30,
                    decoration:BoxDecoration(
                color: colors.white,
                borderRadius: BorderRadius.circular(5),
                  )
                  ),
            )
          ],
            ),
          const SizedBox(height: 8,),
            Row(
            children: [
            const SizedBox(width: 84,),  
            Expanded(
              child: Container(
                    height: 30,
                    decoration:BoxDecoration(
                color: colors.white,
                borderRadius: BorderRadius.circular(5),
                  )
                  ),
            )
          ],
            ),

            const SizedBox(height: 19,),
            Row(

            children: [
            const SizedBox(width: 84,),  
            Column(
              children: [
                Container(
                      width: 30,height: 20,
                      decoration:BoxDecoration(
                  color: colors.white,
                  borderRadius: BorderRadius.circular(5),
                    )
                    ),
                const SizedBox(height: 5,),
                Container(
                  width: 30,height: 20,
                  decoration:BoxDecoration(
              color: colors.white,
              borderRadius: BorderRadius.circular(5),
                )
                )
              ],
            ),
            const Spacer(),
            Container(
                      height: 28,
                      width: 70,
                      decoration:BoxDecoration(
                  color: colors.white,
                  borderRadius: BorderRadius.circular(5),
                    )
                    )
                
          ],
            )
            ],
          ),
        ),
      ),
    );
  }
}




