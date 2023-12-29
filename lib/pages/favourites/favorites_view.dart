import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hostelway/helpers/custom_color.dart';
import 'package:hostelway/helpers/typography.dart';
import 'package:hostelway/pages/auth/login/login_vm.dart';
import 'package:stacked/stacked.dart';

import '../../helpers/widget_helpers/hotel_widget.dart';
import '../../models/hotel_model.dart';

class FavouritesPage extends StatelessWidget {
  FavouritesPage({Key? key}) : super(key: key);
List<Hotel> hotels = [
  Hotel(title: 'Friends', location: 'Dnipro', price: 690),
  Hotel(title: 'Lviv hotel', location: 'Lviv', price: 4500),
  Hotel(title: 'Yeremche hotel', location: 'Yaremche', price: 3000),
];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: CustomColors.primaryColor,
        title: const Text('Favorites'),
        centerTitle: true,
        actions: [
          PopupMenuButton(
            icon: Icon(Icons.sort),
            itemBuilder: (context) {
              return [
                PopupMenuItem(
                    child: Text('Sort by price'),
                    onTap: () {
                      // setState(() {
                      //   hotels.sort(
                      //     (a, b) {
                      //       return a.price.compareTo(b.price);
                      //     },
                      //   );
                      // });
                    }),
                PopupMenuItem(
                    child: Text('Sort by title'),
                    onTap: () {
                      // setState(() {
                      //   hotels.sort(
                      //     (a, b) {
                      //       return a.title.compareTo(b.title);
                      //     },
                      //   );
                      // });
                    })
              ];
            },
          )
        ],
      ),
      body: ListView.builder(
          itemCount: hotels.length,
          itemBuilder: (context, index) {
            return HotelWidget(hotels.elementAt(index));
          }),
    );
  }
}
