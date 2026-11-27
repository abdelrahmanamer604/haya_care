import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:haya_care/core/utils/extensions.dart';
import 'package:haya_care/core/utils/responsive.dart';
import 'package:haya_care/features/patient/doctors/data/doctor_chat_demo_data.dart';
import 'package:haya_care/features/patient/doctors/data/models/chat_message_model.dart';
import 'package:haya_care/features/patient/doctors/data/models/doctor_model.dart';
import 'package:haya_care/features/patient/doctors/presentation/controllers/doctor_chat_controller.dart';
import 'package:haya_care/features/patient/doctors/presentation/widgets/doctor_chat_bubble.dart';
import 'package:haya_care/features/patient/doctors/presentation/widgets/doctor_chat_header.dart';
import 'package:haya_care/features/patient/doctors/presentation/widgets/doctor_chat_input_bar.dart';
import 'package:haya_care/features/patient/doctors/presentation/widgets/doctor_chat_vital_card.dart';
import 'package:haya_care/l10n/app_localizations.dart';

class DoctorChatScreen extends StatefulWidget {
  final DoctorModel doctor;

  const DoctorChatScreen({super.key, required this.doctor});

  @override
  State<DoctorChatScreen> createState() => _DoctorChatScreenState();
}

class _DoctorChatScreenState extends State<DoctorChatScreen> {
  final DoctorChatController _controller = DoctorChatController();
  final TextEditingController _textController = TextEditingController();
  final ScrollController _scrollController = ScrollController();

  @override
  void dispose() {
    _textController.dispose();
    _scrollController.dispose();
    _controller.dispose();
    super.dispose();
  }

  void _scrollToBottom() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 240),
          curve: Curves.easeOut,
        );
      }
    });
  }

  void _handleSend(S s) {
    final text = _textController.text.trim();
    if (text.isEmpty) return;
    _controller.sendTextMessage(text, s.chatJustNow);
    _textController.clear();
    _scrollToBottom();
  }

  void _handleAttachVital(S s) {
    _controller.sendVitalCard(
      title: s.bloodPressure,
      value: s.chatReadingValue,
      status: s.normalStatus,
      time: s.chatDemoVitalTime,
    );
    _scrollToBottom();
  }

  @override
  Widget build(BuildContext context) {
    final s = S.of(context)!;
    final theme = context.theme;
    final colors = context.appColors;
    final textTheme = context.textTheme;
    _controller.initIfNeeded(getDemoDoctorChatMessages(s));

    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        backgroundColor: theme.scaffoldBackgroundColor,
        body: Column(
          children: [
            DoctorChatHeader(
              doctor: widget.doctor,
              onBack: () => context.pop(),
            ),
            Expanded(
              child: AdaptiveScaffoldWrapper(
                maxContentWidth: 440,
                child: ListenableBuilder(
                  listenable: _controller,
                  builder: (context, _) {
                    final messages = _controller.messages;
                    return ListView.separated(
                      controller: _scrollController,
                      physics: const BouncingScrollPhysics(),
                      padding: EdgeInsets.symmetric(
                        horizontal: 18.w,
                        vertical: 16.h,
                      ),
                      itemCount: messages.length + 1,
                      separatorBuilder: (_, _) => SizedBox(height: 12.h),
                      itemBuilder: (_, index) {
                        if (index == 0) {
                          return Center(
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: 14.w,
                                vertical: 5.h,
                              ),
                              decoration: BoxDecoration(
                                color: colors.inputBackground,
                                borderRadius: BorderRadius.circular(14.r),
                              ),
                              child: Text(
                                s.chatToday,
                                style: textTheme.labelSmall?.copyWith(
                                  fontSize: 11.sp,
                                  color: colors.secondaryText,
                                ),
                              ),
                            ),
                          );
                        }
                        final msg = messages[index - 1];
                        return msg.type == ChatMessageType.vitalReading
                            ? DoctorChatVitalCard(message: msg)
                            : DoctorChatBubble(message: msg);
                      },
                    );
                  },
                ),
              ),
            ),
            DoctorChatInputBar(
              controller: _textController,
              onSend: () => _handleSend(s),
              onAttachVital: () => _handleAttachVital(s),
            ),
          ],
        ),
      ),
    );
  }
}
