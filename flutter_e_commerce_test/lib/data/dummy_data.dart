import 'package:flutter_e_commerce_test/gen/assets.gen.dart';

import '../model/model.dart';

/// Offers List
List<String> offersList = [
  Assets.images.off1.path,
  Assets.images.off2.path,
  Assets.images.off3.path,
  Assets.images.off4.path,
  Assets.images.off5.path,
  Assets.images.off6.path,
  Assets.images.off7.path,
  Assets.images.off8.path,
];

/// Categories List
List<Categories> categoriesList = [
  Categories(title: "Mens", img: Assets.images.mens.path),
  Categories(title: "Womens", img: Assets.images.womens.path),
  Categories(title: "Kids", img: Assets.images.kids.path),
  Categories(title: "Shoes", img: Assets.images.shoes.path),
  Categories(title: "Bags", img: Assets.images.bags.path),
  Categories(title: "Decor-items", img: Assets.images.decore.path),
  Categories(title: "Others", img: Assets.images.other.path),
];

/// Hot Products List
List<Products> hotProductList = [
  Products(title: "Jacket", img: Assets.images.jacjket.path, price: 100),
  Products(title: "Denim Jacket", img: Assets.images.denim.path, price: 90),
  Products(title: "Blazer", img: Assets.images.blazer.path, price: 120),
  Products(title: "T-shirt", img: Assets.images.tShirt.path, price: 70),
  Products(title: "Jacket", img: Assets.images.jacjket.path, price: 100),
  Products(title: "Denim Jacket", img: Assets.images.denim.path, price: 90),
  Products(title: "Blazer", img: Assets.images.blazer.path, price: 120),
  Products(title: "T-shirt", img: Assets.images.tShirt.path, price: 70),
];

/// Feattured List
List<Products> featuredList = [
  Products(title: "Sunglasses", img: Assets.images.glass.path, price: 230),
  Products(title: "Sweater", img: Assets.images.sw.path, price: 67),
  Products(title: "Shirt", img: Assets.images.shirt.path, price: 100),
  Products(title: "Box", img: Assets.images.box.path, price: 105),
  Products(title: "Sunglasses", img: Assets.images.glass.path, price: 230),
  Products(title: "Sweater", img: Assets.images.sw.path, price: 67),
  Products(title: "Shirt", img: Assets.images.shirt.path, price: 100),
  Products(title: "Box", img: Assets.images.box.path, price: 105),
];


/// Best for Customer List
List<Products> bestsForCustomerList = [
  Products(title: "Clock", img: Assets.images.cl.path, price: 25),
  Products(title: "Hat", img: Assets.images.hat.path, price: 55),
  Products(title: "Necklaces", img: Assets.images.necklaces.path, price: 80),
  Products(title: "Sneaker", img: Assets.images.sneakers.path, price: 800),
  Products(title: "Clock", img: Assets.images.cl.path, price: 25),
  Products(title: "Hat", img: Assets.images.hat.path, price: 55),
  Products(title: "Necklaces", img: Assets.images.necklaces.path, price: 80),
  Products(title: "Sneaker", img: Assets.images.sneakers.path, price: 800),
];
