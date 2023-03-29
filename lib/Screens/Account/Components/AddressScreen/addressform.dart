// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:provider/provider.dart';
import '../../../../Utils/colors.dart';
import 'ViewModel/address_view_model.dart';

class AddressForm extends StatefulWidget {
  const AddressForm({super.key});

  @override
  State<AddressForm> createState() => _AddressFormState();
}

class _AddressFormState extends State<AddressForm> {

  AppColors colors = AppColors();
  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _pinController = TextEditingController();
  final _addressController = TextEditingController();
  final _localityController = TextEditingController();
  final formkey = GlobalKey<FormState>();
  // Initial Selected Value
  String dropdownvalue = 'Home';   
  // List of items in our dropdown menu
  var items = [    
   'Home', 'Work', 'Other'
  ];

 
  @override
  Widget build(BuildContext context) {

    final addressviewmodel = Provider.of<AddressViewModel>(context);
    
    return LoaderOverlay(
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
              padding: const EdgeInsets.only(left: 32, right: 32, bottom: 90, top: 18),
              child: Form(
                key:formkey ,
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
                'Add Address',
                style: TextStyle(
                fontSize: 17,
                color: colors.textcolor1,
                fontWeight: FontWeight.w800,
                ),
                ),
                ],
                ),
              
                const SizedBox(height: 25,),
              
                Text(
                'Deliver To*',
                style: TextStyle(
                fontSize: 15,
                color: colors.textcolor1,
                fontWeight: FontWeight.w400,
                ),
                ),
                const SizedBox(height: 10,),
    
                TextFormField(
                validator: (value){
                  if(value!.isEmpty){
                    return "Name must contain atleast 1 letter";
                  }else{
                    return null;
                  }
                },
                keyboardType: TextInputType.name,
                decoration: InputDecoration(
                border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(6),
                borderSide: BorderSide(
                  color: colors.bordercolor1
                )
                ),
                hintText: "e.g. Nitin Verma ",       
                ),
                obscureText: false,
                controller: _nameController,
                ),
    
                const SizedBox(height: 15,),
    
                Text(
                'Mobile Number*',
                style: TextStyle(
                fontSize: 15,
                color: colors.textcolor1,
                fontWeight: FontWeight.w400,
                ),
                ),
                const SizedBox(height: 10,),
    
                TextFormField(
                validator: (value){
                  if(value!.length < 10){
                    return "Please enter a valid 10 digit number";
                  }else{
                    return null;
                  }
                },
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(6),
                borderSide: BorderSide(
                  color: colors.bordercolor1
                )
                ),
                hintText: "",       
                ),
                obscureText: false,
                controller: _phoneController,
                ),
    
                const SizedBox(height: 15,),
    
                Text(
                'For all delivery related communication',
                style: TextStyle(
                fontSize: 13,
                color: colors.textcolor2,
                fontWeight: FontWeight.w400,
                ),
                ),
                const SizedBox(height: 20,),
    
    
                Text(
                'Pincode*',
                style: TextStyle(
                fontSize: 15,
                color: colors.textcolor1,
                fontWeight: FontWeight.w400,
                ),
                ),
                const SizedBox(height: 10,),
    
                TextFormField(
                validator: (value){
                  if(value!.length < 6){
                    return "Please enter a 6 digit pincode";
                  }else{
                    return null;
                  }
                },
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(6),
                borderSide: BorderSide(
                  color: colors.bordercolor1
                )
                ),
                hintText: "e.g. 781029",       
                ),
                obscureText: false,
                controller: _pinController,
                ),
    
                const SizedBox(height: 15,),
    
    
                Text(
                'Address*',
                style: TextStyle(
                fontSize: 15,
                color: colors.textcolor1,
                fontWeight: FontWeight.w400,
                ),
                ),
                const SizedBox(height: 10,),
    
                TextFormField(
                validator: (value){
                  if(value!.isEmpty){
                    return "Please enter atleast 1 letter to improve your address";
                  }else{
                    return null;
                  }
                },
                keyboardType: TextInputType.name,
                decoration: InputDecoration(
                border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(6),
                borderSide: BorderSide(
                  color: colors.bordercolor1
                )
                ),
                hintText: "e.g. Block 1 Sector 2 ",       
                ),
                obscureText: false,
                controller: _addressController,
                ),
    
                const SizedBox(height: 15,),
    
    
                Text(
                'Locality*',
                style: TextStyle(
                fontSize: 15,
                color: colors.textcolor1,
                fontWeight: FontWeight.w400,
                ),
                ),
                const SizedBox(height: 10,),
    
                TextFormField(
                validator: (value){
                  if(value!.isEmpty){
                    return "Please enter your locality";
                  }else{
                    return null;
                  }
                },
                keyboardType: TextInputType.name,
                decoration: InputDecoration(
                border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(6),
                borderSide: BorderSide(
                  color: colors.bordercolor1
                )
                ),
                hintText: "e.g. M.G Road",       
                ),
                obscureText: false,
                controller: _localityController,
                ),
    
                const SizedBox(height: 15,),
    
    
                Text(
                'Address Type*',
                style: TextStyle(
                fontSize: 15,
                color: colors.textcolor1,
                fontWeight: FontWeight.w400,
                ),
                ),
    
                const SizedBox(height: 10,),
                
                Container(
                height: 40,
                decoration: BoxDecoration(
                border: Border.all(color: colors.textcolor2),
                borderRadius:BorderRadius.circular(6)
                ),
                child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: DropdownButton(  
                // Initial Value
                underline: const SizedBox(),
                
                value: dropdownvalue,
                borderRadius: BorderRadius.circular(5),
                // Down Arrow Icon
                icon: const Icon(Icons.keyboard_arrow_down),      
                // Array list of items
                items: items.map((String items) {
                return DropdownMenuItem(
                value: items,
                child: Text(items),
                  );
                }).toList(),
                  // After selecting the desired option,it will
                  // change button value to selected value
                onChanged: (String? newValue) { 
                setState(() {
                dropdownvalue = newValue!;
                });
                },
                ),
                ),
                ),
    
    
                const SizedBox(height: 15,),
    
                TextButton(
                style: ButtonStyle(
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0),
                )),
                foregroundColor: MaterialStateProperty.all<Color>(colors.dotcolor),
                backgroundColor: MaterialStateProperty.all<Color>(colors.dotcolor) ),
                onPressed: (){
                if(formkey.currentState!.validate()){                  
                addressviewmodel.addUserAddress(_nameController.text,_phoneController.text,_pinController.text,_localityController.text,_addressController.text,dropdownvalue, context);
                }
                },
                child: SizedBox(
                height: 30,
                width: double.infinity,
                child: Center(
                child: Text("Add",style: TextStyle(
                fontSize: 14,
                color: colors.white,
                fontWeight: FontWeight.w700,
                    ),),
                  ),
                ),
                )
    
    
              
                ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}