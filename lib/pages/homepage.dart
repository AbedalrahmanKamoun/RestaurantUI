import 'package:emoji_ui/pages/foodpage.dart';
import 'package:flutter/material.dart';
import 'package:emoji_ui/foodtabs.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 4, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 15.0, top: 10.0),
              child: Text(
                'SEARCH FOR RECIPES',
                style: GoogleFonts.notoSans(
                    fontSize: 27.0,
                    fontWeight: FontWeight.w800
                )
              ),
            ),
            const SizedBox(height: 15.0),
            Padding(
              padding: const EdgeInsets.only(left: 15.0, right: 15.0),
              child: Container(
                padding: const EdgeInsets.only(left: 5.0),
                decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(10.0)
                ),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Search',
                    hintStyle: GoogleFonts.notoSans(
                        fontSize: 14.0
                    ),
                    border: InputBorder.none,
                    fillColor: Colors.grey.withOpacity(0.5),
                    prefixIcon: const Icon(Icons.search, color: Colors.grey)
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20.0),
            Padding(
              padding: const EdgeInsets.only(left: 15.0),
              child: Text(
                'Recommended',
                style: GoogleFonts.notoSans(
                  fontSize: 18.0,
                  fontWeight: FontWeight.w500
                ),
              ),
            ),
            const SizedBox(height: 15.0),
            SizedBox(
              height: 200.0,
              child:
              ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  _listItem('Chicken Burger', 'images/burger.png', '13', const Color(0xFFFFE9C6), const Color(0xFFDA9551)),
                  _listItem('Meat & Bones', 'images/meat.png', '21', const Color(0xFFC2E3FE) ,const Color(0xFF6A8CAA)),
                  _listItem('Cheese Pizza', 'images/pizza.png', '16', const Color(0xFFD7FADA), const Color(0xFF56CC7E)),
                  const Padding(padding: EdgeInsets.only(right: 15.0))
                ],
              ),
            ),
            const SizedBox(height: 10.0),
            Padding(
                padding: const EdgeInsets.only(left: 15.0),
                child: TabBar(
                  controller: tabController,
                  isScrollable: true,
                  indicatorColor: Colors.transparent,
                  labelColor: Colors.black,
                  unselectedLabelColor: Colors.grey.withOpacity(0.5),
                  labelStyle: GoogleFonts.notoSans(
                      fontSize: 16.0,
                      fontWeight: FontWeight.w700
                  ),
                  unselectedLabelStyle: GoogleFonts.notoSans(
                      fontSize: 12.0,
                      fontWeight: FontWeight.w500
                  ),
                  tabs: const [
                    Tab(child: Text('SIDE MEALS')),
                    Tab(child: Text('DESSERTS')),
                    Tab(child: Text('DRINKS')),
                    Tab(child: Text('SANDWICHES'))
                  ],
                )
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height - 450.0,
              child: TabBarView(
                controller: tabController,
                children: const [
                  SideMealTab(),
                  DessertTab(),
                  DrinksTab(),
                  SandwichesTab(),
                ],
              ),
            ),
          ],
        )
    );
  }

  _listItem(String name, String imagePath, String price, Color bgColor, Color textColor) {
    return Padding(
      padding: const EdgeInsets.only(left: 15.0),
      child: InkWell(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => BurgerPage(
                  heroTag: name,
                  foodName: name,
                  pricePerItem: price,
                  foodImage: imagePath)
          ));
        },
        child: Container(
          height: 175.0,
          width: 150.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.0),
            color: bgColor
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Hero(
                tag: name,
                child: Container(
                  height: 75.0,
                  width: 75.0,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle
                  ),
                  child: Center(
                    child: Image.asset(imagePath, height: 50.0, width: 50.0)
                  ),
                ),
              ),
              const SizedBox(height: 25.0),
              Text(
                name,
                style: GoogleFonts.notoSans(
                  fontSize: 17.0,
                  color: textColor
                ),
              ),
              Text(
                "\$" + price,
                style: GoogleFonts.notoSans(
                    fontSize: 17.0,
                    color: textColor
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
