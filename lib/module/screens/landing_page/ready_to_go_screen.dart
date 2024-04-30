import 'package:abook/index.dart';
import 'package:abook/shared/widgets/buttons/bottom_nav.dart';
import 'package:abook/shared/widgets/buttons/primary_button.dart';
import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class ReadyToGoScreen extends StatefulWidget {
  const ReadyToGoScreen({super.key});

  @override
  State<ReadyToGoScreen> createState() => _ReadyToGoScreenState();
}

class _ReadyToGoScreenState extends State<ReadyToGoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AdaptiveTheme.of(context).mode == AdaptiveThemeMode.dark
          ? AppColors.darkbgColor
          : Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 15.0,
            vertical: 15.0,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              si.utilityService
                  .setSvgFromAsset(svg: 'assets/svg/done.svg', height: 30.h),
              const SizedBox(
                height: 24.0,
              ),
              Text(
                'You are ready to go!',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color:
                      AdaptiveTheme.of(context).mode == AdaptiveThemeMode.dark
                          ? Colors.white
                          : AppColors.audioBlack,
                ),
              ),
              const SizedBox(
                height: 15.0,
              ),
              Text(
                'Congratulation, any interesting topics will be shortly in your hands.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color:
                      AdaptiveTheme.of(context).mode == AdaptiveThemeMode.dark
                          ? Colors.white
                          : AppColors.audioBlack,
                ),
              ),
              const SizedBox(
                height: 25.0,
              ),
              PrimaryAudioButton(
                  onTap: () {
                    si.routerService
                        .popReplaceRoute(context, const BottomNav());
                  },
                  text: 'Finish'),
            ],
          ),
        ),
      ),
    );
  }
}
