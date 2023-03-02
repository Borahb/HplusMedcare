import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:hplusmedcare/Screens/Explore/Components/medcard.dart';
import 'package:hplusmedcare/Screens/MedicinedetailScreen/meddetailscreen.dart';
import 'package:hplusmedcare/Service/RemoteService/remote_medicine.dart';
import 'package:flutter/material.dart';
import 'package:hplusmedcare/Models/medicinemodel.dart';
import 'package:hplusmedcare/Utils/colors.dart';
import 'package:shimmer/shimmer.dart';


class Explore extends StatefulWidget {
  const Explore({Key? key}) : super(key: key);

  @override
  State<Explore> createState() => _ExploreState();
}

class _ExploreState extends State<Explore> {

  
  AppColors colors = AppColors();
  final List<Medicine> _foundmedicine = [];
  late bool _isLastPage;
  late int _pageNumber;
  late bool _error;
  final int _numberOfMedsPerRequest = 10;
  

  loadMedData() async {

    var meddata = await RemoteMedicineService().get(_numberOfMedsPerRequest,_pageNumber);
    if (meddata != null) {
      final decodeddata = jsonDecode(meddata.body.toString());
      var medicine = decodeddata["medicine"];
      MedicineModel.medicines = List.from(medicine)
          .map<Medicine>((item) => Medicine.fromMap(item))
          .toList();
     setState(() {
      _isLastPage = MedicineModel.medicines.length < _numberOfMedsPerRequest;
      _pageNumber = _pageNumber + 1;
      _foundmedicine.addAll(MedicineModel.medicines);
     });
    }
  }
  
  //This function is called whenever the text field changes
  void _runFilter(String enteredKeyword) {
    List<Medicine> results = [];
    if (enteredKeyword.isEmpty) {
      // if the search field is empty or only contains white-space, we'll display all users
      results = _foundmedicine;
    } else {
      results = _foundmedicine
          .where((med) =>
              med.Name.toLowerCase().contains(enteredKeyword.toLowerCase()))
          .toList();

    }

    // Refresh the UI
    // setState(() {
    //   _foundmedicine = results;
    //   _foundmedicine.addAll(_foundmedicine.getRange(present, present + perPage));
    // });
  }


  @override
  void initState() {
    _pageNumber = 0;
    _isLastPage = false;  
    _error = false;
    loadMedData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
 
    return NotificationListener<ScrollNotification>(
          onNotification: (ScrollNotification scrollInfo) {
          if (scrollInfo.metrics.pixels ==
              scrollInfo.metrics.maxScrollExtent) {
            loadMedData();
          }
          return true;
        },
          child: Scaffold(
                    body: SafeArea(
                  child: SingleChildScrollView(
                      child: Padding(
                    padding: const EdgeInsets.only(left: 32, right: 32, bottom: 32, top: 18),

                    child: Column(
                      children: [

                      TextField(
                        //onChanged: (value) => _runFilter(value),
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 15),
                          hintText: "Search",
                          suffixIcon: const Icon(Icons.search),
                          // prefix: Icon(Icons.search),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0),
                            borderSide: const BorderSide(),
                          ),
                        ),
                      ),

                      const SizedBox(
                        height: 20,
                      ),


              ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,                      
                itemCount: _foundmedicine.length + (_isLastPage ? 0 : 1),
                itemBuilder: (context, index) {
                   if (index == _foundmedicine.length) {
                    if (_error) {
                      return Center(
                        child: errorDialog(size: 15)
                      );
                    } else {
                      return ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: 10,
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
                          medicine: _foundmedicine[index]
                          )
                            ));
                      },
                      child: MedCard(colors: colors, medDataToShow: _foundmedicine, index: index,));
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
          FlatButton(
              onPressed:  ()  {
                setState(() {
                  
                  _error = false;
                  loadMedData();
                });
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
                  color: Colors.black.withOpacity(0.04),
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




