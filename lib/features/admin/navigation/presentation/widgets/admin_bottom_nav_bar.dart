import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:haya_care/core/theme/app_colors.dart';
import 'package:haya_care/core/utils/extensions.dart';
import 'package:haya_care/l10n/app_localizations.dart';

class AdminBottomNavBar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;

  const AdminBottomNavBar({
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
      (label: s.adminDashboardNav, icon: Icons.analytics_outlined),
      (label: s.adminUsersNav, icon: Icons.manage_accounts_outlined),
      (label: s.adminApprovalsNav, icon: Icons.verified_user_outlined),
      (label: s.adminSettingsNav, icon: Icons.settings_outlined),
    ];

    return Container(
      height: 72.h,
      decoration: BoxDecoration(
        color: Theme.of(context).cardTheme.color,
        boxShadow: const [
          BoxShadow(
            color: AppColors.shadowColor,
            blurRadius: 10,
            offset: Offset(0, -3),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: List.generate(items.length, (index) {
          final item = items[index];
          final isSelected = index == currentIndex;

          return GestureDetector(
            onTap: () => onTap(index),
            behavior: HitTestBehavior.opaque,
            child: SizedBox(
              width: 76.w,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 44.w,
                    height: 28.h,
                    decoration: BoxDecoration(
                      color: isSelected
                          ? colors.greenSurface
                          : AppColors.transparent,
                      borderRadius: BorderRadius.circular(14.r),
                    ),
                    alignment: Alignment.center,
                    child: Icon(
                      item.icon,
                      size: 20.sp,
                      color: isSelected
                          ? AppColors.successGreen
                          : colors.secondaryText,
                    ),
                  ),
                  SizedBox(height: 3.h),
                  Text(
                    item.label,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: textTheme.labelSmall?.copyWith(
                      fontSize: 10.sp,
                      fontWeight:
                          isSelected ? FontWeight.bold : FontWeight.normal,
                      color: isSelected
                          ? AppColors.successGreen
                          : colors.secondaryText,
                    ),
                  ),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}
