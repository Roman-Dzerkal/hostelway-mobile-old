import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:stacked/stacked.dart';
import 'profile_vm.dart';
import 'package:flutter/cupertino.dart';
import 'package:hostelway/helpers/custom_color.dart';
import 'package:hostelway/helpers/typography.dart';


class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileView();
}


class _ProfileView extends State<ProfileView> {
  bool editable = false;
  //const _ProfileView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    
    return ViewModelBuilder<ProfileViewModel>.reactive(
      viewModelBuilder: () => ProfileViewModel(),
      builder: (context, model, child) {
        return GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(model.unfocusNode),
          child: Scaffold(
            backgroundColor:const  Color.fromARGB(255, 240, 240, 240),
            appBar: AppBar(
              backgroundColor: CustomColors.primaryColor,
              title: !editable
              ? const Text("Profile") : const Text("Edit Profile") 
              ,
              /*leading: IconButton(
                  icon: Icon(Icons.arrow_back),
                  onPressed: () {
                    if (Navigator.of(context).canPop()) {
                      Navigator.of(context).pop();
                    }
                  }),*/
                   actions: [
                      PopupMenuButton(
                        itemBuilder: (BuildContext context) {
                          return [
                            if(!editable) PopupMenuItem(
                              child: Text("Edit profile"),
                              value: "edit",
                            ),
                            PopupMenuItem(
                              child: Text("Logout"),
                              value: "logout",
                            ),
                          ];
                        },
                        onSelected: (value) {
                          if (value == "edit") {
                            /*Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => ProfileEditView()),*/ //переход на новую стр. редактирования 
                            setState(() {
                                editable = !editable; 
                              });
                          } else if (value == "logout") {
                            GoRouter.of(context).go('/login');
                          }
                        },
                      ),
                    ],
            ),
            //backgroundColor: Color.fromARGB(255, 55, 53, 53),
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                   
                     Align(
                      alignment: Alignment.center,
                      //child: Text('Edit Profile', style: headlineLarge),
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
                        enabled: editable,
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
                        enabled: editable,
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
                          enabled: editable,
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
                  if (editable)
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: ElevatedButton(
                        onPressed: () {
                          setState(() {
                                editable = !editable; 
                              });
                        },
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          primary: Colors.transparent,
                          onPrimary: Colors.white,
                          elevation: 0,
                        ),
                        child: Ink(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                CustomColors.primaryColor,
                                CustomColors.secondaryColor,
                              ],
                            ),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Container(
                            constraints: BoxConstraints(minWidth: 88.0, minHeight: 36.0),
                            alignment: Alignment.center,
                            child: Text(
                              'Save',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                              ),
                            ),
                          ),
                        ),
                      ),
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

