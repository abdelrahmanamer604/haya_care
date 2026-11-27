import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:haya_care/core/utils/app_feedback.dart';
import 'package:haya_care/features/patient/vitals/data/models/vital_reading_model.dart';
import 'package:haya_care/features/patient/vitals/data/vitals_demo_data.dart';
import 'package:haya_care/features/patient/vitals/presentation/widgets/add_reading/vital_category_fields.dart';
import 'package:haya_care/features/patient/vitals/presentation/widgets/add_reading/vital_reading_form_footer.dart';
import 'package:haya_care/features/patient/vitals/presentation/widgets/add_reading/vital_reading_form_header.dart';
import 'package:haya_care/features/patient/vitals/presentation/widgets/add_reading/vital_reading_success_state.dart';
import 'package:haya_care/features/patient/vitals/presentation/widgets/add_reading/vital_voice_input_dialog.dart';
import 'package:haya_care/features/patient/vitals/presentation/widgets/add_reading/vital_voice_parser.dart';
import 'package:haya_care/l10n/app_localizations.dart';

class AddVitalReadingSheet extends StatefulWidget {
  final VitalCategory category;
  final VitalReadingModel? initialReading;
  final void Function(String value, String note) onSave;
  final VoidCallback? onDelete;

  const AddVitalReadingSheet({super.key, required this.category, required this.onSave, this.initialReading, this.onDelete});

  @override
  State<AddVitalReadingSheet> createState() => _AddVitalReadingSheetState();
}

class _AddVitalReadingSheetState extends State<AddVitalReadingSheet> {
  final _systolicController = TextEditingController();
  final _diastolicController = TextEditingController();
  final _singleValueController = TextEditingController();
  final _notesController = TextEditingController();
  DateTime _selectedDate = DateTime.now();
  TimeOfDay _selectedTime = TimeOfDay.now();
  int _selectedContextIndex = 0;
  String? _validationError;
  bool _isSaved = false;
  Timer? _autoCloseTimer;

  @override
  void initState() {
    super.initState();
    final initial = widget.initialReading;
    if (initial == null) return;
    _notesController.text = initial.note;
    if (widget.category == VitalCategory.bloodPressure) {
      final parts = initial.value.split('/');
      if (parts.isNotEmpty) _systolicController.text = parts[0].trim();
      if (parts.length > 1) _diastolicController.text = parts[1].trim();
    } else {
      _singleValueController.text = initial.value;
    }
  }

  @override
  void dispose() {
    _autoCloseTimer?.cancel();
    for (final c in [_systolicController, _diastolicController, _singleValueController, _notesController]) {
      c.dispose();
    }
    super.dispose();
  }

  Future<void> _pickDate() async {
    final picked = await showDatePicker(context: context, initialDate: _selectedDate, firstDate: DateTime(2020), lastDate: DateTime.now());
    if (picked != null && mounted) setState(() => _selectedDate = picked);
  }

  Future<void> _pickTime() async {
    final picked = await showTimePicker(context: context, initialTime: _selectedTime);
    if (picked != null && mounted) setState(() => _selectedTime = picked);
  }

  void _handleSave(S s) {
    final (value, note, error) = resolveVitalReadingInput(
      s: s,
      category: widget.category,
      systolic: _systolicController.text,
      diastolic: _diastolicController.text,
      pulse: '',
      singleValue: _singleValueController.text,
      rawNote: _notesController.text,
      contextIndex: _selectedContextIndex,
    );
    if (error != null || value == null) {
      setState(() => _validationError = error);
      return;
    }
    HapticFeedback.mediumImpact();
    widget.onSave(value, note);
    setState(() { _validationError = null; _isSaved = true; });
    _autoCloseTimer = Timer(const Duration(milliseconds: 1700), () {
      if (mounted) Navigator.of(context).pop();
    });
  }

  @override
  Widget build(BuildContext context) {
    final s = S.of(context)!;
    return SafeArea(
      top: false,
      child: Padding(
        padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: EdgeInsets.fromLTRB(20.w, 12.h, 20.w, 24.h),
          child: AnimatedSwitcher(
            duration: const Duration(milliseconds: 360),
            child: _isSaved ? const VitalReadingSuccessState() : _buildFormState(s),
          ),
        ),
      ),
    );
  }

  Future<void> _pickVoice(S s) async {
    final spoken = await showVitalVoiceInputDialog(context, category: widget.category);
    if (spoken == null || !mounted) return;
    final parsed = VitalVoiceParser.parse(spoken, getVitalContextOptions(s, widget.category));
    if (parsed.numbers.isEmpty && parsed.contextIndex == null && parsed.date == null && parsed.time == null) return;
    setState(() {
      if (parsed.numbers.isNotEmpty) {
        if (widget.category == VitalCategory.bloodPressure) {
          _systolicController.text = parsed.numbers[0];
          if (parsed.numbers.length > 1) _diastolicController.text = parsed.numbers[1];
        } else {
          _singleValueController.text = parsed.numbers[0];
        }
      }
      if (parsed.contextIndex != null) _selectedContextIndex = parsed.contextIndex!;
      if (parsed.date != null) _selectedDate = parsed.date!;
      if (parsed.time != null) _selectedTime = parsed.time!;
    });
    AppFeedback.showInfo(context, s.voiceInputApplied);
  }

  Widget _buildFormState(S s) {
    return Column(
      key: const ValueKey('form_state'),
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        VitalReadingFormHeader(category: widget.category, isEditing: widget.initialReading != null, onClose: () => Navigator.of(context).pop(), onVoiceTap: () => _pickVoice(s)),
        SizedBox(height: 18.h),
        VitalCategoryFields(category: widget.category, systolicController: _systolicController, diastolicController: _diastolicController, singleValueController: _singleValueController, contextOptions: getVitalContextOptions(s, widget.category), selectedContextIndex: _selectedContextIndex, onContextChanged: (idx) => setState(() => _selectedContextIndex = idx)),
        VitalReadingFormFooter(validationError: _validationError, selectedDate: _selectedDate, selectedTime: _selectedTime, notesController: _notesController, onPickDate: _pickDate, onPickTime: _pickTime, onSave: () => _handleSave(s), isEditing: widget.initialReading != null, onDelete: widget.onDelete),
      ],
    );
  }
}
