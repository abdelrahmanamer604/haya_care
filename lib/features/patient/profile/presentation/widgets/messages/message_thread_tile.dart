import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:haya_care/core/theme/app_colors.dart';
import 'package:haya_care/core/utils/extensions.dart';

class MessageThreadTile extends StatelessWidget {
  final String name;
  final String lastMessage;
  final String time;
  final int unreadCount;
  final String? imagePath;
  final String initials;
  final VoidCallback onTap;

  const MessageThreadTile({
    super.key,
    required this.name,
    required this.lastMessage,
    required this.time,
    required this.unreadCount,
    required this.initials,
    required this.onTap,
    this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.appColors;
    final textTheme = context.textTheme;

    return InkWell(
      onTap: () {
        HapticFeedback.selectionClick();
        onTap();
      },
      borderRadius: BorderRadius.circular(14.r),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 12.h),
        child: Row(
          children: [
            _buildAvatar(context),
            SizedBox(width: 12.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: textTheme.titleSmall?.copyWith(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.bold,
                      color: colors.brandNavy,
                    ),
                  ),
                  SizedBox(height: 3.h),
                  Text(
                    lastMessage,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: textTheme.bodySmall?.copyWith(
                      fontSize: 11.5.sp,
                      color: colors.secondaryText,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(width: 8.w),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  time,
                  style: textTheme.labelSmall?.copyWith(
                    fontSize: 10.5.sp,
                    color: colors.secondaryText,
                  ),
                ),
                if (unreadCount > 0) ...[
                  SizedBox(height: 6.h),
                  Container(
                    width: 20.r,
                    height: 20.r,
                    decoration: const BoxDecoration(
                      color: AppColors.orangeBadge,
                      shape: BoxShape.circle,
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      '$unreadCount',
                      style: textTheme.labelSmall?.copyWith(
                        fontSize: 10.sp,
                        fontWeight: FontWeight.bold,
                        color: AppColors.white,
                      ),
                    ),
                  ),
                ],
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAvatar(BuildContext context) {
    final colors = context.appColors;
    final textTheme = context.textTheme;
    if (imagePath != null) {
      return ClipOval(
        child: Image.asset(
          imagePath!,
          width: 48.r,
          height: 48.r,
          fit: BoxFit.cover,
        ),
      );
    }
    return Container(
      width: 48.r,
      height: 48.r,
      decoration: BoxDecoration(
        color: colors.navySurface,
        borderRadius: BorderRadius.circular(14.r),
      ),
      alignment: Alignment.center,
      child: Text(
        initials,
        style: textTheme.labelMedium?.copyWith(
          fontSize: 14.sp,
          fontWeight: FontWeight.bold,
          color: colors.brandNavy,
        ),
      ),
    );
  }
}
