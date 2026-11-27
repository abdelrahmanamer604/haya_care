import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:haya_care/core/theme/app_colors.dart';
import 'package:haya_care/core/utils/extensions.dart';

class ProfileMenuItemData {
  final IconData icon;
  final String title;
  final String subtitle;
  final VoidCallback onTap;

  const ProfileMenuItemData({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.onTap,
  });
}

class ProfileMenuCard extends StatelessWidget {
  final List<ProfileMenuItemData> items;

  const ProfileMenuCard({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    final colors = context.appColors;
    final textTheme = context.textTheme;

    return Container(
      decoration: BoxDecoration(
        color: colors.cardBackground,
        borderRadius: BorderRadius.circular(20.r),
        boxShadow: const [
          BoxShadow(
            color: AppColors.shadowColor,
            blurRadius: 12,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        children: List.generate(items.length, (index) {
          final item = items[index];
          return Column(
            children: [
              InkWell(
                onTap: () {
                  HapticFeedback.selectionClick();
                  item.onTap();
                },
                borderRadius: BorderRadius.vertical(
                  top: index == 0 ? Radius.circular(20.r) : Radius.zero,
                  bottom: index == items.length - 1
                      ? Radius.circular(20.r)
                      : Radius.zero,
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 16.w,
                    vertical: 13.h,
                  ),
                  child: Row(
                    children: [
                      Icon(
                        item.icon,
                        color: AppColors.orangeBadge,
                        size: 21.sp,
                      ),
                      SizedBox(width: 14.w),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              item.title,
                              style: textTheme.labelMedium?.copyWith(
                                fontSize: 13.5.sp,
                                fontWeight: FontWeight.bold,
                                color: colors.brandNavy,
                              ),
                            ),
                            SizedBox(height: 2.h),
                            Text(
                              item.subtitle,
                              style: textTheme.labelSmall?.copyWith(
                                fontSize: 11.sp,
                                color: colors.secondaryText,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Icon(
                        context.forwardChevron,
                        color: colors.brandNavy,
                        size: 20.sp,
                      ),
                    ],
                  ),
                ),
              ),
              if (index < items.length - 1)
                Divider(
                  height: 1,
                  indent: 16.w,
                  endIndent: 16.w,
                  color: colors.borderColor.withValues(alpha: 0.5),
                ),
            ],
          );
        }),
      ),
    );
  }
}
