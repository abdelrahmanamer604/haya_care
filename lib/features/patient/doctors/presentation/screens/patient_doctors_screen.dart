import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:haya_care/core/routing/routes.dart';
import 'package:haya_care/core/utils/extensions.dart';
import 'package:haya_care/core/utils/responsive.dart';
import 'package:haya_care/core/widgets/empty_state_widget.dart';
import 'package:haya_care/core/widgets/sticky_pull_header_scroll_view.dart';
import 'package:haya_care/features/patient/doctors/data/doctors_demo_data.dart';
import 'package:haya_care/features/patient/doctors/data/models/doctor_model.dart';
import 'package:haya_care/features/patient/doctors/presentation/controllers/patient_doctors_controller.dart';
import 'package:haya_care/features/patient/doctors/presentation/widgets/doctor_list_card.dart';
import 'package:haya_care/features/patient/doctors/presentation/widgets/doctors_brand_header.dart';
import 'package:haya_care/features/patient/doctors/presentation/widgets/doctors_search_and_filters.dart';
import 'package:haya_care/l10n/app_localizations.dart';

class PatientDoctorsScreen extends StatefulWidget {
  const PatientDoctorsScreen({super.key});

  @override
  State<PatientDoctorsScreen> createState() => _PatientDoctorsScreenState();
}

class _PatientDoctorsScreenState extends State<PatientDoctorsScreen> {
  final PatientDoctorsController _controller = PatientDoctorsController();
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _searchController.addListener(() {
      _controller.setSearchQuery(_searchController.text);
    });
  }

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
    final allDoctors = getDemoDoctors(s);

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
                final filtered = _controller.filterDoctors(allDoctors);
                return StickyPullHeaderScrollView(
                  headerHeight: 48,
                  header: const DoctorsBrandHeader(),
                  children: [
                    SizedBox(height: 10.h),
                    Text(s.doctorsTitle, style: textTheme.headlineMedium?.copyWith(fontSize: 24.sp, fontWeight: FontWeight.bold, color: colors.brandNavy)),
                    SizedBox(height: 4.h),
                    Text(s.doctorsSubtitle, style: textTheme.bodySmall?.copyWith(fontSize: 13.sp, color: colors.secondaryText)),
                    SizedBox(height: 16.h),
                    DoctorsSearchAndFilters(
                      searchController: _searchController,
                      selectedFilter: _controller.selectedFilter,
                      onSearchChanged: _controller.setSearchQuery,
                      onFilterSelected: _controller.selectFilter,
                    ),
                    SizedBox(height: 16.h),
                    if (filtered.isEmpty)
                      EmptyStateWidget(
                        icon: Icons.person_search_outlined,
                        title: s.noDoctorsFound,
                        subtitle: s.noDoctorsFoundSub,
                        actionLabel: s.resetSearchAction,
                        onAction: () {
                          _searchController.clear();
                          _controller.selectFilter(DoctorSpecialtyFilter.all);
                        },
                      )
                    else
                      ListView.separated(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: filtered.length,
                        separatorBuilder: (_, _) => SizedBox(height: 12.h),
                        itemBuilder: (_, index) {
                          final doctor = filtered[index];
                          return DoctorListCard(
                            doctor: doctor,
                            onTap: () => context.pushNamed(Routes.doctorProfile, arguments: doctor),
                          );
                        },
                      ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
