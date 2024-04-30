import 'package:abook/module/screens/onboarding/onboarding.dart';
import 'package:abook/shared/constants/constants.dart';

class OnboardingDataService {
  List<OnboardingDataModel> buildOnboardingData() {
    final List<OnboardingDataModel> _onboardingData = [
      const OnboardingDataModel(
        title: 'Discover',
        description:
            'Dive into a world of captivating stories with AudioAfrica Explorer.',
        illustration: AppIllustrations.bike,
      ),
      const OnboardingDataModel(
        title: 'Customize',
        description: 'Tailor your listening experience.',
        illustration: AppIllustrations.trackDelivery,
      ),
      const OnboardingDataModel(
        title: 'Synce Across Devices',
        description: 'Seamlessly transition between devices.  ',
        illustration: AppIllustrations.orders,
      ),
      const OnboardingDataModel(
        title: 'Swift & easy payment',
        description: 'Swift & easy in-app payment for service.',
        illustration: AppIllustrations.easyPay,
      ),
    ];
    return _onboardingData;
  }
}
