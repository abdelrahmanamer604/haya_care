import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:haya_care/core/theme/app_colors.dart';
import 'package:haya_care/core/utils/extensions.dart';

class AiChatEntry {
  final String text;
  final bool isUser;

  const AiChatEntry({required this.text, required this.isUser});
}

class AiAssistantMessages extends StatelessWidget {
  final List<AiChatEntry> messages;
  final ScrollController scrollController;

  const AiAssistantMessages({
    super.key,
    required this.messages,
    required this.scrollController,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.appColors;
    final textTheme = context.textTheme;

    return ListView.separated(
      controller: scrollController,
      padding: EdgeInsets.all(14.r),
      itemCount: messages.length,
      separatorBuilder: (_, _) => SizedBox(height: 10.h),
      itemBuilder: (_, index) {
        final msg = messages[index];
        return Align(
          alignment: msg.isUser
              ? AlignmentDirectional.centerEnd
              : AlignmentDirectional.centerStart,
          child: Container(
            constraints: BoxConstraints(maxWidth: 270.w),
            padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 11.h),
            decoration: BoxDecoration(
              color: msg.isUser
                  ? AppColors.splashBackground
                  : colors.cardBackground,
              borderRadius: BorderRadiusDirectional.only(
                topStart: Radius.circular(msg.isUser ? 16.r : 4.r),
                topEnd: Radius.circular(msg.isUser ? 4.r : 16.r),
                bottomStart: Radius.circular(16.r),
                bottomEnd: Radius.circular(16.r),
              ),
              boxShadow: const [
                BoxShadow(
                  color: AppColors.shadowColor,
                  blurRadius: 8,
                  offset: Offset(0, 2),
                ),
              ],
            ),
            child: Text(
              msg.text,
              style: textTheme.bodySmall?.copyWith(
                fontSize: 12.sp,
                height: 1.5,
                color: msg.isUser ? AppColors.white : colors.brandNavy,
              ),
            ),
          ),
        );
      },
    );
  }
}
