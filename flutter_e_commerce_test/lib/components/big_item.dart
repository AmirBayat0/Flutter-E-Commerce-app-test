import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

class BigItemSection extends StatelessWidget {
  const BigItemSection({
    Key? key,
    required this.itemList,
  }) : super(key: key);

  final List itemList;

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    var size = MediaQuery.of(context).size;

    return Container(
      margin: const EdgeInsets.only(top: 10),
      width: size.width,
      height: size.height / 4.8,
      child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          itemCount: itemList.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (ctx, index) {
            return FadeInRight(
              delay: Duration(milliseconds: index * 200),
              child: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.all(6),
                    width: size.width / 2.8,
                    height: size.height / 6,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        image: DecorationImage(
                            image: AssetImage(itemList[index].img),
                            fit: BoxFit.cover)),
                  ),
                  SizedBox(
                    width: size.width / 3,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          itemList[index].title,
                          style: textTheme.headline5,
                        ),
                        Text(
                          "\$${itemList[index].price}",
                          style: textTheme.headline6,
                        )
                      ],
                    ),
                  )
                ],
              ),
            );
          }),
    );
  }
}
