// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:hplusmedcare/Models/addressmodel.dart';
import 'package:hplusmedcare/Screens/Cart/cart.dart';
import 'package:hplusmedcare/Utils/colors.dart';
import 'package:loader_overlay/loader_overlay.dart';

class SelectAddress extends StatefulWidget {
  const SelectAddress({ Key? key }) : super(key: key);

  @override
  State<SelectAddress> createState() => _SelectAddressState();
}

class _SelectAddressState extends State<SelectAddress> {

  late int selectedIndex;
  AppColors colors = AppColors();
  bool _isLoaderVisible = false;

  @override
  void initState() {
    selectedIndex = AddressModel.selectedaddress;
    super.initState();
  }
  


  @override
  Widget build(BuildContext context) {
    
    return LoaderOverlay(
      useDefaultLoading: false,
      overlayWidget: Center(
        child: Container(
          width: 70,
          height: 60,
          decoration: BoxDecoration(
            color: colors.white,
            borderRadius: BorderRadius.circular(6)
          ),
          child: Center(
            child: CircularProgressIndicator(
              color: colors.dotcolor,
            ),
          ),
        )
        ),
      child: Scaffold(
                  body: SafeArea(
                  child:SingleChildScrollView(
                  child: Padding(
                  padding: const EdgeInsets.only(left:32,right:32,bottom:32,top:18),
                  child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                  Row(
                  children: [
                  GestureDetector(
                  onTap: (){
                  Navigator.pop(context);
                  },
                  child: const Icon(Icons.arrow_back_ios,size: 20,)),

                  const SizedBox(width: 15,),
    
                  Text(
                  'Manage Address',
                  style: TextStyle(
                  fontSize: 17,
                  color: colors.textcolor1,
                  fontWeight: FontWeight.w800,
                  ),
                  ),
                            
                  ],
                  ),
                  const SizedBox(height: 30,),
                  Text('Deliver To', style: TextStyle(
                  color: colors.textcolor1,
                  fontSize: 17,
                  fontWeight: FontWeight.w700
                  ),),
                  const SizedBox(height: 15,),
    
                Column(
                children: [
                SizedBox(
                height: 520,
                child: ListView.builder(
                shrinkWrap: true,
                itemCount: AddressModel.useraddress.length,
                itemBuilder: (context,index){
                return Padding(
                padding: const EdgeInsets.only(bottom:35.0),
                child: SelectAdress(colors: colors, index: index, selecteditem: selectedIndex, onchanged: (value)=> setState(() {
                selectedIndex = index;
                AddressModel.selectedaddress = selectedIndex;
                })   ),
                );
                }),
                ),

                const SizedBox(height: 15,),
    
                GestureDetector(
                onTap: ()async{
                context.loaderOverlay.show();                     
                setState(() {
                _isLoaderVisible = context.loaderOverlay.visible;
                });
                await Future.delayed(const Duration(seconds: 1));
                if (_isLoaderVisible) {
                context.loaderOverlay.hide();
                }
                setState(() {
                _isLoaderVisible = context.loaderOverlay.visible;
                });
                Navigator.pushReplacement(context,  MaterialPageRoute(builder: (context)=> Cart()));
                },
                child: Container(
                width: double.infinity,
                height: 60,
                decoration: BoxDecoration(
                color: colors.dotcolor,
                borderRadius: BorderRadius.circular(6)
                ),
                child: Center(child:Text('Save and Continue', style: TextStyle(
                color: colors.white,
                fontSize: 17,
                fontWeight: FontWeight.w700
                ),) ,),
                ),
                ),
                ],
                ),  
               ],
              ),
            )
          )
        ),
      ),
    );
  }
}

class SelectAdress extends StatelessWidget {
  const SelectAdress({
    Key? key,
    required this.colors,
    required this.index,
    required this.selecteditem,
    required this.onchanged
  }) : super(key: key);

