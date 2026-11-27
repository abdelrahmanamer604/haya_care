import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:haya_care/core/theme/app_colors.dart';
import 'package:haya_care/core/utils/extensions.dart';
import 'package:haya_care/features/patient/doctors/data/models/chat_message_model.dart';

class DoctorChatVitalCard extends StatelessWidget {
  final ChatMessageModel message;

  const DoctorChatVitalCard({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    final colors = context.appColors;
    final textTheme = context.textTheme;

    return Align(
      alignment: AlignmentDirectional.centerEnd,
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 12.h),
        decoration: BoxDecoration(
          color: colors.cardBackground,
          borderRadius: BorderRadius.circular(18.r),
          border: Border.all(color: colors.borderColor),
          boxShadow: const [
            BoxShadow(
              color: AppColors.shadowColor,
              blurRadius: 10,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              width: 44.r,
              height: 44.r,
              decoration: BoxDecoration(
                color: colors.orangeSurface,
                borderRadius: BorderRadius.circular(13.r),
              ),
              alignment: Alignment.center,
              child: Icon(
                Icons.monitor_heart_outlined,
                color: AppColors.orangeBadge,
                size: 22.sp,
              ),
            ),
            SizedBox(width: 12.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    message.vitalTitle ?? '',
                    style: textTheme.labelSmall?.copyWith(
                      fontSize: 11.sp,
                      color: colors.secondaryText,
                    ),
                  ),
                  SizedBox(height: 2.h),
                  Text(
                    message.vitalValue ?? '',
                    style: textTheme.titleMedium?.copyWith(
                      fontSize: 15.sp,
                      fontWeight: FontWeight.bold,
                      color: colors.brandNavy,
                    ),
                  ),
                  SizedBox(height: 2.h),
                  Text(
                    message.time,
                    style: textTheme.labelSmall?.copyWith(
                      fontSize: 10.5.sp,
                      color: colors.secondaryText,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(width: 8.w),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 8.h),
              decoration: BoxDecoration(
                color: colors.orangeSurface,
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: 6.r,
                    height: 6.r,
                    decoration: const BoxDecoration(
                      color: AppColors.orangeBadge,
                      shape: BoxShape.circle,
                    ),
                  ),
                  SizedBox(height: 3.h),
                  Text(
                    message.vitalStatus ?? '',
                    style: textTheme.labelSmall?.copyWith(
                      fontSize: 11.sp,
                      fontWeight: FontWeight.bold,
                      color: AppColors.orangeBadge,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
