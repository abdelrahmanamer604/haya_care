import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:haya_care/core/theme/app_colors.dart';
import 'package:haya_care/core/utils/extensions.dart';
import 'package:haya_care/l10n/app_localizations.dart';

class AiAssistantInputArea extends StatelessWidget {
  final TextEditingController controller;
  final List<String> suggestions;
  final ValueChanged<String> onSuggestionTap;
  final VoidCallback onSend;

  const AiAssistantInputArea({
    super.key,
    required this.controller,
    required this.suggestions,
    required this.onSuggestionTap,
    required this.onSend,
  });

  @override
  Widget build(BuildContext context) {
    final s = S.of(context)!;
    final colors = context.appColors;
    final textTheme = context.textTheme;

    return Container(
      padding: EdgeInsets.fromLTRB(12.w, 8.h, 12.w, 12.h),
      decoration: BoxDecoration(
        color: colors.cardBackground,
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(24.r)),
        border: Border(top: BorderSide(color: colors.borderColor.withValues(alpha: 0.45))),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: suggestions.map((label) {
                return Padding(
                  padding: EdgeInsetsDirectional.only(end: 6.w),
                  child: InkWell(
                    onTap: () => onSuggestionTap(label),
                    borderRadius: BorderRadius.circular(20.r),
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 11.w, vertical: 6.h),
                      decoration: BoxDecoration(
                        color: colors.orangeSurface,
                        borderRadius: BorderRadius.circular(20.r),
                        border: Border.all(color: AppColors.orangeBadge.withValues(alpha: 0.3)),
                      ),
                      child: Text(label,
                          style: textTheme.labelSmall?.copyWith(
                              fontSize: 10.5.sp,
                              fontWeight: FontWeight.w600,
                              color: AppColors.orangeBadge)),
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
          SizedBox(height: 10.h),
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: controller,
                  textInputAction: TextInputAction.send,
                  onSubmitted: (_) => onSend(),
                  style: textTheme.bodySmall?.copyWith(fontSize: 12.sp),
                  decoration: InputDecoration(
                    hintText: s.aiInputHint,
                    hintStyle: textTheme.labelSmall?.copyWith(fontSize: 11.sp, color: colors.secondaryText),
                    filled: true,
                    fillColor: colors.inputBackground,
                    isDense: true,
                    contentPadding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 11.h),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(14.r),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ),
              SizedBox(width: 8.w),
              InkWell(
                onTap: onSend,
                borderRadius: BorderRadius.circular(12.r),
                child: Container(
                  width: 40.r,
                  height: 40.r,
                  decoration: BoxDecoration(
                    color: AppColors.orangeBadge,
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                  alignment: Alignment.center,
                  child: Icon(context.forwardChevron, color: AppColors.white, size: 20.sp),
                ),
              ),
            ],
          ),
          SizedBox(height: 8.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.lock_outline_rounded, size: 11.sp, color: colors.secondaryText),
              SizedBox(width: 4.w),
              Flexible(
                child: Text(s.aiDisclaimer,
                    textAlign: TextAlign.center,
                    style: textTheme.labelSmall?.copyWith(fontSize: 9.sp, color: colors.secondaryText)),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
