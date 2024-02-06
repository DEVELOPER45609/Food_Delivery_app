import 'dart:async';
import 'package:flutter/material.dart';
import 'package:dot_navigation_bar/dot_navigation_bar.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:favorite_button/favorite_button.dart';

import 'package:food_delivery_app/settings.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with TickerProviderStateMixin {
  int currentIndex = 0;
  late PageController _pageController;
  late ScrollController _scrollController;
  var _selectedTab = _SelectedTab.home;
  String searchValue = '';
  final List<String> suggestions = [];

  Future<List<String>> fetchSuggestions(String searchValue) async {
    await Future.delayed(const Duration(milliseconds: 750));
    return suggestions.where((element) {
      return element.toLowerCase().contains(searchValue.toLowerCase());
    }).toList();
  }

  List foods = [
    "Italian Cusine",
    "American Cusine",
    "Desi Cusine",
    "Chinese Cusine",
    "Middle-East Cusine"
  ];
  var imageList = [
    "assets/banner1.jpg",
    "assets/banner2.jpg",
    "assets/banner3.jpg"
  ];
  List Categories = [
    "Pizza",
    "Taco",
    "Zinger Burger",
    "Ham Burger",
    "Club Sandwich",
  ];
  List Time = ["15mins", "20mins", "25mins", "30mins", "35mins"];
  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    _scrollController = ScrollController();
    _startAutoScroll();
  }

  int _currentIndex = 0;

  void _startAutoScroll() {
    Timer.periodic(Duration(seconds: 3), (timer) {
      if (_currentIndex < imageList.length - 1) {
        _currentIndex++;
      } else {
        _currentIndex = 0;
      }
      _scrollController.animateTo(
        _currentIndex * (MediaQuery.of(context).size.width + 10),
        duration: Duration(seconds: 1),
        curve: Curves.easeInOut,
      );
    });
  }

  void _handleIndexChanged(int i) {
    setState(() {
      _selectedTab = _SelectedTab.values[i];
    });
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 240, 237, 237),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.account_circle_rounded,
            size: 50,
            color: Color.fromARGB(255, 94, 95, 95),
          ),
        ),
        elevation: 0,
        title: Center(
          child: Text(
            "Home",
            style: TextStyle(
              color: Colors.black,
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        backgroundColor: Color.fromARGB(255, 240, 237, 237),
        actions: [
          IconButton(
            icon: Icon(
              Icons.notifications_outlined,
              color: Colors.orange,
            ),
            onPressed: () {},
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              color: Color.fromARGB(255, 237, 238, 240),
              margin: EdgeInsets.only(right: 10, left: 10, top: 10),
              child: TextField(
                style: TextStyle(color: Color.fromARGB(255, 97, 97, 97)),
                textAlign: TextAlign.start,
                cursorColor: Colors.black,
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(25),
                  ),
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(25),
                  ),
                  hintText: "Search",
                  prefixIcon: InkWell(
                    highlightColor: const Color.fromARGB(255, 56, 53, 53),
                    onTap: () {},
                    child: Icon(
                      Icons.search_sharp,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              height: screenSize.height * 0.25,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                controller: _scrollController,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    for (int i = 0; i < imageList.length; i++)
                      Container(
                        margin: EdgeInsets.only(
                            right: i == imageList.length - 1 ? 0 : 10),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image.asset(
                            imageList[i],
                            width: screenSize.width,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Text(
                    "Categories",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(children: [
                for (int index = 0; index < Categories.length; index++)
                  InkWell(
                    onTap: () {},
                    child: Container(
                      width: screenSize.width * 0.3,
                      height: screenSize.height * 0.23,
                      margin: EdgeInsets.only(
                          left: 5, top: 20, bottom: 15, right: 5),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5),
                        boxShadow: [
                          BoxShadow(
                            color: Color.fromARGB(255, 143, 142, 142),
                            blurRadius: 3,
                            spreadRadius: 2,
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          Image.asset(
                            'assets/${Categories[index]}.jpg',
                            height: screenSize.height / 8,
                            width: screenSize.width / 3,
                            fit: BoxFit.cover,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 15),
                                child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        Categories[index],
                                        style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                          color:
                                              Color.fromARGB(255, 73, 71, 67),
                                        ),
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            Time[index],
                                            style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold,
                                              color: Color.fromARGB(
                                                  255, 73, 71, 67),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 10, top: 0),
                                            child: Icon(
                                              Icons.access_time,
                                              color: Colors.red,
                                            ),
                                          ),
                                        ],
                                      )
                                    ]),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
              ]),
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Text(
                    "Our Speciality",
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            SingleChildScrollView(
              child: Column(
                children: [
                  for (int index = 0; index < foods.length; index++)
                    InkWell(
                      onTap: () {},
                      child: Container(
                        width: screenSize.width * 0.9,
                        height: screenSize.height * 0.28,
                        margin: EdgeInsets.only(
                            left: 5, top: 5, bottom: 15, right: 5),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black,
                              blurRadius: 5,
                              spreadRadius: 3,
                            ),
                          ],
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            Image.asset(
                              'assets/${foods[index]}.jpg',
                              height: 150,
                              width: screenSize.width / 1,
                              fit: BoxFit.cover,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 11),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        foods[index],
                                        style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color:
                                              Color.fromARGB(255, 73, 71, 67),
                                        ),
                                      ),
                                      RatingBar.builder(
                                        glow: true,
                                        itemSize: 30,
                                        initialRating: 1,
                                        minRating: 1,
                                        direction: Axis.horizontal,
                                        allowHalfRating: true,
                                        itemCount: 5,
                                        itemPadding: EdgeInsets.symmetric(
                                          horizontal: 4.0,
                                        ),
                                        itemBuilder: (context, _) => Icon(
                                          Icons.star,
                                          color: Color.fromARGB(
                                            255,
                                            235,
                                            179,
                                            76,
                                          ),
                                        ),
                                        onRatingUpdate: (rating) {
                                          print(rating);
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(left: 90),
                                  child: FavoriteButton(
                                    iconSize: 30,
                                    isFavorite: false,
                                    valueChanged: (_isFavorite) {
                                      print('Is Favorite : $_isFavorite');
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                ],
              ),
            ),
            SizedBox(
              height: 5,
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 0),
        child: DotNavigationBar(
          backgroundColor: Colors.white,
          currentIndex: _SelectedTab.values.indexOf(_selectedTab),
          onTap: _handleIndexChanged,
          items: [
            DotNavigationBarItem(
              icon: Icon(Icons.explore),
              selectedColor: Colors.purple,
            ),
            DotNavigationBarItem(
              icon: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Settings()),
                  );
                },
                child: Icon(Icons.settings),
              ),
              selectedColor: Colors.orange,
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _pageController.dispose();
    super.dispose();
  }
}

enum _SelectedTab { home, favorite, settings, person, shopping_cart }

void main() {
  runApp(
    MaterialApp(
      home: Home(),
    ),
  );
}
