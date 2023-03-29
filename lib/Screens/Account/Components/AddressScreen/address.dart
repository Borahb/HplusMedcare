// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:hplusmedcare/Models/addressmodel.dart';
import 'package:hplusmedcare/Screens/Account/Components/AddressScreen/addressform.dart';
import 'package:hplusmedcare/Screens/Account/Components/AddressScreen/editaddressform.dart';
import 'package:hplusmedcare/Utils/colors.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'ViewModel/address_view_model.dart';

class ManageAddress extends StatefulWidget {
  const ManageAddress({ Key? key }) : super(key: key);

  @override
  State<ManageAddress> createState() => _ManageAddressState();
}

class _ManageAddressState extends State<ManageAddress> {

  

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
    Provider.of<AddressViewModel>(context,listen: false).getUserAddress();
    });
  }


  @override
  Widget build(BuildContext context) {

    AppColors colors = AppColors();
    final addressviewmodel = Provider.of<AddressViewModel>(context);
    
    return  LoaderOverlay(
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
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(left:32,right:32,bottom:32,top:18),
              child: Column(
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
    
                  const SizedBox(height: 20,),
    
                 addressviewmodel.loading ?  const Center(child: CircularProgressIndicator()) : AddressModel.useraddress.isEmpty ? Center(
                  
                  child:Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                  const SizedBox(height: 70,),
                  Lottie.asset('images/131552-empty.json'),
                  const SizedBox(height: 15,),
                  Text('No Address found!', style: TextStyle(
                  color: colors.textcolor1,
                  fontSize: 16,
                  fontWeight: FontWeight.w600
                  ),),
                  const SizedBox(height: 8,),
                  Text('You have no address saved', style: TextStyle(
                  color: colors.textcolor1,
                  fontSize: 13,
                  fontWeight: FontWeight.w400
                  ),),
    
                  const SizedBox(height: 40,),
    
                  TextButton(
                  onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> const AddressForm()));
                  },
                  child: Container(
                  height: 40,
                  width: 170,
                  decoration: BoxDecoration(
                  border:Border.all(color:colors.dotcolor),
                  borderRadius: BorderRadius.circular(6)
                  ),
                  child: Center(
                  child:Text('Add New',style: TextStyle(
                  color: colors.dotcolor,
                  fontSize: 15,
                  fontWeight: FontWeight.w600
                  )),),
                  ),
                  )
    
    
                  ],
                  ) ,) 
                  : Column(
                  children: [
                  TextButton(
                  onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> const AddressForm()));
                  },
                  child: Container(
                  height: 40,
                  width: double.infinity,
                  decoration: BoxDecoration(
                  border:Border.all(color:colors.dotcolor),
                  borderRadius: BorderRadius.circular(6)
                  ),
                  child: Center(
                  child:Text('Add New',style: TextStyle(
                  color: colors.dotcolor,
                  fontSize: 15,
                  fontWeight: FontWeight.w600
                  )),),
                  ),
                  ),
    
                  const SizedBox(height: 20,),
    
                  ListView.builder(
                  shrinkWrap: true,
                  itemCount: AddressModel.useraddress.length,
                  itemBuilder: (context,index){
                  return AddressCard(colors: colors, index: index, ontap1: ()async{                 
                  addressviewmodel.removeUserAddress(AddressModel.useraddress[index].id, context);

                  },
                  ontap2: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> EditAddressForm(name:AddressModel.useraddress[index].name, id: AddressModel.useraddress[index].id , number: AddressModel.useraddress[index].mobileNumber,)));
                  },);
                  }),
                  ],
                  ),
    
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class AddressCard extends StatelessWidget {
  const AddressCard({
    Key? key,
    required this.colors,
    required this.index,
    required this.ontap1,
    required this.ontap2
  }) : super(key: key);

  final AppColors colors;
  final int index;
  final Function()? ontap1;
  final Function()? ontap2;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom:8.0),
      child: Container(
                  decoration:BoxDecoration(
      border: Border.all(color: colors.textcolor2),
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
                  )
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
              GestureDetector(
                onTap: ontap1,
                child: Row(
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
              ),
            const Spacer(),
              GestureDetector(
                onTap: ontap2,
                child: Row(
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