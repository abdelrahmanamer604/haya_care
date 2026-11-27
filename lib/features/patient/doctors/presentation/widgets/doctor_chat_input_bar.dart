import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:haya_care/core/theme/app_colors.dart';
import 'package:haya_care/core/utils/extensions.dart';
import 'package:haya_care/core/widgets/app_text_field.dart';
import 'package:haya_care/core/widgets/tap_scale_widget.dart';
import 'package:haya_care/l10n/app_localizations.dart';

class DoctorChatInputBar extends StatelessWidget {
  final TextEditingController controller;
  final VoidCallback onSend;
  final VoidCallback onAttachVital;

  const DoctorChatInputBar({
    super.key,
    required this.controller,
    required this.onSend,
    required this.onAttachVital,
  });

  @override
  Widget build(BuildContext context) {
    final s = S.of(context)!;
    final colors = context.appColors;

    return Container(
      decoration: BoxDecoration(
        color: colors.cardBackground,
        border: Border(top: BorderSide(color: colors.borderColor)),
      ),
      child: SafeArea(
        top: false,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 10.h),
          child: Row(
            children: [
              TapScaleWidget(
                scale: 0.94,
                onTap: onAttachVital,
                child: Container(
                  width: 44.r,
                  height: 44.r,
                  decoration: BoxDecoration(
                    color: colors.navySurface,
                    borderRadius: BorderRadius.circular(13.r),
                  ),
                  alignment: Alignment.center,
                  child: Icon(
                    Icons.description_outlined,
                    color: colors.secondaryText,
                    size: 20.sp,
                  ),
                ),
              ),
              SizedBox(width: 10.w),
              Expanded(
                child: AppTextField(
                  controller: controller,
                  hintText: s.writeYourMessage,
                  fillColor: colors.inputBackground,
                  borderColor: colors.borderColor,
                  focusedBorderColor: colors.brandNavy,
                  borderRadius: 14,
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 14.w,
                    vertical: 11.h,
                  ),
                ),
              ),
              SizedBox(width: 10.w),
              TapScaleWidget(
                scale: 0.94,
                onTap: onSend,
                child: Container(
                  width: 44.r,
                  height: 44.r,
                  decoration: BoxDecoration(
                    color: AppColors.orangeBadge,
                    borderRadius: BorderRadius.circular(13.r),
                  ),
                  alignment: Alignment.center,
                  child: Icon(
                    context.forwardChevron,
                    color: AppColors.white,
                    size: 22.sp,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
