import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:haya_care/core/theme/app_colors.dart';
import 'package:haya_care/core/utils/extensions.dart';

class AppToggleOption<T> {
  final T value;
  final String label;
  final IconData? icon;

  const AppToggleOption({required this.value, required this.label, this.icon});
}

class AppSegmentedToggle<T> extends StatefulWidget {
  final List<AppToggleOption<T>> options;
  final T selectedValue;
  final ValueChanged<T> onChanged;
  final double? height;
  final double borderRadius;
  final double fontSize;

  const AppSegmentedToggle({
    super.key,
    required this.options,
    required this.selectedValue,
    required this.onChanged,
    this.height,
    this.borderRadius = 14.0,
    this.fontSize = 13.0,
  });

  @override
  State<AppSegmentedToggle<T>> createState() => _AppSegmentedToggleState<T>();
}

class _AppSegmentedToggleState<T> extends State<AppSegmentedToggle<T>> {
  int? _pressedIndex;

  @override
  Widget build(BuildContext context) {
    final textTheme = context.textTheme;
    final colors = context.appColors;
    final count = widget.options.length;
    final selectedIndex = widget.options
        .indexWhere((o) => o.value == widget.selectedValue)
        .clamp(0, count - 1);
    final alignmentX =
        count <= 1 ? 0.0 : -1.0 + (2.0 * selectedIndex / (count - 1));

    return Container(
      height: widget.height ?? 48.h,
      padding: EdgeInsets.all(4.r),
      decoration: BoxDecoration(
        color: colors.inputBackground,
        borderRadius: BorderRadius.circular(widget.borderRadius.r),
        border: Border.all(color: colors.borderColor.withValues(alpha: 0.6)),
      ),
      child: Stack(
        children: [
          AnimatedAlign(
            alignment: AlignmentDirectional(alignmentX, 0),
            duration: const Duration(milliseconds: 380),
            curve: Curves.easeOutBack,
            child: FractionallySizedBox(
              widthFactor: 1 / count,
              heightFactor: 1,
              child: AnimatedScale(
                scale: _pressedIndex == selectedIndex ? 0.96 : 1.0,
                duration: const Duration(milliseconds: 120),
                curve: Curves.easeOut,
                child: Container(
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [AppColors.splashBackground, AppColors.primaryBlue],
                      begin: AlignmentDirectional.topStart,
                      end: AlignmentDirectional.bottomEnd,
                    ),
                    borderRadius:
                        BorderRadius.circular((widget.borderRadius - 4).r),
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.primaryBlue.withValues(alpha: 0.28),
                        blurRadius: 12,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Row(
            children: List.generate(count, (index) {
              final option = widget.options[index];
              final isSelected = option.value == widget.selectedValue;
              final isPressed = _pressedIndex == index;
              final itemColor =
                  isSelected ? AppColors.white : colors.primaryText;

              return Expanded(
                child: GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTapDown: (_) => setState(() => _pressedIndex = index),
                  onTapUp: (_) => setState(() => _pressedIndex = null),
                  onTapCancel: () => setState(() => _pressedIndex = null),
                  onTap: () {
                    if (!isSelected) {
                      HapticFeedback.selectionClick();
                      widget.onChanged(option.value);
                    }
                  },
                  child: Center(
                    child: AnimatedScale(
                      scale: isPressed ? 0.92 : (isSelected ? 1.05 : 0.97),
                      duration: Duration(milliseconds: isPressed ? 100 : 280),
                      curve: Curves.easeOutBack,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          if (option.icon != null) ...[
                            Icon(option.icon, size: 18.sp, color: itemColor),
                            SizedBox(width: 6.w),
                          ],
                          Flexible(
                            child: Text(
                              option.label,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: textTheme.labelMedium?.copyWith(
                                fontSize: widget.fontSize.sp,
                                fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
                                color: itemColor,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            }),
          ),
        ],
      ),
    );
  }
}
