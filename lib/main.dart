import 'package:flutter/material.dart';
import 'package:emoji_ui/pages/homepage.dart';
import 'package:emoji_ui/pages/cartpage.dart';
import 'package:emoji_ui/pages/contactus.dart';
import 'package:emoji_ui/pages/feedback.dart';
import 'drawer/header_drawer.dart';

void main() {
  runApp(MaterialApp(
    title: 'Emoji Restaurant',
    theme: ThemeData(primarySwatch: Colors.deepOrange),
    debugShowCheckedModeBanner: false,
    home: const Home()
  ));
}

class Home extends StatefulWidget  {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var currentPage = DrawerSections.home;

  @override
  Widget build(BuildContext context) {
    var container;
    if(currentPage == DrawerSections.home) {
      container = const HomePage();
    } else if(currentPage == DrawerSections.feedback) {
      container = const FeedbackPage();
    } else if(currentPage == DrawerSections.contactUs) {
      container = const ContactUsPage();
    } else if(currentPage == DrawerSections.cart) {
      container = const CartPage();
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'K. Restaurant'
        ),
        centerTitle: true,
        backgroundColor: const Color(0xFFFE7D6A),
        elevation: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Container(
              height: 50.0,
              width: 50.0,
              decoration: BoxDecoration(
                boxShadow: [BoxShadow(
                  color: Colors.grey.withOpacity(0.3),
                  blurRadius: 6.0,
                  spreadRadius: 4.0,
                  offset: const Offset(0.0, 3.0)
                )],
                color: const Color(0xFFC6E7FE),
                shape: BoxShape.circle,
                image: const DecorationImage(
                  image: AssetImage('images/client.png'),
                  fit: BoxFit.contain
                )
              ),
            )
          ),
        ]
      ),
      body: container,
      drawer: Drawer(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const HeaderDrawer(),
              drawerList()
            ],
          ),
        ),
      )
    );
  }

  Widget drawerList() {
    return Container(
      padding: const EdgeInsets.only(top: 15.0),
      child: Column(
        children: [
          drawerItem(1, 'Home Page', Icons.home, currentPage == DrawerSections.home ? true : false),
          drawerItem(2, 'Rate Us', Icons.star , currentPage == DrawerSections.feedback ? true : false),
          drawerItem(3, 'Contact Us', Icons.mail, currentPage == DrawerSections.contactUs ? true : false),
          drawerItem(4, 'Your Cart', Icons.shopping_cart, currentPage == DrawerSections.cart ? true : false),
        ],
      ),
    );
  }

  Widget drawerItem(int id, String title, IconData icon, bool selected) {
    return Material(
      color: selected ? Colors.grey[300] : Colors.transparent,
      child: InkWell(
        onTap: () {
          Navigator.pop(context);
          setState(() {
            if(id == 1) {
              currentPage = DrawerSections.home;
            } else if(id == 2) {
              currentPage = DrawerSections.feedback;
            } else if(id == 3) {
              currentPage = DrawerSections.contactUs;
            } else if(id == 4) {
              currentPage = DrawerSections.cart;
            }
          });
        },
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Row(
            children: [
              Expanded(
                child: Icon(
                  icon,
                  size: 20.0,
                  color: const Color(0xFFFE7D6A)
                )
              ),
              Expanded(
                flex: 3,
                child: Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16.0,
                    color: Color(0xFFFE7D6A)
                  ),
                )
              )
            ],
          ),
        ),
      ),
    );
  }
}
enum DrawerSections {
  home, feedback, contactUs, cart
}
