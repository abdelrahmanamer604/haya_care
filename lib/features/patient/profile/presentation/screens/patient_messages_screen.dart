import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:haya_care/core/routing/routes.dart';
import 'package:haya_care/core/utils/extensions.dart';
import 'package:haya_care/core/utils/responsive.dart';
import 'package:haya_care/core/widgets/empty_state_widget.dart';
import 'package:haya_care/features/patient/doctors/data/doctors_demo_data.dart';
import 'package:haya_care/features/patient/profile/data/profile_demo_data.dart';
import 'package:haya_care/features/patient/profile/presentation/controllers/profile_sub_controllers.dart';
import 'package:haya_care/features/patient/profile/presentation/widgets/messages/message_thread_tile.dart';
import 'package:haya_care/features/patient/profile/presentation/widgets/shared/profile_sub_header.dart';
import 'package:haya_care/l10n/app_localizations.dart';

class PatientMessagesScreen extends StatefulWidget {
  const PatientMessagesScreen({super.key});

  @override
  State<PatientMessagesScreen> createState() => _PatientMessagesScreenState();
}

class _PatientMessagesScreenState extends State<PatientMessagesScreen> {
  final PatientMessagesController _controller = PatientMessagesController();
  final TextEditingController _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final s = S.of(context)!;
    final colors = context.appColors;
    final textTheme = context.textTheme;
    final samer = getDemoDoctors(s).first;
    final allThreads = getDemoMessageThreads(s, samer.initials);

    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        backgroundColor: context.theme.scaffoldBackgroundColor,
        body: SafeArea(
          bottom: false,
          child: AdaptiveScaffoldWrapper(
            maxContentWidth: 440,
            child: ListenableBuilder(
              listenable: _controller,
              builder: (context, _) {
                final threads = _controller.filterThreads(allThreads);
                return SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  padding: EdgeInsets.fromLTRB(20.w, 14.h, 20.w, 28.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ProfileSubHeader(title: s.messagesTitle, subtitle: s.messagesPageSubtitle),
                      SizedBox(height: 18.h),
                      TextField(
                        controller: _searchController,
                        onChanged: _controller.setSearchQuery,
                        style: textTheme.bodyMedium?.copyWith(fontSize: 13.sp),
                        decoration: InputDecoration(
                          hintText: s.searchConversationsHint,
                          prefixIcon: Icon(Icons.mail_outline_rounded, size: 19.sp, color: colors.secondaryText),
                          suffixIcon: _controller.searchQuery.isNotEmpty
                              ? IconButton(
                                  icon: Icon(Icons.close_rounded, size: 18.sp, color: colors.secondaryText),
                                  onPressed: () {
                                    _searchController.clear();
                                    _controller.clearSearch();
                                  },
                                )
                              : null,
                          filled: true,
                          fillColor: colors.cardBackground,
                          contentPadding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 12.h),
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(16.r), borderSide: BorderSide(color: colors.borderColor)),
                          enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(16.r), borderSide: BorderSide(color: colors.borderColor)),
                        ),
                      ),
                      SizedBox(height: 16.h),
                      if (threads.isEmpty)
                        EmptyStateWidget(
                          icon: Icons.chat_bubble_outline_rounded,
                          title: s.noMessagesFound,
                          subtitle: s.noMessagesFoundSub,
                          actionLabel: s.resetSearchAction,
                          onAction: () {
                            _searchController.clear();
                            _controller.clearSearch();
                          },
                        )
                      else
                        ...List.generate(threads.length, (i) {
                          final item = threads[i];
                          return Column(
                            children: [
                              MessageThreadTile(
                                name: item.name,
                                lastMessage: item.lastMessage,
                                time: item.time,
                                unreadCount: item.unreadCount,
                                initials: item.initials,
                                onTap: () => context.pushNamed(Routes.doctorChat, arguments: samer),
                              ),
                              if (i < threads.length - 1)
                                Divider(height: 1, color: colors.borderColor.withValues(alpha: 0.5)),
                            ],
                          );
                        }),
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
