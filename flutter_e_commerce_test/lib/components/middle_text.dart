import 'package:flutter/material.dart';
import 'package:flutter_e_commerce_test/utils/strings.dart';

class MiddleText extends StatelessWidget {
  const MiddleText({Key? key, required this.text, required this.delay})
      : super(key: key);

  final String text;
  final double delay;

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              text,
              style: textTheme.displayMedium,
            ),
            Expanded(child: Container()),
            Row(
              children: [
                Text(
                  MyStrings.viewAllText,
                  style: textTheme.displaySmall,
                ),
                const SizedBox(
                  width: 5,
                ),
                const Icon(
                  Icons.arrow_forward_ios_outlined,
                  color: Colors.grey,
                  size: 15,
                ),
              ],
            )
          ],
        ),
      ],
    );
  }
}
