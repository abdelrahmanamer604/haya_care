import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:haya_care/core/theme/app_colors.dart';
import 'package:haya_care/core/utils/extensions.dart';
import 'package:haya_care/features/auth/presentation/widgets/register/register_doctor_extra_header.dart';
import 'package:haya_care/features/auth/presentation/widgets/register/register_file_upload_card.dart';
import 'package:haya_care/features/auth/presentation/widgets/register/register_labeled_field.dart';
import 'package:haya_care/l10n/app_localizations.dart';

class RegisterDoctorExtraSection extends StatefulWidget {
  final TextEditingController specialtyController;
  final TextEditingController experienceController;
  final TextEditingController licenseController;
  final TextEditingController hospitalController;

  const RegisterDoctorExtraSection({
    super.key,
    required this.specialtyController,
    required this.experienceController,
    required this.licenseController,
    required this.hospitalController,
  });

  @override
  State<RegisterDoctorExtraSection> createState() =>
      _RegisterDoctorExtraSectionState();
}

class _RegisterDoctorExtraSectionState
    extends State<RegisterDoctorExtraSection> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    final s = S.of(context)!;
    final colors = context.appColors;
    final borderColor = _isExpanded
        ? AppColors.orangeBadge.withValues(alpha: 0.45)
        : colors.borderColor;

    return AnimatedContainer(
      duration: const Duration(milliseconds: 250),
      curve: Curves.easeInOut,
      decoration: BoxDecoration(
        color: colors.uploadCardBackground,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: borderColor, width: 1.2),
      ),
      child: Column(
        children: [
          RegisterDoctorExtraHeader(
            isExpanded: _isExpanded,
            onTap: () => setState(() => _isExpanded = !_isExpanded),
          ),
          AnimatedCrossFade(
            firstChild: const SizedBox(width: double.infinity, height: 0),
            secondChild: _buildBody(s, colors.borderColor),
            crossFadeState: _isExpanded
                ? CrossFadeState.showSecond
                : CrossFadeState.showFirst,
            duration: const Duration(milliseconds: 250),
            sizeCurve: Curves.easeInOut,
          ),
        ],
      ),
    );
  }

  Widget _buildBody(S s, Color dividerColor) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(14.w, 2.h, 14.w, 14.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Divider(height: 1, color: dividerColor),
          SizedBox(height: 12.h),
          RegisterLabeledField(
            label: s.medicalSpecialty,
            hint: s.medicalSpecialtyHint,
            controller: widget.specialtyController,
          ),
          SizedBox(height: 12.h),
          Row(
            children: [
              Expanded(
                child: RegisterLabeledField(
                  label: s.experienceYears,
                  hint: s.experienceYearsNewHint,
                  controller: widget.experienceController,
                  keyboardType: TextInputType.number,
                ),
              ),
              SizedBox(width: 10.w),
              Expanded(
                child: RegisterLabeledField(
                  label: s.medicalLicenseNumber,
                  hint: s.medicalLicenseHint,
                  controller: widget.licenseController,
                ),
              ),
            ],
          ),
          SizedBox(height: 12.h),
          RegisterLabeledField(
            label: s.workplaceHospital,
            hint: s.workplaceHospitalHint,
            controller: widget.hospitalController,
          ),
          SizedBox(height: 14.h),
          RegisterFileUploadCard(
            title: s.medicalLicenseFile,
            hint: s.fileFormatHint,
            buttonText: s.chooseFile,
          ),
          SizedBox(height: 10.h),
          RegisterFileUploadCard(
            title: s.qualificationFile,
            hint: s.fileFormatHint,
            buttonText: s.chooseFile,
          ),
        ],
      ),
    );
  }
}
