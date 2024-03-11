import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:grocery_delivery_side/data/models/request/ProfileUpdateRequestModel.dart';
import 'package:grocery_delivery_side/viewmodels/view_model_profile.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../constants.dart';
import 'package:location/location.dart' as loc;

import '../../data/constants/app_constants_value.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  TextEditingController mobileController = TextEditingController();
  TextEditingController userIdController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  TextEditingController fromDateController = TextEditingController();
  TextEditingController toDateController = TextEditingController();

  TextEditingController pinCodeController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController stateController = TextEditingController();
  TextEditingController countryController = TextEditingController();

  ProfileViewModel profileViewModel = ProfileViewModel();
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  loc.LocationData? locationData;
  List<Placemark>? placemark;
  String address = '';
  String locality = '';
  String state = '';
  String country = '';
  String pinCode = '';
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
   getUserDataFromSharedPref();
    getPermission();
  }

  void getUserDataFromSharedPref() async{
    final SharedPreferences sp =  await SharedPreferences.getInstance();
    nameController.text = sp.getString(Constants.userId) ?? '';
    mobileController.text = sp.getString(Constants.mobile) ?? '';
  }

  void getPermission() async {
    if (await Permission.location.isGranted) {
      getLocation();
    } else {
      setState(() {
        _isLoading = false;
      });
      await Permission.location.request();
    }
  }

  void getLocation() async {
    setState(() {
      _isLoading = true;
    });
    locationData = await loc.Location.instance.getLocation();
    if (locationData != null) {
      getAddress();
    }
  }

  void getAddress() async {
    placemark = await placemarkFromCoordinates(
      locationData!.latitude!,
      locationData!.longitude!,
    );

    if (placemark != null && placemark!.isNotEmpty) {
      final firstPlacemark = placemark![0];
      locality = firstPlacemark.locality ?? '';
      state = firstPlacemark.administrativeArea ?? '';
      country = firstPlacemark.country ?? '';
      pinCode = firstPlacemark.postalCode ?? '';

      setState(() {
        _isLoading = false;
        // Set the text in the state, country, and city text fields
        stateController.text = state;
        countryController.text = country;
        cityController.text = locality;
        pinCodeController.text = pinCode;
      });
    }
  }


  void getRegisterData() {
    if (_formKey.currentState!.validate()) {
      final data = ProfileUpdateRequestModel(
        userId: '5',
        name: nameController.text.toString(),
        phone: mobileController.text.toString(),
        email: emailController.text.toString(),
        address: addressController.text.toString(),
        pinCode: pinCodeController.text.toString(),
        city: cityController.text.toString(),
        state: stateController.text.toString(),
        country: 'India',
      );

      profileViewModel.fetchUpdateProfileData(data, context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: _isLoading
          ? Center(
        child: CircularProgressIndicator(),
      )
          : SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.only(top: 40, left: 16, right: 16, bottom: 16),
                decoration: BoxDecoration(
                  color: kPrimaryColor,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      spreadRadius: 2,
                      blurRadius: 7,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    Text(
                      "Update your Profile",
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontFamily: "Muli",
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(24),
                    topRight: Radius.circular(24),
                  ),
                ),
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 16,vertical: 8),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.vertical(bottom: Radius.circular(24)),
                      ),
                      child: Column(
                        children: [


                          Row(
                            children: [
                              Text(
                                "Detail Update*",
                                style: TextStyle(
                                  fontSize: 17,
                                  color: Colors.black,
                                  fontFamily: "Muli",
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 20),
                          TextFormField(
                            controller: nameController,
                            decoration: InputDecoration(labelText: 'User Name *'),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter your name';
                              }
                              return null;
                            },
                          ),
                          SizedBox(height: 10),
                          TextFormField(
                            controller: userIdController,
                            decoration: InputDecoration(labelText: 'User ID *'),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter your user id';
                              }
                              return null;
                            },
                          ),
                          SizedBox(height: 10),
                          TextFormField(
                            controller: mobileController,
                            decoration: InputDecoration(labelText: 'Phone Number *'),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter your phone number';
                              }
                              return null;
                            },
                          ),
                          SizedBox(height: 10),
                          TextFormField(
                            controller: emailController,
                            decoration: InputDecoration(labelText: 'Email ID *'),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter your email';
                              }
                              return null;
                            },
                          ),


                          SizedBox(height: 15),
                          Row(
                            children: [
                              Text(
                                "Leave Details*",
                                style: TextStyle(
                                  fontSize: 17,
                                  color: Colors.black,
                                  fontFamily: "Muli",
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 15),
                          TextFormField(
                            controller: fromDateController,
                            decoration: InputDecoration(labelText: '01/02/2024 *'),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter your phone number';
                              }
                              return null;
                            },
                          ),
                          SizedBox(height: 10),
                          TextFormField(
                            controller: toDateController,
                            decoration: InputDecoration(labelText: '23/12/2023 *'),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter your email';
                              }
                              return null;
                            },
                          ),


                          SizedBox(height: 15),
                          Row(
                            children: [
                              Text(
                                "Address Details*",
                                style: TextStyle(
                                  fontSize: 17,
                                  color: Colors.black,
                                  fontFamily: "Muli",
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 15),

                          SizedBox(height: 10),
                          TextFormField(
                            controller: addressController,
                            decoration: InputDecoration(labelText: 'Address *'),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter your address';
                              }
                              return null;
                            },
                          ),
                          SizedBox(height: 10),
                          TextFormField(
                            controller: pinCodeController,
                            decoration: InputDecoration(labelText: 'Pin Code *'),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter your pin code';
                              }
                              return null;
                            },
                          ),
                          SizedBox(height: 10),
                          TextFormField(
                            controller: cityController,
                            decoration: InputDecoration(labelText: 'City *'),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter your city';
                              }
                              return null;
                            },
                          ),
                          SizedBox(height: 10),
                          TextFormField(
                            controller: stateController,
                            decoration: InputDecoration(labelText: 'State *'),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter your state';
                              }
                              return null;
                            },
                          ),
                          SizedBox(height: 10),
                          TextFormField(
                            controller: countryController,
                            decoration: InputDecoration(labelText: 'Country *'),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter your country';
                              }
                              return null;
                            },
                          ),





                          SizedBox(height: 20),
                          Container(
                            alignment: Alignment.center,
                            height: 50,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(24),
                              color: kPrimaryColor,
                            ),
                            child: TextButton(
                              onPressed: getRegisterData,
                              child: Text(
                                'Update',
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.white,
                                  fontFamily: "Muli",
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
