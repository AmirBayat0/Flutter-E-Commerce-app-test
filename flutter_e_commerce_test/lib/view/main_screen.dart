import 'dart:async';

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_e_commerce_test/components/big_item.dart';
import 'package:flutter_e_commerce_test/components/middle_text.dart';
import 'package:flutter_e_commerce_test/data/dummy_data.dart';
import 'package:flutter_e_commerce_test/utils/strings.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final PageController _pageController = PageController();
  int _currentIndex = 0;
  @override
  void initState() {
    super.initState();

    /// For Changing Index of Page View Automatically
    Timer.periodic(const Duration(seconds: 5), (Timer timer) {
      if (_currentIndex < offersList.length - 1) {
        _currentIndex++;
        _pageController.animateToPage(
          _currentIndex,
          duration: const Duration(milliseconds: 350),
          curve: Curves.easeIn,
        );
      } else {
        _currentIndex = 0;
      }
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  double iconSize = 25.0;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            children: [
              /// AppBar
              CustomAppBar(
                iconSize: iconSize,
              ),

              /// Body
              Container(
                margin: const EdgeInsets.only(
                  top: 0,
                  right: 10,
                  left: 10,
                  bottom: 0,
                ),
                width: size.width,
                height: size.height / 1.21,
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    children: [
                      /// Offer Section
                      OffersSection(
                        currentIndex: _currentIndex,
                        pageController: _pageController,
                        func: (value) {
                          setState(() {
                            _currentIndex = value;
                          });
                        },
                      ),

                      ///
                      const SizedBox(
                        height: 20,
                      ),

                      /// Middle Text
                      FadeInRight(
                        delay: const Duration(milliseconds: 600),
                        child: const MiddleText(
                          text: MyStrings.categoriesText,
                          delay: 1,
                        ),
                      ),

                      /// Categories Section
                      FadeInRight(
                        delay: const Duration(milliseconds: 700),
                        child: const CategoriesSection(),
                      ),

                      ///
                      const SizedBox(
                        height: 15,
                      ),

                      /// Middle Text
                      FadeInRight(
                        delay: const Duration(milliseconds: 800),
                        child: const MiddleText(
                          text: MyStrings.hotProductText,
                          delay: 2,
                        ),
                      ),

                      /// Big Item Section - ListView
                      FadeInRight(
                        delay: const Duration(milliseconds: 900),
                        child: BigItemSection(
                          itemList: hotProductList,
                        ),
                      ),

                      ///
                      const SizedBox(
                        height: 15,
                      ),

                      /// Middle Text
                      FadeInRight(
                        delay: const Duration(milliseconds: 1100),
                        child: const MiddleText(
                          text: MyStrings.featuredText,
                          delay: 3,
                        ),
                      ),

                      /// Big Item Section - ListView
                      FadeInRight(
                        delay: const Duration(milliseconds: 1200),
                        child: BigItemSection(itemList: featuredList),
                      ),

                      ///
                      const SizedBox(
                        height: 15,
                      ),

                      /// Middle Text
                      FadeInRight(
                        delay: const Duration(milliseconds: 1300),
                        child: const MiddleText(
                          text: MyStrings.bestForCustomerText,
                          delay: 4,
                        ),
                      ),

                      /// Big Item Section - ListView
                      FadeInRight(
                        delay: const Duration(milliseconds: 1400),
                        child: BigItemSection(itemList: bestsForCustomerList),
                      ),

                      ///
                      const SizedBox(
                        height: 25,
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

/// Categories Section
class CategoriesSection extends StatelessWidget {
  const CategoriesSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var textTheme = Theme.of(context).textTheme;
    return Container(
      margin: const EdgeInsets.only(top: 10),
      width: size.width,
      height: size.height / 7,
      child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemCount: categoriesList.length,
          itemBuilder: (ctx, index) {
            return FadeInRight(
              delay: Duration(milliseconds: index * 300),
              child: Column(
                children: [
                  Container(
                      margin: const EdgeInsets.all(6),
                      width: size.width / 4.7,
                      height: size.height / 10,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        image: DecorationImage(
                            image: AssetImage(categoriesList[index].img),
                            fit: BoxFit.cover),
                      )),
                  Text(
                    categoriesList[index].title,
                    style: textTheme.headlineMedium,
                  )
                ],
              ),
            );
          }),
    );
  }
}

/// Offer Section
class OffersSection extends StatelessWidget {
  const OffersSection({
    Key? key,
    required this.currentIndex,
    required this.pageController,
    required this.func,
  }) : super(key: key);

  final int currentIndex;
  final PageController pageController;
  final Function(int) func;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var textTheme = Theme.of(context).textTheme;
    return Column(
      children: [
        FadeInLeft(
          delay: const Duration(milliseconds: 400),
          child: Row(
            children: [
              Text(
                MyStrings.offersText,
                style: textTheme.displayMedium,
              ),
            ],
          ),
        ),
        FadeInUp(
          delay: const Duration(milliseconds: 500),
          child: Container(
            margin: const EdgeInsets.only(top: 10),
            width: size.width,
            height: size.height / 4.5,
            child: PageView.builder(
                onPageChanged: func,
                controller: pageController,
                physics: const BouncingScrollPhysics(),
                itemCount: offersList.length,
                itemBuilder: (ctx, index) {
                  return Container(
                    margin: const EdgeInsets.only(top: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      image: DecorationImage(
                          image: AssetImage(offersList[index]),
                          fit: BoxFit.cover),
                    ),
                  );
                }),
          ),
        ),
      ],
    );
  }
}

/// AppBar
class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    Key? key,
    required this.iconSize,
  }) : super(key: key);

  final double iconSize;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var textTheme = Theme.of(context).textTheme;
    return SizedBox(
        width: size.width,
        height: size.height / 5.7,
        child: Stack(
          children: [
            FadeInDown(
              delay: const Duration(milliseconds: 100),
              child: Container(
                width: size.width,
                height: size.height / 7,
                decoration: const BoxDecoration(
                  color: Colors.deepPurpleAccent,
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(40),
                    bottomLeft: Radius.circular(40),
                  ),
                ),
              ),
            ),
            Positioned(
              top: 35,
              left: 0,
              right: 0,
              child: FadeInRight(
                delay: const Duration(milliseconds: 100),
                child: SizedBox(
                  height: size.height / 15,
                  child: Row(
                    children: [
                      IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.menu,
                            size: iconSize,
                            color: Colors.white,
                          )),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        "Home",
                        style: textTheme.displayLarge,
                      ),
                      Expanded(child: Container()),
                      IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.favorite,
                            size: iconSize,
                            color: Colors.white,
                          )),
                      IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.shopping_cart,
                            size: iconSize,
                            color: Colors.white,
                          )),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 8,
              left: 20,
              right: 20,
              child: FadeInUp(
                delay: const Duration(milliseconds: 300),
                child: Material(
                  shadowColor: Colors.black,
                  elevation: 3,
                  borderRadius: BorderRadius.circular(15),
                  child: TextField(
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      contentPadding: const EdgeInsets.all(10),
                      suffixIcon: const Icon(
                        Icons.search,
                        color: Color.fromARGB(255, 146, 146, 146),
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide.none),
                      hintText: "Search here",
                      hintStyle: const TextStyle(
                          fontSize: 14,
                          color: Color.fromARGB(255, 131, 131, 131)),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}
