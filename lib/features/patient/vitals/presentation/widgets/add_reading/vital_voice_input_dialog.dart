import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:haya_care/core/theme/app_colors.dart';
import 'package:haya_care/core/utils/extensions.dart';
import 'package:haya_care/features/patient/vitals/data/models/vital_reading_model.dart';
import 'package:haya_care/features/patient/vitals/presentation/controllers/vital_voice_controller.dart';
import 'package:haya_care/l10n/app_localizations.dart';

Future<String?> showVitalVoiceInputDialog(BuildContext context, {required VitalCategory category}) {
  return showDialog<String>(context: context, builder: (_) => _VoiceInputDialog(category: category));
}

class _VoiceInputDialog extends StatefulWidget {
  final VitalCategory category;
  const _VoiceInputDialog({required this.category});

  @override
  State<_VoiceInputDialog> createState() => _VoiceInputDialogState();
}

class _VoiceInputDialogState extends State<_VoiceInputDialog> {
  final VitalVoiceController _controller = VitalVoiceController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) _controller.initAndListen();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  String _hintForCategory(S s) => switch (widget.category) {
        VitalCategory.bloodPressure => s.voiceHintBp,
        VitalCategory.bloodSugar => s.voiceHintSugar,
        VitalCategory.weight => s.voiceHintWeight,
        VitalCategory.heartRate => s.voiceHintHeartRate,
        VitalCategory.oxygen => s.voiceHintOxygen,
        VitalCategory.temperature => s.voiceHintTemperature,
      };

  @override
  Widget build(BuildContext context) {
    final s = S.of(context)!;
    final colors = context.appColors;
    return ListenableBuilder(
      listenable: _controller,
      builder: (context, _) {
        final activeColor = _controller.isListening ? AppColors.heartRateRed : AppColors.orangeBadge;
        return AlertDialog(
          backgroundColor: colors.cardBackground,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.r)),
          title: Row(
            children: [
              Icon(_controller.isListening ? Icons.graphic_eq_rounded : Icons.mic_rounded, color: activeColor, size: 22.sp),
              SizedBox(width: 8.w),
              Expanded(child: Text(s.voiceInputButton, style: context.textTheme.titleMedium?.copyWith(color: colors.brandNavy, fontWeight: FontWeight.bold))),
            ],
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              InkWell(
                onTap: _controller.toggleListening,
                borderRadius: BorderRadius.circular(36.r),
                child: CircleAvatar(radius: 32.r, backgroundColor: activeColor.withValues(alpha: 0.14), child: Icon(_controller.isListening ? Icons.stop_rounded : Icons.mic_rounded, color: activeColor, size: 30.sp)),
              ),
              SizedBox(height: 8.h),
              Text(
                _controller.initFailed ? s.voiceMicUnavailable : (_controller.isListening ? s.voiceListeningStatus : s.voiceTapMicToStart),
                textAlign: TextAlign.center,
                style: context.textTheme.bodySmall?.copyWith(color: _controller.initFailed ? AppColors.heartRateRed : colors.secondaryText),
              ),
              SizedBox(height: 12.h),
              TextField(
                controller: _controller.textController,
                maxLines: 2,
                decoration: InputDecoration(hintText: _hintForCategory(s), filled: true, fillColor: colors.inputBackground, border: OutlineInputBorder(borderRadius: BorderRadius.circular(12.r), borderSide: BorderSide.none)),
              ),
            ],
          ),
          actions: [
            TextButton(onPressed: () => Navigator.of(context).pop(), child: Text(s.cancelButton, style: context.textTheme.labelMedium?.copyWith(color: colors.secondaryText))),
            ElevatedButton(
              onPressed: () => Navigator.of(context).pop(_controller.textController.text),
              style: ElevatedButton.styleFrom(backgroundColor: AppColors.splashBackground, foregroundColor: AppColors.white),
              child: Text(s.voiceApplyButton, style: context.textTheme.labelMedium?.copyWith(color: AppColors.white, fontWeight: FontWeight.bold)),
            ),
          ],
        );
      },
    );
  }
}
