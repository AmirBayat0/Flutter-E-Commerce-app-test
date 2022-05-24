import 'package:flutter/material.dart';

class BigItemSection extends StatelessWidget {
  const BigItemSection({
    Key? key,
    required this.size,
    required this.textTheme,
    required this.itemlist,
  }) : super(key: key);

  final Size size;
  final TextTheme textTheme;
  final List itemlist;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      width: size.width,
      height: size.height / 4.8,
      child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          itemCount: itemlist.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (ctx, index) {
            return Column(
              children: [
                Container(
                  margin: const EdgeInsets.all(6),
                  width: size.width / 2.8,
                  height: size.height / 6,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      image: DecorationImage(
                          image: AssetImage(itemlist[index].img),
                          fit: BoxFit.cover)),
                ),
                SizedBox(
                  width: size.width / 3,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        itemlist[index].title,
                        style: textTheme.headline5,
                      ),
                      Text(
                        "\$${itemlist[index].price}",
                        style: textTheme.headline6,
                      )
                    ],
                  ),
                )
              ],
            );
          }),
    );
  }
}