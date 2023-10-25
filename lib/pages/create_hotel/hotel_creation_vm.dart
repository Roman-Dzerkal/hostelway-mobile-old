import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hostelway/helpers/custom_color.dart';
import 'package:hostelway/helpers/typography.dart';
import 'package:hostelway/pages/auth/login/login_vm.dart';
import 'package:stacked/stacked.dart';
import 'package:shared_preferences/shared_preferences.dart';



class HotelCreationViewModel extends BaseViewModel {
  final TextEditingController hotelNameController = TextEditingController(),
  hotelDescrController = TextEditingController(), hotelPriceController=TextEditingController();


  late SharedPreferences _prefs;
  late String name ="";
  late String description = "";
  late String price = "";


 HotelCreationViewModel() {
    loadSavedValues();
    print(_prefs.getString('name'));
    print(_prefs.getString('desc'));
    print(_prefs.getString('price'));

  }


  Future<void> loadSavedValues() async {
    _prefs = await SharedPreferences.getInstance();
     
    name = _prefs.getString('name') ?? '';
    description = _prefs.getString('desc') ?? '';
    price = _prefs.getString('price') ?? '';
    
  }

  void saveValues() async {
    
    await _prefs.setString('name', hotelNameController.text);
    await _prefs.setString('desc', hotelDescrController.text);
    await _prefs.setString('price', hotelPriceController.text);
    print(_prefs.getString('name'));
    print(_prefs.getString('desc'));
    print(_prefs.getString('price'));
  }
}
  