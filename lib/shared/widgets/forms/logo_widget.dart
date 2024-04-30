import 'package:flutter/material.dart';

class LogoWidget extends StatelessWidget {
  const LogoWidget({
    Key? key,
    this.height,
  }) : super(key: key);

  final double? height;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image(
          image: const AssetImage('assets/svg/logo11.png'),
          height: height,
        ),
      ],
    );
  }
}
