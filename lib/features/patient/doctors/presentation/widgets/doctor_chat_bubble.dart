import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:haya_care/core/theme/app_colors.dart';
import 'package:haya_care/core/utils/extensions.dart';
import 'package:haya_care/features/patient/doctors/data/models/chat_message_model.dart';

class DoctorChatBubble extends StatelessWidget {
  final ChatMessageModel message;

  const DoctorChatBubble({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    final colors = context.appColors;
    final textTheme = context.textTheme;
    final isPatient = message.isFromPatient;

    return Align(
      alignment: isPatient
          ? AlignmentDirectional.centerEnd
          : AlignmentDirectional.centerStart,
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: 265.w),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
          decoration: BoxDecoration(
            color: isPatient
                ? AppColors.splashBackground
                : colors.cardBackground,
            borderRadius: BorderRadiusDirectional.only(
              topStart: Radius.circular(18.r),
              topEnd: Radius.circular(18.r),
              bottomStart: Radius.circular(isPatient ? 18.r : 4.r),
              bottomEnd: Radius.circular(isPatient ? 4.r : 18.r),
            ),
            boxShadow: const [
              BoxShadow(
                color: AppColors.shadowColor,
                blurRadius: 10,
                offset: Offset(0, 2),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                message.text,
                style: textTheme.bodyMedium?.copyWith(
                  fontSize: 13.5.sp,
                  height: 1.45,
                  color: isPatient ? AppColors.white : colors.primaryText,
                ),
              ),
              SizedBox(height: 6.h),
              Text(
                message.time,
                style: textTheme.labelSmall?.copyWith(
                  fontSize: 10.5.sp,
                  color: isPatient
                      ? AppColors.splashSubtitleText
                      : colors.secondaryText,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
