import 'package:flutter/material.dart';
import 'package:haya_care/core/theme/app_colors.dart';
import 'package:haya_care/core/utils/extensions.dart';
import 'package:haya_care/core/widgets/feature_placeholder_view.dart';
import 'package:haya_care/l10n/app_localizations.dart';

class AdminApprovalsScreen extends StatelessWidget {
  const AdminApprovalsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return FeaturePlaceholderView(
      title: S.of(context)!.adminApprovalsNav,
      icon: Icons.verified_user_outlined,
      accentColor: AppColors.orangeBadge,
      accentBgColor: context.appColors.orangeSurface,
    );
  }
}
