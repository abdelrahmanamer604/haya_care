import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:haya_care/core/constants/app_assets.dart';
import 'package:haya_care/core/routing/routes.dart';
import 'package:haya_care/core/theme/app_colors.dart';
import 'package:haya_care/core/utils/extensions.dart';
import 'package:haya_care/features/auth/presentation/widgets/auth_background_bubbles.dart';
import 'package:haya_care/features/onboarding/presentation/widgets/onboarding_button.dart';
import 'package:haya_care/features/onboarding/presentation/widgets/onboarding_controls.dart';
import 'package:haya_care/features/onboarding/presentation/widgets/onboarding_header.dart';
import 'package:haya_care/features/onboarding/presentation/widgets/onboarding_page_item.dart';
import 'package:haya_care/l10n/app_localizations.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _navigateToLogin() =>
      Navigator.of(context).pushReplacementNamed(Routes.login);

  void _handleNext() {
    if (_currentPage == 3) {
      _navigateToLogin();
    } else {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final s = S.of(context)!;
    final pages = [
      (s.onboardingTitle1, s.onboardingSubtitle1, AppAssets.onboarding1,
          const OnboardingControls()),
      (s.onboardingTitle2, s.onboardingSubtitle2, AppAssets.onboarding2, null),
      (s.onboardingTitle3, s.onboardingSubtitle3, AppAssets.onboarding3, null),
      (s.onboardingTitle4, s.onboardingSubtitle4, AppAssets.onboarding4, null),
    ];
    final isLandscape =
        MediaQuery.orientationOf(context) == Orientation.landscape;

    final pageView = PageView.builder(
      controller: _pageController,
      itemCount: pages.length,
      onPageChanged: (index) => setState(() => _currentPage = index),
      itemBuilder: (_, i) => OnboardingPageItem(
        title: pages[i].$1,
        subtitle: pages[i].$2,
        imagePath: pages[i].$3,
        extraContent: pages[i].$4,
      ),
    );

    final bottomControls = Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(pages.length, (index) {
            final isActive = index == _currentPage;
            return AnimatedContainer(
              duration: const Duration(milliseconds: 250),
              margin: EdgeInsets.symmetric(horizontal: 3.w),
              width: isActive ? 22.w : 6.w,
              height: 5.h,
              decoration: BoxDecoration(
                color: isActive
                    ? AppColors.orangeBadge
                    : context.appColors.borderColor,
                borderRadius: BorderRadius.circular(4.r),
              ),
            );
          }),
        ),
        SizedBox(height: 14.h),
        OnboardingButton(
          isLastPage: _currentPage == pages.length - 1,
          onPressed: _handleNext,
        ),
        SizedBox(height: 16.h),
      ],
    );

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: AuthBackgroundBubbles(
        child: SafeArea(
          child: isLandscape
              ? SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    children: [
                      OnboardingHeader(
                          showSkip: _currentPage < 3, onSkip: _navigateToLogin),
                      SizedBox(height: 270, child: pageView),
                      SizedBox(height: 12.h),
                      bottomControls,
                    ],
                  ),
                )
              : Column(
                  children: [
                    OnboardingHeader(
                        showSkip: _currentPage < 3, onSkip: _navigateToLogin),
                    Expanded(child: pageView),
                    bottomControls,
                  ],
                ),
        ),
      ),
    );
  }
}
