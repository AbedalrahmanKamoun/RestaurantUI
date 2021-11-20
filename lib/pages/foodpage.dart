import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../drawer/header_drawer.dart';

class BurgerPage extends StatefulWidget {
  final foodImage, foodName, pricePerItem, heroTag;

  BurgerPage({ this.foodImage, this.foodName, this.pricePerItem, this.heroTag });

  @override
  _BurgerPageState createState() => _BurgerPageState();
}

class _BurgerPageState extends State<BurgerPage> {
  var netPrice = 0.0;
  var quantity = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
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
                        )
                        ],
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
        body: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 15.0, top: 15.0),
                child: Text(
                    'SUPER',
                    style: GoogleFonts.notoSans(
                        fontSize: 27.0,
                        fontWeight: FontWeight.w800
                    )
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15.0),
                child: Text(
                    widget.foodName.toString().toUpperCase(),
                    style: GoogleFonts.notoSans(
                        fontSize: 27.0,
                        fontWeight: FontWeight.w800
                    )
                ),
              ),
              const SizedBox(height: 40.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Hero(
                      tag: widget.heroTag,
                      child: Container(
                        height: 200.0,
                        width: 200.0,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(widget.foodImage),
                                fit: BoxFit.cover
                            )
                        ),
                      )
                  ),
                  const SizedBox(width: 15.0),
                  Column(
                    children: [
                      Stack(
                        children: [
                          Container(
                            height: 45.0,
                            width: 40.0,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15.0),
                                boxShadow: [
                                  BoxShadow(
                                      color: const Color(0xFFFE7D6A)
                                          .withOpacity(0.1),
                                      blurRadius: 6.0,
                                      spreadRadius: 6.0,
                                      offset: const Offset(5.0, 11.0)
                                  )
                                ]
                            ),
                          ),
                          Container(
                            height: 50.0,
                            width: 50.0,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15.0),
                                color: Colors.white
                            ),
                            child: const Center(
                              child: Icon(
                                  Icons.favorite_border,
                                  color: Color(0xFFFE7D6A),
                                  size: 25.0
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 35.0),
                      Stack(
                        children: [
                          Container(
                            height: 45.0,
                            width: 40.0,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15.0),
                                boxShadow: [
                                  BoxShadow(
                                      color: const Color(0xFFFE7D6A)
                                          .withOpacity(0.1),
                                      blurRadius: 6.0,
                                      spreadRadius: 6.0,
                                      offset: const Offset(5.0, 11.0)
                                  )
                                ]
                            ),
                          ),
                          Container(
                            height: 50.0,
                            width: 50.0,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15.0),
                                color: Colors.white
                            ),
                            child: const Center(
                              child: Icon(
                                  Icons.restore,
                                  color: Color(0xFFFE7D6A),
                                  size: 25.0
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  )
                ],
              ),
              const SizedBox(height: 10.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 70.0,
                    width: 125.0,
                    color: Colors.white,
                    child: Center(
                      child: Text(
                          '\$' + (int.parse(widget.pricePerItem) * quantity)
                              .toString(),
                          style: GoogleFonts.notoSans(
                              fontSize: 40.0,
                              color: const Color(0xFF5E6166),
                              fontWeight: FontWeight.w500
                          )
                      ),
                    ),
                  ),
                  Container(
                    height: 60.0,
                    width: 225.0,
                    decoration: const BoxDecoration(
                      color: Color(0xFFFE7D6A),
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10.0),
                          bottomLeft: Radius.circular(10.0)
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          height: 40.0,
                          width: 105.0,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              color: Colors.white
                          ),
                          child: Row(
                            children: [
                              IconButton(
                                  onPressed: () {
                                    adjustQuantity('MINUS');
                                  },
                                  icon: const Icon(Icons.remove,
                                      color: Color(0xFFFE7D6A)),
                                  iconSize: 17.0
                              ),
                              Text(
                                quantity.toString(),
                                style: GoogleFonts.notoSans(
                                    fontSize: 14.0,
                                    color: const Color(0xFFFE7D6A),
                                    fontWeight: FontWeight.w400
                                ),
                              ),
                              IconButton(
                                  onPressed: () {
                                    adjustQuantity('PLUS');
                                  },
                                  icon: const Icon(Icons.add,
                                      color: Color(0xFFFE7D6A)),
                                  iconSize: 17.0
                              ),
                            ],
                          ),
                        ),
                        Text(
                          'Add to cart',
                          style: GoogleFonts.notoSans(
                              fontSize: 15.0,
                              color: Colors.white,
                              fontWeight: FontWeight.w400
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
              //Padding(
              //  padding: const EdgeInsets.all(15.0),
              //  child: Text(
              //      'FEATURED',
              //      style: GoogleFonts.notoSans(
              //          fontSize: 16.0,
              //          fontWeight: FontWeight.w700
              //      )
              //  ),
              //),
              //Container(
              //  height: 225.0,
              //  width: MediaQuery
              //      .of(context)
              //      .size
              //      .width,
              //  child: ListView(
              //    scrollDirection: Axis.horizontal,
              //    children: [
              //      _listItem('1'),
              //      _listItem('2'),
              //      _listItem('3')
              //    ],
              //  ),
              //)
            ])
    );
  }

  _listItem(String columnNb) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        children: [
          if(columnNb == '1')
            _columnItem(
                'images/pancake.png', 'Pancake', '9', const Color(0xFFFBD6F5)),
          if(columnNb == '1')
            const SizedBox(height: 15.0),
          if(columnNb == '1')
            _columnItem('images/popcorn.png', 'Sweet popcorn', '7',
                const Color(0xFFFFE3DF)),
          if(columnNb == '2')
            _columnItem(
                'images/taco.png', 'Tacos', '12', const Color(0xFFC2E3FE)),
          if(columnNb == '2')
            const SizedBox(height: 15.0),
          if(columnNb == '2')
            _columnItem('images/sandwich.png', 'Sandwich', '13',
                const Color(0xFFD7FADA)),
          if(columnNb == '3')
            _columnItem('images/donut.png', 'Chocolate donut', '6',
                const Color(0xFFFBD6F5)),
          if(columnNb == '3')
            const SizedBox(height: 15.0),
          if(columnNb == '3')
            _columnItem('images/cheese.png', 'Sweet cheese', '4',
                const Color(0xFFFFE3DF))
        ],
      ),
    );
  }

  _columnItem(String imagePath, String name, String price, Color bgColor) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          width: 210.0,
          child: Row(
            children: [
              Container(
                height: 75.0,
                width: 75.0,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(7.0),
                    color: bgColor
                ),
                child: Center(
                    child: Image.asset(imagePath, height: 50.0, width: 50.0)
                ),
              ),
              const SizedBox(width: 20.0),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: GoogleFonts.notoSans(
                        fontSize: 14.0,
                        fontWeight: FontWeight.w500
                    ),
                  ),
                  Text(
                    '\$' + price,
                    style: GoogleFonts.lato(
                        fontSize: 16.0,
                        fontWeight: FontWeight.w600,
                        textStyle: const TextStyle(color: Color(0xFFF68D7F))
                    ),
                  )
                ],
              )
            ],
          ),
        )
      ],
    );
  }

  adjustQuantity(pressed) {
    switch (pressed) {
      case 'PLUS':
        setState(() {
          quantity += 1;
        });
        return;
      case 'MINUS':
        setState(() {
          quantity -= 1;
        });
        return;
    }
  }
}