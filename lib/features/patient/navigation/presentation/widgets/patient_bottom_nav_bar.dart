import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:haya_care/core/theme/app_colors.dart';
import 'package:haya_care/core/utils/extensions.dart';
import 'package:haya_care/l10n/app_localizations.dart';

class PatientBottomNavBar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;

  const PatientBottomNavBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final s = S.of(context)!;
    final textTheme = context.textTheme;
    final colors = context.appColors;

    final items = [
      (label: s.homeNav, icon: Icons.home_outlined, activeIcon: Icons.home_rounded),
      (label: s.vitalsNav, icon: Icons.bar_chart_rounded, activeIcon: Icons.bar_chart_rounded),
      (label: s.medicationsNav, icon: Icons.medication_outlined, activeIcon: Icons.medication_rounded),
      (label: s.doctorNav, icon: Icons.medical_information_outlined, activeIcon: Icons.medical_information_rounded),
      (label: s.profileNav, icon: Icons.person_outline_rounded, activeIcon: Icons.person_rounded),
    ];

    return SafeArea(
      top: false,
      child: Padding(
        padding: EdgeInsets.fromLTRB(16.w, 0, 16.w, 10.h),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(28.r),
            boxShadow: [
              BoxShadow(
                color: colors.navBarShadow,
                blurRadius: 24,
                offset: const Offset(0, 8),
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(28.r),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 18, sigmaY: 18),
              child: Container(
                height: 68.h.clamp(62.0, 74.0),
                padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 6),
                decoration: BoxDecoration(
                  color: colors.navBarGlassBg,
                  borderRadius: BorderRadius.circular(28.r),
                  border: Border.all(
                    color: colors.navBarGlassBorder,
                    width: 1.2,
                  ),
                ),
                child: Row(
                  children: List.generate(items.length, (index) {
                    final item = items[index];
                    final isSelected = index == currentIndex;

                    return Expanded(
                      child: GestureDetector(
                        onTap: () {
                          if (!isSelected) {
                            HapticFeedback.selectionClick();
                            onTap(index);
                          }
                        },
                        behavior: HitTestBehavior.opaque,
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 280),
                          curve: Curves.easeOutCubic,
                          padding: EdgeInsets.symmetric(vertical: 4.h),
                          decoration: BoxDecoration(
                            color: isSelected
                                ? colors.orangeSurface
                                : AppColors.transparent,
                            borderRadius: BorderRadius.circular(20.r),
                          ),
                          child: AnimatedScale(
                            scale: isSelected ? 1.03 : 0.97,
                            duration: const Duration(milliseconds: 220),
                            curve: Curves.easeOutBack,
                            child: FittedBox(
                              fit: BoxFit.scaleDown,
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    isSelected ? item.activeIcon : item.icon,
                                    size: 21.sp,
                                    color: isSelected
                                        ? AppColors.orangeBadge
                                        : colors.secondaryText,
                                  ),
                                  if (isSelected) ...[
                                    const SizedBox(height: 2),
                                    Text(
                                      item.label,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: textTheme.labelSmall?.copyWith(
                                        fontSize: 10.sp,
                                        fontWeight: FontWeight.bold,
                                        color: AppColors.orangeBadge,
                                      ),
                                    ),
                                  ],
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  }),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
