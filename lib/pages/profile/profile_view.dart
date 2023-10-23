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

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return ViewModelBuilder<ProfileViewModel>.reactive(
      viewModelBuilder: () => ProfileViewModel(),
      builder: (context, model, child) {
        return GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(model.unfocusNode),
          child: Scaffold(
            backgroundColor: const Color.fromARGB(255, 240, 240, 240),
            appBar: AppBar(
              backgroundColor: CustomColors.primaryColor,
              title: !editable
                  ? const Text("Profile")
                  : const Text("Edit Profile"),
              actions: [
                PopupMenuButton(
                  itemBuilder: (BuildContext context) {
                    return [
                      if (!editable)
                        PopupMenuItem(
                          value: "edit",
                          onTap: () {
                            setState(() {
                              editable = !editable;
                            });
                          },
                          child: const Text("Edit profile"),
                        ),
                      PopupMenuItem(
                        value: "logout",
                        onTap: () {
                          GoRouter.of(context).go('/login');
                        },
                        child: const Text("Logout"),
                      ),
                    ];
                  },
                ),
              ],
            ),
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const SizedBox(height: 40),
                    const CircleAvatar(
                      radius: 60,
                      backgroundImage: AssetImage('assets/images/photo.jpg'),
                    ),
                    const SizedBox(height: 40),
                    TextFormField(
                      enabled: editable,
                      controller: model.nameController,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: const Color(0xfffbfbfb),
                        hintText: 'First and last name',
                        prefixIcon: const Icon(CupertinoIcons.person),
                        border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(15)),
                      ),
                    ),
                    const SizedBox(height: 40),
                    TextFormField(
                      enabled: editable,
                      controller: model.emailController,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: const Color(0xfffbfbfb),
                        hintText: 'Your email',
                        prefixIcon: const Icon(CupertinoIcons.envelope),
                        border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(15)),
                      ),
                    ),
                    const SizedBox(height: 40),
                    TextFormField(
                      enabled: editable,
                      controller: model.phoneController,
                      decoration: InputDecoration(
                        prefixText: '+380',
                        filled: true,
                        fillColor: const Color(0xfffbfbfb),
                        prefixIcon: const Icon(CupertinoIcons.phone_fill),
                        border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(15)),
                      ),
                    ),
                    const SizedBox(height: 40),
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
                          border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(15)),
                        ),
                        items: model.gender
                            .map<DropdownMenuItem<String>>((gender) {
                          return DropdownMenuItem<String>(
                            value: gender,
                            child: Text(gender),
                          );
                        }).toList(),
                      ),
                    ),
                    const SizedBox(height: 40),
                    if (editable)
                      InkWell(
                        onTap: () {
                          setState(() {
                            editable = !editable;
                          });
                        },
                        child: Container(
                          height: size.height * 0.05,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                CustomColors.primaryColor,
                                CustomColors.secondaryColor,
                              ],
                            ),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Text(
                            'Save',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                            ),
                          ),
                          alignment: Alignment.center,
                        ),
                      )
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
