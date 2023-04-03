import 'package:flutter/material.dart';

class FormHeaderWidget extends StatelessWidget {
  const FormHeaderWidget({
    Key? key,
    required this.image,
    required this.title,
    required this.subtitle,
    this.imageHeight = 0.2,
    this.heightBetween,
    this.textAlign,
    this.crossAxisAlignment = CrossAxisAlignment.start,
  }) : super(key: key);

  final String image, title, subtitle;
  final CrossAxisAlignment crossAxisAlignment;
  final TextAlign? textAlign;
  final double? imageHeight;
  final double? heightBetween;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Column(
      crossAxisAlignment: crossAxisAlignment,
      children: [
        Image(
          image: AssetImage(image),
          height: size.height * imageHeight!,
        ),
        SizedBox(height: heightBetween),
        Text(
          title,
          style: Theme.of(context).textTheme.headline5,
        ),
        Text(
          subtitle,
          textAlign: textAlign,
          style: Theme.of(context).textTheme.bodyText1,
        ),
      ],
    );
  }
}
