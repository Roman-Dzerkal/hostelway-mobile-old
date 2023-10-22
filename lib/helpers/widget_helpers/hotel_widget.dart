import 'package:flutter/material.dart';
import 'package:hostelway/models/hotel_model.dart';

class HotelWidget extends StatelessWidget {
  Hotel hotel;
  HotelWidget(this.hotel, {super.key});

  @override
  Widget build(BuildContext context) {
    print('Aboba');
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(hotel.title, style: TextStyle(color: Colors.black)),
        Text(hotel.price.toString())
      ],
    );
  }
}
