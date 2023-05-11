import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:renting_car/constants/text_constants.dart';
import 'package:renting_car/screen/home/widgets/brand_list.dart';
import 'package:renting_car/screen/home/widgets/cars_items.dart';
import 'package:renting_car/screen/home/widgets/search_button.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedPageIndex = 0;

  void setSelectedIndex(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFf9ffff),
      body: SafeArea(
        child: Column(
          children: [
            SearchButton(),
            BrandList(),
            Expanded(
              child: Container(
                margin: EdgeInsets.symmetric(vertical: 10, horizontal: 23),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Available cars",
                          style: TextConstants.titleSection,
                        ),
                        IconButton(
                          onPressed: () {
                            print("filter cars");
                          },
                          icon: Icon(Icons.sort),
                        )
                      ],
                    ),
                    Expanded(
                      child: ListView.builder(
                        itemCount: 5,
                        itemBuilder: (context, index) {
                          return CarItem();
                        },
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          canvasColor: Colors.white,
        ),
        child: BottomNavigationBar(
          currentIndex: _selectedPageIndex,
          onTap: (index) {
            setSelectedIndex(index);
          },

          selectedItemColor: Colors.white,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          selectedFontSize: 0,
          unselectedItemColor: Color(0xFF686868),
          items: [
            BottomNavigationBarItem(
              icon: InkWell(
                  onTap: () {
                  },
                  child: Icon(
                    Icons.home,
                  )),
              label: 'Home',
              backgroundColor: Color(0xff3374FF),
            ),
            BottomNavigationBarItem(
              icon: InkWell(
                  onTap: () {

                  },
                  child: Icon(Icons.new_releases_outlined)),
              label: 'Offers',
              backgroundColor: Color(0xff3374FF),
            ),
            BottomNavigationBarItem(
              icon: InkWell(onTap: () {

              },child: Icon(CupertinoIcons.gift)),
              label: 'Rewards',
              backgroundColor: Color(0xff3374FF),
            ),
            BottomNavigationBarItem(
              icon: InkWell(onTap: () {

              },
                  child: Icon(CupertinoIcons.cart_badge_plus)),
              label: 'Cart',
              backgroundColor: Color(0xff3374FF),
            ),
            BottomNavigationBarItem(
              icon: InkWell(onTap: () {

              },child: Icon(CupertinoIcons.person_fill)),
              label: 'Profile',
              backgroundColor: Color(0xff3374FF),
            ),
          ]),
      ),
    );
  }
}