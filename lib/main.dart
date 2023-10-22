import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hostelway/helpers/configs.dart';
import 'package:hostelway/helpers/custom_color.dart';
import 'package:hostelway/helpers/widget_helpers/hotel_widget.dart';
import 'package:hostelway/pages/rooms/rooms_view.dart';

import 'models/hotel_model.dart';
import 'pages/favourites/favorites_view.dart';
import 'pages/profile/profile_view.dart';

List<Hotel> hotels = [
  Hotel(title: 'Friends', location: 'Dnipro', price: 690),
  Hotel(title: 'Lviv hotel', location: 'Lviv', price: 4500),
  Hotel(title: 'Yeremche hotel', location: 'Yaremche', price: 3000),
];

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // final GoRouter router = configAppRouting();

  logger.i('Welcome to Hostelway!');

  // BotToastInit(); // Инициализация BotToast версии 3.x.x

  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'HostelWay',
    home: HomePage(),
  ));
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedIndex = 0;
  List<Widget> _pages = [
    HomePage(),
    FavouritesPage(),
    RoomsPage(),
    ProfileView(),

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Home'),
          centerTitle: true,
          actions: [
            PopupMenuButton(
              icon: Icon(Icons.sort),
              itemBuilder: (context) {
                return [
                  PopupMenuItem(
                      child: Text('Sort by price'),
                      onTap: () {
                        setState(() {
                          hotels.sort(
                            (a, b) {
                              return a.price.compareTo(b.price);
                            },
                          );
                        });
                      }),
                  PopupMenuItem(
                      child: Text('Sort by title'),
                      onTap: () {
                        setState(() {
                          hotels.sort(
                            (a, b) {
                              return a.title.compareTo(b.title);
                            },
                          );
                        });
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
            }
          ),

      bottomNavigationBar:  BottomNavigationBar(items: [
        BottomNavigationBarItem(icon: Icon(Icons.home, color: CustomColors.primaryColor), label: 'search'), 
         BottomNavigationBarItem(icon: Icon(Icons.favorite, color: CustomColors.primaryColor), label: 'favorite'), 
         BottomNavigationBarItem(icon: Icon(Icons.list, color: CustomColors.primaryColor), label: 'rooms'),
         BottomNavigationBarItem(icon: Icon(Icons.account_circle, color: CustomColors.primaryColor), label: 'profile')
      ],
       currentIndex: selectedIndex,
          onTap: (int index) {
            // Обработчик нажатия на вкладку
            setState(() {
              selectedIndex = index;
            }); Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => _pages.elementAt(index)),
            );
          },
      ),      
    );
  }
}
