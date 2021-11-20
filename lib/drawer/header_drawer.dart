import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HeaderDrawer extends StatefulWidget {
  const HeaderDrawer({Key? key}) : super(key: key);

  @override
  _HeaderDrawerState createState() => _HeaderDrawerState();
}

class _HeaderDrawerState extends State<HeaderDrawer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFFFE7D6A),
      width: double.infinity,
      height: 200.0,
      padding: const EdgeInsets.only(top: 20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: const EdgeInsets.only(bottom: 10.0),
            height: 70,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: AssetImage('images/client.png')
              )
            ),
          ),
          Text(
            'Client Name',
            style: GoogleFonts.notoSans(
              fontSize: 20.0,
              fontWeight: FontWeight.w600,
              color: Colors.white
            ),
          )
        ],
      ),
    );
  }
}
