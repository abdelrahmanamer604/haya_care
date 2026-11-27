import 'package:flutter/foundation.dart';
import 'package:haya_care/features/patient/profile/data/profile_demo_data.dart';
import 'package:haya_care/l10n/app_localizations.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

class MedicalReportPdfService {
  MedicalReportPdfService._();

  static Future<void> exportReport(ReportPeriodSummary summary, S s) async {
    final bytes = await _buildPdfBytes(summary, s);
    try {
      await Printing.sharePdf(
        bytes: bytes,
        filename: 'hayacare_medical_report.pdf',
      );
    } catch (e) {
      debugPrint('Printing.sharePdf failed, falling back to layoutPdf: $e');
      await Printing.layoutPdf(onLayout: (_) async => bytes);
    }
  }

  static Future<Uint8List> _buildPdfBytes(
    ReportPeriodSummary summary,
    S s,
  ) async {
    pw.Font? regular;
    pw.Font? bold;
    var hasArabicFont = true;
    try {
      regular = await PdfGoogleFonts.iBMPlexSansArabicRegular();
      bold = await PdfGoogleFonts.iBMPlexSansArabicBold();
    } catch (e) {
      debugPrint('Google font load failed, using Helvetica fallback: $e');
      hasArabicFont = false;
      regular = pw.Font.helvetica();
      bold = pw.Font.helveticaBold();
    }

    final useRtl = hasArabicFont && s.localeName.startsWith('ar');
    final doc = pw.Document();
    final baseStyle = pw.TextStyle(font: regular, fontSize: 12);
    final boldStyle = pw.TextStyle(font: bold, fontSize: 13);

    doc.addPage(
      pw.Page(
        pageFormat: PdfPageFormat.a4,
        textDirection: useRtl ? pw.TextDirection.rtl : pw.TextDirection.ltr,
        build: (_) => pw.Column(
          crossAxisAlignment: pw.CrossAxisAlignment.start,
          children: [
            pw.Text(
              hasArabicFont ? 'HayaCare - ${summary.title}' : 'HayaCare Medical Report',
              style: pw.TextStyle(font: bold, fontSize: 20),
            ),
            pw.SizedBox(height: 6),
            pw.Text(
              hasArabicFont ? '${s.profileDemoName} (${summary.dateRange})' : 'Patient: Ahmed Khaled',
              style: baseStyle,
            ),
            pw.Divider(height: 24),
            _pdfRow(hasArabicFont ? s.avgBloodPressure : 'Avg Blood Pressure', '${summary.bp} mmHg', baseStyle, boldStyle),
            _pdfRow(hasArabicFont ? s.avgBloodSugar : 'Avg Blood Sugar', '${summary.sugar} mg/dL', baseStyle, boldStyle),
            _pdfRow(hasArabicFont ? s.avgWeight : 'Avg Weight', '${summary.weight} kg', baseStyle, boldStyle),
            _pdfRow(hasArabicFont ? s.avgHeartRate : 'Avg Heart Rate', '${summary.heartRate} bpm', baseStyle, boldStyle),
            _pdfRow(hasArabicFont ? s.medicationAdherence : 'Medication Adherence', summary.adherence, baseStyle, boldStyle),
          ],
        ),
      ),
    );
    return doc.save();
  }

  static pw.Widget _pdfRow(String label, String value, pw.TextStyle base, pw.TextStyle bold) {
    return pw.Padding(
      padding: const pw.EdgeInsets.symmetric(vertical: 6),
      child: pw.Row(
        mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
        children: [pw.Text(label, style: base), pw.Text(value, style: bold)],
      ),
    );
  }
}
