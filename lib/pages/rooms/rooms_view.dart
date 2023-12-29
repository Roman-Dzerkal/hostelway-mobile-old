import 'package:flutter/material.dart';
import 'package:hostelway/helpers/custom_color.dart';

class RoomsPage extends StatelessWidget {
  RoomsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: CustomColors.primaryColor,
        title: Text("Booked Rooms"),
        leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              if (Navigator.of(context).canPop()) {
                Navigator.of(context).pop();
              }
            }),
      ),
      body: Column(
        children: [
          TextField(
            controller: TextEditingController(),
            onTapOutside: (event) {
              print(event.position);
            },
            decoration: InputDecoration(
              floatingLabelBehavior: FloatingLabelBehavior.never,
                prefixIcon: Icon(Icons.search),
                suffixIcon: Icon(Icons.clear),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50))),
          )
        ],
      ),
    );
  }
}
