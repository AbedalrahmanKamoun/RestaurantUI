import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SideMealTab extends StatefulWidget {
  const SideMealTab({Key? key}) : super(key: key);

  @override
  _SideMealTabState createState() => _SideMealTabState();
}
class _SideMealTabState extends State<SideMealTab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          _buildSideMealItem('Hot dog', '4', '6', '10', 'images/hotdog.png'),
          _buildSideMealItem('Poultry Leg', '5', '12', '17', 'images/chicken.png'),
          _buildSideMealItem('French Fries', '4', '9', '12', 'images/fries.png')
        ],
      )
    );
  }

  _buildSideMealItem(String foodName, String rating, String price, String oldPrice, String imgPath) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
              width: 210.0,
              child: Row(children: [
                Container(
                    height: 75.0,
                    width: 75.0,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(7.0),
                        color: const Color(0xFFFFE3DF)),
                    child: Center(
                        child:
                        Image.asset(imgPath, height: 50.0, width: 50.0))),
                const SizedBox(width: 20.0),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(foodName,
                        style: GoogleFonts.notoSans(
                            fontSize: 14.0, fontWeight: FontWeight.w400)),
                    Row(
                      children: [
                        Text('Rated ' + rating,
                            style: GoogleFonts.notoSans(
                                fontSize: 12.0, fontWeight: FontWeight.w400, color: Colors.amber)),
                        const Icon(FontAwesomeIcons.solidStar,
                            color: Colors.amber, size: 12.0),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Text(
                          '\$' + price,
                          style: GoogleFonts.lato(
                              fontSize: 16.0,
                              fontWeight: FontWeight.w600,
                              textStyle: const TextStyle(color: Color(0xFFF68D7F))),
                        ),
                        const SizedBox(width: 3.0),
                        Text(
                          '\$' + oldPrice,
                          style: GoogleFonts.lato(
                              fontSize: 12.0,
                              decoration: TextDecoration.lineThrough,
                              fontWeight: FontWeight.w600,
                              textStyle: TextStyle(
                                  color: Colors.grey.withOpacity(0.4))),
                        )
                      ],
                    )
                  ],
                )
              ])),
          FloatingActionButton(
            heroTag: foodName,
            mini: true,
            onPressed: () {},
            child: const Center(
                child: Icon(Icons.add, color: Colors.white)
            ),
            backgroundColor: const Color(0xFFFE7D6A),
          )
        ],
      )
    );
  }
}

class DessertTab extends StatefulWidget {
  const DessertTab({Key? key}) : super(key: key);

  @override
  _DessertTabState createState() => _DessertTabState();
}
class _DessertTabState extends State<DessertTab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
          children: <Widget>[
            _buildDessertItem('Chocolate cookie', '5', '7', '11', 'images/cookie.png'),
            _buildDessertItem('Vanilla cake', '3', '10', '15', 'images/cake.png'),
            _buildDessertItem('Chocolate donut', '4', '7', '10', 'images/donut.png'),
            _buildDessertItem('Honey pancake', '4', '12', '17', 'images/pancake.png'),
            _buildDessertItem('Milk Ice Cream', '5', '3', '5', 'images/icecream.png')
          ],
        )
    );
  }

  _buildDessertItem(String foodName, String rating, String price, String oldPrice, String imgPath) {
    return Padding(
        padding: const EdgeInsets.all(15.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
                width: 210.0,
                child: Row(children: [
                  Container(
                      height: 75.0,
                      width: 75.0,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(7.0),
                          color: const Color(0xFFFFE9C6)),
                      child: Center(
                          child:
                          Image.asset(imgPath, height: 50.0, width: 50.0))),
                  const SizedBox(width: 20.0),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(foodName,
                          style: GoogleFonts.notoSans(
                              fontSize: 14.0, fontWeight: FontWeight.w400)),
                      Row(
                        children: [
                          Text('Rated ' + rating,
                              style: GoogleFonts.notoSans(
                                  fontSize: 12.0, fontWeight: FontWeight.w400, color: Colors.amber)),
                          const Icon(FontAwesomeIcons.solidStar,
                              color: Colors.amber, size: 12.0),
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          Text(
                            '\$' + price,
                            style: GoogleFonts.lato(
                                fontSize: 16.0,
                                fontWeight: FontWeight.w600,
                                textStyle: const TextStyle(color: Color(0xFFF68D7F))),
                          ),
                          const SizedBox(width: 3.0),
                          Text(
                            '\$' + oldPrice,
                            style: GoogleFonts.lato(
                                fontSize: 12.0,
                                decoration: TextDecoration.lineThrough,
                                fontWeight: FontWeight.w600,
                                textStyle: TextStyle(
                                    color: Colors.grey.withOpacity(0.4))),
                          )
                        ],
                      )
                    ],
                  )
                ])),
            FloatingActionButton(
              heroTag: foodName,
              mini: true,
              onPressed: () {},
              child: const Center(
                  child: Icon(Icons.add, color: Colors.white)
              ),
              backgroundColor: const Color(0xFFFE7D6A),
            )
          ],
        )
    );
  }
}

