import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:haya_care/core/theme/app_colors.dart';
import 'package:haya_care/core/utils/extensions.dart';
import 'package:haya_care/features/patient/notifications/data/notifications_demo_data.dart';

class NotificationItemCard extends StatelessWidget {
  final NotificationItemData item;

  const NotificationItemCard({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    final textTheme = context.textTheme;
    final colors = context.appColors;
    final iconColor = item.isOrange ? AppColors.orangeBadge : colors.brandNavy;
    final iconBgColor =
        item.isOrange ? colors.orangeSurface : colors.navySurface;

    return Container(
      padding: EdgeInsets.all(14.r),
      decoration: BoxDecoration(
        color: theme.cardTheme.color,
        borderRadius: BorderRadius.circular(18.r),
        border: item.isUnread
            ? Border.all(
                color: AppColors.orangeBadge.withValues(alpha: 0.35),
                width: 1.2,
              )
            : null,
        boxShadow: const [
          BoxShadow(
            color: AppColors.shadowColor,
            blurRadius: 12,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        item.title,
                        style: textTheme.labelMedium?.copyWith(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    if (item.isUnread) ...[
                      SizedBox(width: 8.w),
                      Container(
                        width: 7.r,
                        height: 7.r,
                        decoration: const BoxDecoration(
                          color: AppColors.orangeBadge,
                          shape: BoxShape.circle,
                        ),
                      ),
                    ],
                  ],
                ),
                SizedBox(height: 3.h),
                Text(
                  item.body,
                  style: textTheme.bodySmall
                      ?.copyWith(fontSize: 12.sp, height: 1.35),
                ),
                SizedBox(height: 6.h),
                Text(
                  item.time,
                  style: textTheme.labelSmall?.copyWith(fontSize: 10.sp),
                ),
              ],
            ),
          ),
          SizedBox(width: 12.w),
          Container(
            width: 44.r,
            height: 44.r,
            decoration: BoxDecoration(
              color: iconBgColor,
              borderRadius: BorderRadius.circular(13.r),
            ),
            alignment: Alignment.center,
            child: Icon(item.icon, color: iconColor, size: 21.sp),
          ),
        ],
      ),
    );
  }
}
