import 'package:flutter/material.dart';
import 'package:hplusmedcare/Models/addressmodel.dart';
import 'package:hplusmedcare/Utils/colors.dart';

class Address extends StatelessWidget {
  const Address({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppColors colors = AppColors();
    
    return  Scaffold(
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

                ListView.builder(
                  shrinkWrap: true,
                  itemCount: AddressModel.useraddress.length,
                  itemBuilder: (context,index){
                    return AddressCard(colors: colors, index: index,);
                  }),

              ],
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
  }) : super(key: key);

  final AppColors colors;
  final int index;

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
              Icon(Icons.house,color: colors.dotcolor,),
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
          Row(
            children: [
              const SizedBox(width: 37,),
              Text(
                AddressModel.useraddress[index].landmark,
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