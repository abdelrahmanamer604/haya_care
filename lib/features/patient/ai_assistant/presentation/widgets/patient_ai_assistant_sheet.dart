import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:haya_care/core/theme/app_colors.dart';
import 'package:haya_care/core/utils/extensions.dart';
import 'package:haya_care/features/patient/ai_assistant/presentation/controllers/ai_assistant_controller.dart';
import 'package:haya_care/features/patient/ai_assistant/presentation/widgets/ai_assistant_header.dart';
import 'package:haya_care/features/patient/ai_assistant/presentation/widgets/ai_assistant_input_area.dart';
import 'package:haya_care/features/patient/ai_assistant/presentation/widgets/ai_assistant_messages.dart';
import 'package:haya_care/l10n/app_localizations.dart';

Future<void> showPatientAiAssistantSheet(BuildContext context) {
  return showDialog<void>(
    context: context,
    barrierColor: AppColors.black.withValues(alpha: 0.35),
    builder: (_) => const PatientAiAssistantDialog(),
  );
}

class PatientAiAssistantDialog extends StatefulWidget {
  const PatientAiAssistantDialog({super.key});

  @override
  State<PatientAiAssistantDialog> createState() =>
      _PatientAiAssistantDialogState();
}

class _PatientAiAssistantDialogState extends State<PatientAiAssistantDialog> {
  final AiAssistantController _controller = AiAssistantController();
  final TextEditingController _textController = TextEditingController();
  final ScrollController _scrollController = ScrollController();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _controller.initIfNeeded(S.of(context)!);
  }

  @override
  void dispose() {
    _controller.dispose();
    _textController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  void _handleSend(String rawText) {
    if (!_controller.sendPrompt(rawText, S.of(context)!)) return;
    _textController.clear();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 250),
          curve: Curves.easeOut,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final s = S.of(context)!;
    return Dialog(
      backgroundColor: AppColors.transparent,
      insetPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 24.h),
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: 420.w, maxHeight: 480.h),
        child: Container(
          decoration: BoxDecoration(
            color: context.theme.scaffoldBackgroundColor,
            borderRadius: BorderRadius.circular(24.r),
            boxShadow: const [
              BoxShadow(color: AppColors.shadowColor, blurRadius: 20, offset: Offset(0, 8)),
            ],
          ),
          child: Column(
            children: [
              AiAssistantHeader(
                onClose: () => context.pop(),
                onClear: () => _controller.clearChat(s),
              ),
              Container(
                width: double.infinity,
                color: context.appColors.navySurface,
                padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 6.h),
                child: Text(
                  s.aiDisclaimer,
                  textAlign: TextAlign.center,
                  style: context.textTheme.labelSmall?.copyWith(fontSize: 9.5.sp, color: context.appColors.brandNavy),
                ),
              ),
              ListenableBuilder(
                listenable: _controller,
                builder: (_, _) => Container(
                  padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 6.h),
                  decoration: BoxDecoration(border: Border(bottom: BorderSide(color: context.appColors.borderColor))),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(s.aiShareDataTitle, style: context.textTheme.labelMedium?.copyWith(fontSize: 12.sp, fontWeight: FontWeight.bold, color: context.appColors.brandNavy)),
                            Text(s.aiShareDataSubtitle, style: context.textTheme.labelSmall?.copyWith(fontSize: 9.5.sp, color: context.appColors.secondaryText)),
                          ],
                        ),
                      ),
                      Switch.adaptive(value: _controller.shareHealthData, onChanged: _controller.setShareHealthData),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: ListenableBuilder(
                  listenable: _controller,
                  builder: (_, _) => AiAssistantMessages(
                    messages: _controller.messages,
                    scrollController: _scrollController,
                  ),
                ),
              ),
              AiAssistantInputArea(
                controller: _textController,
                suggestions: [s.aiChipBpMeaning, s.aiChipNextMed, s.aiChipGeneralTip],
                onSuggestionTap: _handleSend,
                onSend: () => _handleSend(_textController.text),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
