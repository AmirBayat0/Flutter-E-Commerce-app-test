import 'dart:async';

///
import 'package:flutter/material.dart';

///
import '../components/big_item.dart';
import '../utils/strings.dart';
import '../components/middle_text.dart';
import '../data/dummy_data.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  PageController _pageController = PageController();
  int _currentIndex = 0;
  /////////////////////////////////////
  //@CodeWithFlexz on Instagram
  //
  //AmirBayat0 on Github
  //Programming with Flexz on Youtube
  /////////////////////////////////////
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
    var textTheme = Theme.of(context).textTheme;
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              /// AppBar
              CustomAppBar(
                  size: size, iconSize: iconSize, textTheme: textTheme),

              /// Body
              Container(
                margin: const EdgeInsets.only(
                    top: 0, right: 15, left: 15, bottom: 0),
                width: size.width,
                height: size.height / 1.22,
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    children: [
                      /// Offer Section
                      OffersSection(
                        textTheme: textTheme,
                        size: size,
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
                      MiddleText(
                        textTheme: textTheme,
                        text: MyStrings.categoriesText,
                        delay: 1,
                      ),

                      /// Categories Section
                      CategoriesSection(size: size, textTheme: textTheme),

                      ///
                      const SizedBox(
                        height: 15,
                      ),

                      /// Middle Text
                      MiddleText(
                        textTheme: textTheme,
                        text: MyStrings.hotProductText,
                        delay: 2,
                      ),

                      /// Big Item Section - ListView
                      BigItemSection(
                        size: size,
                        textTheme: textTheme,
                        itemlist: hotProductList,
                      ),

                      ///
                      const SizedBox(
                        height: 15,
                      ),

                      /// Middle Text
                      MiddleText(
                        textTheme: textTheme,
                        text: MyStrings.featuredText,
                        delay: 3,
                      ),

                      /// Big Item Section - ListView
                      BigItemSection(
                          size: size,
                          textTheme: textTheme,
                          itemlist: featuredList),

                      ///
                      const SizedBox(
                        height: 15,
                      ),

                      /// Middle Text
                      MiddleText(
                        textTheme: textTheme,
                        text: MyStrings.bestForCustomerdText,
                        delay: 4,
                      ),

                      /// Big Item Section - ListView
                      BigItemSection(
                          size: size,
                          textTheme: textTheme,
                          itemlist: bestsForCustomerList)
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
    required this.size,
    required this.textTheme,
  }) : super(key: key);

  final Size size;
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      width: size.width,
      height: size.height / 7,
      child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemCount: categoriesList.length,
          itemBuilder: (ctx, index) {
            return Column(
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
                  style: textTheme.headline4,
                )
              ],
            );
          }),
    );
  }
}

/// Offer Section
class OffersSection extends StatelessWidget {
  const OffersSection({
    Key? key,
    required this.textTheme,
    required this.size,
    required this.currentIndex,
    required this.pageController,
    required this.func,
  }) : super(key: key);

  final TextTheme textTheme;
  final Size size;
  final int currentIndex;
  final PageController pageController;
  final Function(int) func;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              MyStrings.offersText,
              style: textTheme.headline2,
            ),
          ],
        ),
        Container(
          margin: const EdgeInsets.only(top: 10),
          width: size.width,
          height: size.height / 5,
          child: PageView.builder(
              onPageChanged: func,
              controller: pageController,
              physics: const BouncingScrollPhysics(),
              itemCount: offersList.length,
              itemBuilder: (ctx, index) {
                return Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      image: DecorationImage(
                          image: AssetImage(offersList[index]),
                          fit: BoxFit.cover)),
                );
              }),
        ),
      ],
    );
  }
}

/// AppBar
class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    Key? key,
    required this.size,
    required this.iconSize,
    required this.textTheme,
  }) : super(key: key);

  final Size size;
  final double iconSize;
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: size.width,
        height: size.height / 5.7,
        child: Stack(
          children: [
            Container(
              width: size.width,
              height: size.height / 7,
              decoration: const BoxDecoration(
                  color: Colors.deepPurpleAccent,
                  borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(40),
                      bottomLeft: Radius.circular(40))),
            ),
            Positioned(
              top: 35,
              left: 0,
              right: 0,
              child: SizedBox(
                height: size.height / 16,
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
                      style: textTheme.headline1,
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
            Positioned(
              bottom: 10,
              left: 20,
              right: 20,
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
                          color: Color.fromARGB(255, 131, 131, 131))),
                ),
              ),
            ),
          ],
        ));
  }
}