class DrinksTab extends StatefulWidget {
  const DrinksTab({Key? key}) : super(key: key);

  @override
  _DrinksTabState createState() => _DrinksTabState();
}
class _DrinksTabState extends State<DrinksTab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
          children: <Widget>[
            _buildDrinkItem('Soft drink', '5', '7', '11', 'images/soda.png'),
            _buildDrinkItem('Tropical drink', '5', '10', '15', 'images/drink.png'),
            _buildDrinkItem('Coffee', '4', '4', '6', 'images/coffee.png')
          ],
        )
    );
  }

  _buildDrinkItem(String foodName, String rating, String price, String oldPrice, String imgPath) {
    return Padding(
        padding: const EdgeInsets.all(15.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
                width: 210.0,
                child: Row(children: [
                  Container(
                      height: 75.0,
                      width: 75.0,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(7.0),
                          color: const Color(0xFFC2E3FE)),
                      child: Center(
                          child:
                          Image.asset(imgPath, height: 50.0, width: 50.0))),
                  const SizedBox(width: 20.0),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(foodName,
                          style: GoogleFonts.notoSans(
                              fontSize: 14.0, fontWeight: FontWeight.w400)),
                      Row(
                        children: [
                          Text('Rated ' + rating,
                              style: GoogleFonts.notoSans(
                                  fontSize: 12.0, fontWeight: FontWeight.w400, color: Colors.amber)),
                          const Icon(FontAwesomeIcons.solidStar,
                              color: Colors.amber, size: 12.0),
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          Text(
                            '\$' + price,
                            style: GoogleFonts.lato(
                                fontSize: 16.0,
                                fontWeight: FontWeight.w600,
                                textStyle: const TextStyle(color: Color(0xFFF68D7F))),
                          ),
                          const SizedBox(width: 3.0),
                          Text(
                            '\$' + oldPrice,
                            style: GoogleFonts.lato(
                                fontSize: 12.0,
                                decoration: TextDecoration.lineThrough,
                                fontWeight: FontWeight.w600,
                                textStyle: TextStyle(
                                    color: Colors.grey.withOpacity(0.4))),
                          )
                        ],
                      )
                    ],
                  )
                ])),
            FloatingActionButton(
              heroTag: foodName,
              mini: true,
              onPressed: () {},
              child: const Center(
                  child: Icon(Icons.add, color: Colors.white)
              ),
              backgroundColor: const Color(0xFFFE7D6A),
            )
          ],
        )
    );
  }
}

class SandwichesTab extends StatefulWidget {
  const SandwichesTab({Key? key}) : super(key: key);

  @override
  _SandwichesTabState createState() => _SandwichesTabState();
}
class _SandwichesTabState extends State<SandwichesTab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
          children: <Widget>[
            _buildSandwichItem('Taco sandwich', '4', '11', '13', 'images/taco.png'),
            _buildSandwichItem('Burrito sandwich', '4', '11', '13', 'images/burrito.png'),
            _buildSandwichItem('Tamale sandwich', '3', '10', '12', 'images/tamale.png'),
            _buildSandwichItem('Eggs sandwich', '5', '9', '11', 'images/sandwich.png')
          ],
        )
    );
  }

  _buildSandwichItem(String foodName, String rating, String price, String oldPrice, String imgPath) {
    return Padding(
        padding: const EdgeInsets.all(15.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
                width: 210.0,
                child: Row(children: [
                  Container(
                      height: 75.0,
                      width: 75.0,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(7.0),
                          color: const Color(0xFFD7FADA)),
                      child: Center(
                          child:
                          Image.asset(imgPath, height: 50.0, width: 50.0))),
                  const SizedBox(width: 20.0),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(foodName,
                          style: GoogleFonts.notoSans(
                              fontSize: 14.0, fontWeight: FontWeight.w400)),
                      Row(
                        children: [
                          Text('Rated ' + rating,
                              style: GoogleFonts.notoSans(
                                  fontSize: 12.0, fontWeight: FontWeight.w400, color: Colors.amber)),
                          const Icon(FontAwesomeIcons.solidStar,
                              color: Colors.amber, size: 12.0),
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          Text(
                            '\$' + price,
                            style: GoogleFonts.lato(
                                fontSize: 16.0,
                                fontWeight: FontWeight.w600,
                                textStyle: const TextStyle(color: Color(0xFFF68D7F))),
                          ),
                          const SizedBox(width: 3.0),
                          Text(
                            '\$' + oldPrice,
                            style: GoogleFonts.lato(
                                fontSize: 12.0,
                                decoration: TextDecoration.lineThrough,
                                fontWeight: FontWeight.w600,
                                textStyle: TextStyle(
                                    color: Colors.grey.withOpacity(0.4))),
                          )
                        ],
                      )
                    ],
                  )
                ])),
            FloatingActionButton(
              heroTag: foodName,
              mini: true,
              onPressed: () {},
              child: const Center(
                  child: Icon(Icons.add, color: Colors.white)
              ),
              backgroundColor: const Color(0xFFFE7D6A),
            )
          ],
        )
    );
  }
}
