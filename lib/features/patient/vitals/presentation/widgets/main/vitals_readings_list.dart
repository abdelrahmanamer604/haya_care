import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:haya_care/core/widgets/empty_state_widget.dart';
import 'package:haya_care/features/patient/vitals/data/models/vital_reading_model.dart';
import 'package:haya_care/features/patient/vitals/presentation/widgets/main/vital_reading_card.dart';
import 'package:haya_care/l10n/app_localizations.dart';

class VitalsReadingsList extends StatelessWidget {
  final List<VitalReadingModel> readings;
  final VitalCategory category;
  final VitalDateFilter filter;
  final ValueChanged<VitalReadingModel>? onReadingTap;

  const VitalsReadingsList({
    super.key,
    required this.readings,
    required this.category,
    required this.filter,
    this.onReadingTap,
  });

  @override
  Widget build(BuildContext context) {
    final s = S.of(context)!;

    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 280),
      child: readings.isEmpty
          ? EmptyStateWidget(
              key: const ValueKey('empty_readings'),
              icon: Icons.monitor_heart_outlined,
              title: s.noReadingsTitle,
              subtitle: s.noReadingsSubtitle,
            )
          : ListView.separated(
              key: ValueKey(
                '${category.name}_${filter.name}_${readings.length}',
              ),
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: readings.length,
              separatorBuilder: (_, _) => SizedBox(height: 12.h),
              itemBuilder: (_, index) {
                final reading = readings[index];
                return VitalReadingCard(
                  reading: reading,
                  onTap: onReadingTap != null ? () => onReadingTap!(reading) : null,
                );
              },
            ),
    );
  }
}