  final AppColors colors;
  final int index;
  final int selecteditem;
  final ValueChanged onchanged;
  @override
  Widget build(BuildContext context) {
    final isselected = selecteditem == index;
    return GestureDetector(
      onTap: ()=>onchanged(index),
      child: Container(
      decoration:BoxDecoration(
      border: Border.all(color: isselected ? colors.dotcolor : colors.textcolor2),
      borderRadius: BorderRadius.circular(6),
                  ),
      child: Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          Row(
            children: [
              (AddressModel.useraddress[index].addressType == 'Work') ? Icon(Icons.work,color: colors.dotcolor,) : Icon(Icons.house,color: colors.dotcolor,),
              const SizedBox(width: 15,),
              Text(
                AddressModel.useraddress[index].addressType,
                style: TextStyle(
                fontSize: 17,
                color: colors.textcolor1,
                fontWeight: FontWeight.w700,
                ),
                  ),
        
              const Spacer(),
        
              CircleAvatar(
                radius: 10,
                backgroundColor: isselected ? colors.dotcolor : colors.textcolor2,
                child: CircleAvatar(
                  radius: 8,
                  backgroundColor: colors.white,
                  child: CircleAvatar(
                  radius: 4.5,
                  backgroundColor: isselected ? colors.dotcolor : colors.white,
                  
                )
                ),
              ),
            ],
          ),
        const SizedBox(height: 20,),
          Row(
            children: [
              const SizedBox(width:37 ,),
              Text(
                AddressModel.useraddress[index].name,
                style: TextStyle(
                fontSize: 13,
                color: colors.textcolor1,
                fontWeight: FontWeight.w400,
                ),
                  )
            ],
          ),
        const SizedBox(height: 5,),
          Row(
            children: [
              const SizedBox(width: 37,),
              Flexible(
                child: Text(
                  AddressModel.useraddress[index].address,
                  style: TextStyle(
                  fontSize: 13,
                  color: colors.textcolor1,
                  fontWeight: FontWeight.w400,
                  ),
                    ),
              )
            ],
          ),
        const SizedBox(height: 5,),
          Row(
            children: [
              const SizedBox(width: 37,),
              Text(
                AddressModel.useraddress[index].locality,
                style: TextStyle(
                fontSize: 13,
                color: colors.textcolor1,
                fontWeight: FontWeight.w400,
                ),
                  )
            ],
          ),
        const SizedBox(height: 5,),
          Row(
            children: [
              const SizedBox(width: 37,),
              Text(
                AddressModel.useraddress[index].pinCode,
                style: TextStyle(
                fontSize: 13,
                color: colors.textcolor1,
                fontWeight: FontWeight.w400,
                ),
                  )
            ],
          ),
          const SizedBox(height: 5,),
          Row(
            children: [
              const SizedBox(width: 37,),
              Text(
                AddressModel.useraddress[index].mobileNumber,
                style: TextStyle(
                fontSize: 13,
                color: colors.textcolor1,
                fontWeight: FontWeight.w400,
                ),
                  )
            ],
          ),
        
          const SizedBox(height: 15,),
          Row(
            children: [
              const SizedBox(width: 33,),
              Row(
                children: [
                  Icon(Icons.delete,color: colors.textcolor2,size: 22,),
                  Text(
                'Remove',
                style: TextStyle(
                fontSize: 13,
                color: colors.textcolor2,
                fontWeight: FontWeight.w400,
                ),
                  )
                ],
              ),
            const Spacer(),
              Row(
                children: [
                  Icon(Icons.edit,color: colors.dotcolor,size: 20,),
                  const SizedBox(width: 3,),
                  Text(
                'Edit',
                style: TextStyle(
                fontSize: 13,
                color: colors.dotcolor,
                fontWeight: FontWeight.w400,
                ),
                  )
                ],
              ),
            ],
          ),
        ],
      ),
                  ),
                ),
    );
  }
}