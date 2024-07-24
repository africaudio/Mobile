import 'package:abook/index.dart';
import 'package:abook/shared/widgets/buttons/bare_argon.dart';

import 'package:flutter/material.dart';

import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingControls extends StatelessWidget {
  const OnboardingControls(this.pageController,
      {Key? key,
      this.onNext,
      this.onSkip,
      this.onTap,
      required this.currentIndex,
      required this.lastIndex})
      : super(key: key);
  final Function(Function, Function, ButtonState)? onNext;
  final Function(Function, Function, ButtonState)? onSkip;
  final Function(Function, Function, ButtonState)? onTap;

  final int currentIndex;
  final int lastIndex;
  final PageController pageController;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SmoothPageIndicator(
          controller: pageController,
          count: 4,
          axisDirection: Axis.horizontal,
          effect: ExpandingDotsEffect(
            spacing: 8.0,
            radius: 100 * ScreenRatio.widthRatio,
            dotWidth: 10 * ScreenRatio.widthRatio,
            dotHeight: 10 * ScreenRatio.heightRatio,
            paintStyle: PaintingStyle.fill,
            strokeWidth: 1.5,
            dotColor: Color(0xFFE4A5B9),
            activeDotColor: AppColors.primaryPurple,
          ),
        ),
        const SizedBox(height: 56),
        currentIndex != lastIndex
            ? Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SecondaryButton2(
                    context,
                    title: 'Skip',
                    width: 100,
                    onTap: onSkip,
                  ),
                  SecondaryButton(
                    context,
                    title: 'Next',
                    width: 120,
                    color: AppColors.primaryPurple,
                    onTap: onNext,
                  ),
                ],
              )
            : PrimaryButton(title: 'Get Started', onTap: onTap),
      ],
    );
  }
}
