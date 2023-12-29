import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hostelway/main.dart';
import 'package:hostelway/pages/create_hotel/hotel_creation_vm.dart';
import 'package:stacked/stacked.dart';
import 'package:flutter/cupertino.dart';
import 'package:hostelway/helpers/custom_color.dart';
import 'package:hostelway/helpers/typography.dart';
import 'package:flutter/services.dart';


class CreateHotelPage extends StatelessWidget {
  const CreateHotelPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return ViewModelBuilder<HotelCreationViewModel>.reactive(
      viewModelBuilder: () => HotelCreationViewModel(),
      builder: (context, model, child) {
        return Scaffold(
              appBar: AppBar(
                title: const Text("Create hotel"),
                leading: BackButton(),
              ),
              body: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child:Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            const SizedBox(height: 40),
                      TextField(
                        controller: model.hotelNameController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Name',
                        ),),
                        const SizedBox(height: 40),
                      TextField(
                        controller: model.hotelDescrController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Description',
                        ),),
                        const SizedBox(height: 40),
                        TextField(
                          controller: model.hotelPriceController,
                          decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Price',
                          
                        ),
                        keyboardType: TextInputType.number,
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                      ],
                      ),
                      const SizedBox(height: 40),
                      InkWell(
                        onTap: () {
                         model.saveValues();
                          Navigator.of(context).push(
                            MaterialPageRoute(builder: (context) => HomePage()),
                          );
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
              
              )
              )

              )
              
          

            );
      }
    
    );

  }
}