import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:stacked/stacked.dart';

class ProfileViewModel extends BaseViewModel {

File? imageFile;
  TextEditingController nameController = TextEditingController(text: 'Inna');
  TextEditingController emailController = TextEditingController(text: 'aprilliss.2001@gmail.com');
  TextEditingController phoneController = TextEditingController(text: '+380938645795');
  
  String selectedGender = 'male';
  List <String> gender = const ['male', 'female', 'other'];

  final FocusNode unfocusNode = FocusNode();
 
  final shadows = const [
    BoxShadow(
      blurRadius: 15,
      color: Color(0x33000000),
      offset: Offset(0, 0),
      spreadRadius: 5,
    )
  ];

  Future<void> pickImageFromGallery() async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      imageFile = File(pickedImage.path);
    }
  }

 void updateSelectedGender(String newValue) {
    selectedGender = newValue;
    notifyListeners(); // Notify listeners that the selected gender has changed
  }



}