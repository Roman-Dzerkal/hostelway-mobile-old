import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'profile_vm.dart';
import 'package:flutter/cupertino.dart';
import 'package:hostelway/helpers/custom_color.dart';
import 'package:hostelway/helpers/typography.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return ViewModelBuilder<ProfileViewModel>.reactive(
      viewModelBuilder: () => ProfileViewModel(),
      builder: (context, model, child) {
        return GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(model.unfocusNode),
          child: Scaffold(
            backgroundColor: const Color(0xfffbfbfb),
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    SizedBox(height: 40),
                     Align(
                      alignment: Alignment.center,
                      child: Text('Edit Profile', style: headlineLarge),
                    ),
                    SizedBox(height: 40),
                    CircleAvatar(
                      radius: 60,
                      backgroundImage: AssetImage('assets/images/photo.jpg'),
                    ),
                    SizedBox(height: 40), 
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        //boxShadow: model.shadows,
                      ),
                      child: TextFormField(
                        controller: model.nameController,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: const Color(0xfffbfbfb),
                          hintText: 'First and last name',
                          prefixIcon: const Icon(CupertinoIcons.person),
                          border: UnderlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 40), 
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        //boxShadow: model.shadows,
                      ),
                      child: TextFormField(
                        controller: model.emailController,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: const Color(0xfffbfbfb),
                          hintText: 'Your email',
                          prefixIcon: const Icon(CupertinoIcons.envelope),
                          border: UnderlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 40), 
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        //boxShadow: model.shadows,
                      ),
                      child: Form(
                        child: TextFormField(
                          controller: model.phoneController,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: const Color(0xfffbfbfb),
                            hintText: '+380',
                            prefixIcon: const Icon(CupertinoIcons.phone_fill),
                            border: UnderlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 40),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        //boxShadow: model.shadows,
                      ),
                      child: DropdownButtonFormField<String>(
                        value: model.gender.first,
                        onChanged: (newValue) {
                          if (newValue != null) {
                            model.updateSelectedGender(newValue);
                          }
                        },
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: const Color(0xfffbfbfb),
                          hintText: 'Select your gender',
                          prefixIcon: const Icon(CupertinoIcons.person_fill),
                          border: UnderlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                        items: model.gender.map<DropdownMenuItem<String>>((gender) {
                          return DropdownMenuItem<String>(
                            value: gender,
                            child: Text(gender),
                          );
                        }).toList(),
                      ),
                    ),
                    SizedBox(height: 40), 
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: InkWell(
                            onTap: () async {
                              // ... Save logic ...
                            },
                            child: Container(
                              height: size.height * 0.06, 
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                gradient: LinearGradient(colors: [
                                  CustomColors.primaryColor,
                                  CustomColors.secondaryColor,
                                ]),
                              ),
                              child: Center( 
                                child: Text(
                                  'Save',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

