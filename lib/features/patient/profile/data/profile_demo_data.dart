import 'package:flutter/material.dart';
import 'package:haya_care/l10n/app_localizations.dart';

class ReportPeriodSummary {
  final String title, dateRange, bp, sugar, weight, heartRate, adherence;
  const ReportPeriodSummary({
    required this.title,
    required this.dateRange,
    required this.bp,
    required this.sugar,
    required this.weight,
    required this.heartRate,
    required this.adherence,
  });
}

class MessageThreadModel {
  final String id, name, lastMessage, time, initials;
  final int unreadCount;
  const MessageThreadModel({
    required this.id,
    required this.name,
    required this.lastMessage,
    required this.time,
    required this.initials,
    this.unreadCount = 0,
  });
}

class HealthTipModel {
  final int categoryId;
  final IconData icon;
  final String category, title, description;
  const HealthTipModel({
    required this.categoryId,
    required this.icon,
    required this.category,
    required this.title,
    required this.description,
  });
}

class MedicationDoseModel {
  final String id, name, dosage, schedule;
  final bool initialTaken;
  const MedicationDoseModel({
    required this.id,
    required this.name,
    required this.dosage,
    required this.schedule,
    required this.initialTaken,
  });
}

List<ReportPeriodSummary> getReportSummaries(S s) => [
      ReportPeriodSummary(
        title: s.reportWeekTitle,
        dateRange: s.reportWeekRange,
        bp: '126/80',
        sugar: '102',
        weight: '82.4',
        heartRate: '71',
        adherence: '93%',
      ),
      ReportPeriodSummary(
        title: s.reportMonthTitle,
        dateRange: s.reportMonthRange,
        bp: '128/82',
        sugar: '106',
        weight: '82.7',
        heartRate: '73',
        adherence: '89%',
      ),
      ReportPeriodSummary(
        title: s.reportQuarterTitle,
        dateRange: s.reportQuarterRange,
        bp: '130/84',
        sugar: '110',
        weight: '83.2',
        heartRate: '74',
        adherence: '85%',
      ),
    ];

List<MessageThreadModel> getDemoMessageThreads(S s, String samerInitials) => [
      MessageThreadModel(
        id: 'samer',
        name: s.docSamerName,
        lastMessage: s.msgSamerLast,
        time: s.msgSamerTime,
        initials: samerInitials,
        unreadCount: 2,
      ),
      MessageThreadModel(
        id: 'team',
        name: s.hayaCareTeamName,
        lastMessage: s.msgTeamLast,
        time: s.msgTeamTime,
        initials: s.hayaCareTeamInitials,
      ),
    ];

List<HealthTipModel> getDemoHealthTips(S s) => [
      HealthTipModel(
        categoryId: 1,
        icon: Icons.monitor_heart_outlined,
        category: s.tipCategoryHeart,
        title: s.tipHeartTitle,
        description: s.tipHeartDesc,
      ),
      HealthTipModel(
        categoryId: 2,
        icon: Icons.spa_outlined,
        category: s.tipCategoryNutrition,
        title: s.tipNutritionTitle,
        description: s.tipNutritionDesc,
      ),
      HealthTipModel(
        categoryId: 3,
        icon: Icons.medication_outlined,
        category: s.tipCategoryMedications,
        title: s.tipMedTitle,
        description: s.tipMedDesc,
      ),
    ];

List<MedicationDoseModel> getDemoMedicationDoses(S s) => [
      MedicationDoseModel(
        id: 'metformin',
        name: s.medMetforminName,
        dosage: s.medMetforminDosage,
        schedule: s.medMetforminSchedule,
        initialTaken: true,
      ),
      MedicationDoseModel(
        id: 'amlodipine',
        name: s.medAmlodipineName,
        dosage: s.medAmlodipineDosage,
        schedule: s.medAmlodipineSchedule,
        initialTaken: false,
      ),
    ];
