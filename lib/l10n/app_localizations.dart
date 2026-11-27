import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_ar.dart';
import 'app_localizations_en.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of S
/// returned by `S.of(context)`.
///
/// Applications need to include `S.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: S.localizationsDelegates,
///   supportedLocales: S.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the S.supportedLocales
/// property.
abstract class S {
  S(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static S? of(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  static const LocalizationsDelegate<S> delegate = _SDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('ar'),
    Locale('en'),
  ];

  /// No description provided for @splashTagline.
  ///
  /// In en, this message translates to:
  /// **'Your health with you, every day'**
  String get splashTagline;

  /// No description provided for @splashSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Closer Care. Better Life.'**
  String get splashSubtitle;

  /// No description provided for @splashFooter.
  ///
  /// In en, this message translates to:
  /// **'Trusted Healthcare In Your Hands'**
  String get splashFooter;

  /// No description provided for @skip.
  ///
  /// In en, this message translates to:
  /// **'Skip'**
  String get skip;

  /// No description provided for @next.
  ///
  /// In en, this message translates to:
  /// **'Next'**
  String get next;

  /// No description provided for @getStarted.
  ///
  /// In en, this message translates to:
  /// **'Get Started'**
  String get getStarted;

  /// No description provided for @onboardingTitle1.
  ///
  /// In en, this message translates to:
  /// **'Your Journey Starts Your Way'**
  String get onboardingTitle1;

  /// No description provided for @onboardingSubtitle1.
  ///
  /// In en, this message translates to:
  /// **'Choose language and theme now, change anytime in settings.'**
  String get onboardingSubtitle1;

  /// No description provided for @onboardingTitle2.
  ///
  /// In en, this message translates to:
  /// **'All Your Health Indicators in One Place'**
  String get onboardingTitle2;

  /// No description provided for @onboardingSubtitle2.
  ///
  /// In en, this message translates to:
  /// **'Track blood pressure, glucose, weight, and heart rate with ease.'**
  String get onboardingSubtitle2;

  /// No description provided for @onboardingTitle3.
  ///
  /// In en, this message translates to:
  /// **'Closer Care & Safer Communication'**
  String get onboardingTitle3;

  /// No description provided for @onboardingSubtitle3.
  ///
  /// In en, this message translates to:
  /// **'Connect with your doctor, share what you choose, and track meds.'**
  String get onboardingSubtitle3;

  /// No description provided for @onboardingTitle4.
  ///
  /// In en, this message translates to:
  /// **'Privacy & Security Under Your Control'**
  String get onboardingTitle4;

  /// No description provided for @onboardingSubtitle4.
  ///
  /// In en, this message translates to:
  /// **'Your data is encrypted and protected by highest healthcare standards.'**
  String get onboardingSubtitle4;

  /// No description provided for @appLanguage.
  ///
  /// In en, this message translates to:
  /// **'App Language'**
  String get appLanguage;

  /// No description provided for @appLanguageSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Select your preferred language'**
  String get appLanguageSubtitle;

  /// No description provided for @appTheme.
  ///
  /// In en, this message translates to:
  /// **'App Theme'**
  String get appTheme;

  /// No description provided for @appThemeSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Choose the best view for your eyes'**
  String get appThemeSubtitle;

  /// No description provided for @systemTheme.
  ///
  /// In en, this message translates to:
  /// **'System'**
  String get systemTheme;

  /// No description provided for @arabic.
  ///
  /// In en, this message translates to:
  /// **'العربية'**
  String get arabic;

  /// No description provided for @english.
  ///
  /// In en, this message translates to:
  /// **'English'**
  String get english;

  /// No description provided for @lightTheme.
  ///
  /// In en, this message translates to:
  /// **'Light'**
  String get lightTheme;

  /// No description provided for @darkTheme.
  ///
  /// In en, this message translates to:
  /// **'Dark'**
  String get darkTheme;

  /// No description provided for @loginSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Enter your account info to be directed to your dashboard'**
  String get loginSubtitle;

  /// No description provided for @loginEmailHint.
  ///
  /// In en, this message translates to:
  /// **'patient@hayacare.app'**
  String get loginEmailHint;

  /// No description provided for @loginPasswordHint.
  ///
  /// In en, this message translates to:
  /// **'Enter your password'**
  String get loginPasswordHint;

  /// No description provided for @sampleAccounts.
  ///
  /// In en, this message translates to:
  /// **'Demo accounts: doctor@hayacare.app · patient@hayacare.app · admin@hayacare.app'**
  String get sampleAccounts;

  /// No description provided for @joinHayaCare.
  ///
  /// In en, this message translates to:
  /// **'Join HayaCare'**
  String get joinHayaCare;

  /// No description provided for @patientRegisterSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Enter your details to start your health journey'**
  String get patientRegisterSubtitle;

  /// No description provided for @doctorRegisterSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Enter your details and upload professional credentials'**
  String get doctorRegisterSubtitle;

  /// No description provided for @patient.
  ///
  /// In en, this message translates to:
  /// **'Patient'**
  String get patient;

  /// No description provided for @doctor.
  ///
  /// In en, this message translates to:
  /// **'Doctor'**
  String get doctor;

  /// No description provided for @fullNameNewHint.
  ///
  /// In en, this message translates to:
  /// **'Full name as shown in ID'**
  String get fullNameNewHint;

  /// No description provided for @phoneNewHint.
  ///
  /// In en, this message translates to:
  /// **'+966 5X XXX XXXX'**
  String get phoneNewHint;

  /// No description provided for @emailNewHint.
  ///
  /// In en, this message translates to:
  /// **'name@example.com'**
  String get emailNewHint;

  /// No description provided for @passwordNewHint.
  ///
  /// In en, this message translates to:
  /// **'8 chars, number & uppercase'**
  String get passwordNewHint;

  /// No description provided for @confirmPasswordNewHint.
  ///
  /// In en, this message translates to:
  /// **'Re-enter your password'**
  String get confirmPasswordNewHint;

  /// No description provided for @medicalSpecialty.
  ///
  /// In en, this message translates to:
  /// **'Medical Specialty'**
  String get medicalSpecialty;

  /// No description provided for @medicalSpecialtyHint.
  ///
  /// In en, this message translates to:
  /// **'Type your medical specialty'**
  String get medicalSpecialtyHint;

  /// No description provided for @medicalLicenseNumber.
  ///
  /// In en, this message translates to:
  /// **'Medical License No. (Optional)'**
  String get medicalLicenseNumber;

  /// No description provided for @medicalLicenseHint.
  ///
  /// In en, this message translates to:
  /// **'SCFHS-00000'**
  String get medicalLicenseHint;

  /// No description provided for @experienceYearsNewHint.
  ///
  /// In en, this message translates to:
  /// **'e.g. 8'**
  String get experienceYearsNewHint;

  /// No description provided for @workplaceHospital.
  ///
  /// In en, this message translates to:
  /// **'Clinic or Hospital Name (Optional)'**
  String get workplaceHospital;

  /// No description provided for @workplaceHospitalHint.
  ///
  /// In en, this message translates to:
  /// **'Workplace name'**
  String get workplaceHospitalHint;

  /// No description provided for @medicalLicenseFile.
  ///
  /// In en, this message translates to:
  /// **'Medical License (Optional)'**
  String get medicalLicenseFile;

  /// No description provided for @qualificationFile.
  ///
  /// In en, this message translates to:
  /// **'Qualification Certificate (Optional)'**
  String get qualificationFile;

  /// No description provided for @fileFormatHint.
  ///
  /// In en, this message translates to:
  /// **'PDF or JPG max 5MB'**
  String get fileFormatHint;

  /// No description provided for @chooseFile.
  ///
  /// In en, this message translates to:
  /// **'Choose File'**
  String get chooseFile;

  /// No description provided for @submitDoctorRegistration.
  ///
  /// In en, this message translates to:
  /// **'Submit Registration'**
  String get submitDoctorRegistration;

  /// No description provided for @dataEncryptedNew.
  ///
  /// In en, this message translates to:
  /// **'Your health data is securely encrypted'**
  String get dataEncryptedNew;

  /// No description provided for @welcomeBack.
  ///
  /// In en, this message translates to:
  /// **'Welcome back - Log in to access your health dashboard and track checkups'**
  String get welcomeBack;

  /// No description provided for @welcomeBackTitle.
  ///
  /// In en, this message translates to:
  /// **'Welcome back'**
  String get welcomeBackTitle;

  /// No description provided for @welcomeBackSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Log in to track your health and care.'**
  String get welcomeBackSubtitle;

  /// No description provided for @createAccountShort.
  ///
  /// In en, this message translates to:
  /// **'Create account'**
  String get createAccountShort;

  /// No description provided for @email.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get email;

  /// No description provided for @emailHint.
  ///
  /// In en, this message translates to:
  /// **'ahmed@example.com'**
  String get emailHint;

  /// No description provided for @password.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get password;

  /// No description provided for @rememberMe.
  ///
  /// In en, this message translates to:
  /// **'Remember me on this device'**
  String get rememberMe;

  /// No description provided for @forgotPassword.
  ///
  /// In en, this message translates to:
  /// **'Forgot Password?'**
  String get forgotPassword;

  /// No description provided for @login.
  ///
  /// In en, this message translates to:
  /// **'Login'**
  String get login;

  /// No description provided for @signInWithGoogle.
  ///
  /// In en, this message translates to:
  /// **'Sign in with Google'**
  String get signInWithGoogle;

  /// No description provided for @orDivider.
  ///
  /// In en, this message translates to:
  /// **'OR'**
  String get orDivider;

  /// No description provided for @dontHaveAccount.
  ///
  /// In en, this message translates to:
  /// **'Don\'t have an account?'**
  String get dontHaveAccount;

  /// No description provided for @registerNow.
  ///
  /// In en, this message translates to:
  /// **'Create new account'**
  String get registerNow;

  /// No description provided for @dataEncryptedFooter.
  ///
  /// In en, this message translates to:
  /// **'Your medical data is encrypted and protected under health security standards'**
  String get dataEncryptedFooter;

  /// No description provided for @createAccount.
  ///
  /// In en, this message translates to:
  /// **'Create New Account'**
  String get createAccount;

  /// No description provided for @registerSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Join the HayaCare family and track your health and your loved ones with precision and confidence.'**
  String get registerSubtitle;

  /// No description provided for @patientAccount.
  ///
  /// In en, this message translates to:
  /// **'Patient Account'**
  String get patientAccount;

  /// No description provided for @doctorAccount.
  ///
  /// In en, this message translates to:
  /// **'Doctor Account'**
  String get doctorAccount;

  /// No description provided for @fullName.
  ///
  /// In en, this message translates to:
  /// **'Full Name'**
  String get fullName;

  /// No description provided for @fullNameHint.
  ///
  /// In en, this message translates to:
  /// **'Ahmed Mahmoud'**
  String get fullNameHint;

  /// No description provided for @doctorNameHint.
  ///
  /// In en, this message translates to:
  /// **'Dr. Mona El Sayed'**
  String get doctorNameHint;

  /// No description provided for @required.
  ///
  /// In en, this message translates to:
  /// **'Required'**
  String get required;

  /// No description provided for @optional.
  ///
  /// In en, this message translates to:
  /// **'Optional'**
  String get optional;

  /// No description provided for @phoneNumber.
  ///
  /// In en, this message translates to:
  /// **'Mobile Phone Number'**
  String get phoneNumber;

  /// No description provided for @phoneHint.
  ///
  /// In en, this message translates to:
  /// **'0100 000 0100'**
  String get phoneHint;

  /// No description provided for @confirmPassword.
  ///
  /// In en, this message translates to:
  /// **'Confirm Password'**
  String get confirmPassword;

  /// No description provided for @passwordHint.
  ///
  /// In en, this message translates to:
  /// **'At least 8 characters, symbol & number'**
  String get passwordHint;

  /// No description provided for @confirmPasswordHint.
  ///
  /// In en, this message translates to:
  /// **'Re-enter password'**
  String get confirmPasswordHint;

  /// No description provided for @doctorInfoBannerTitle.
  ///
  /// In en, this message translates to:
  /// **'Doctor Information (Egypt)'**
  String get doctorInfoBannerTitle;

  /// No description provided for @doctorInfoBannerSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Accreditation by Egyptian Medical Syndicate & hospital linking'**
  String get doctorInfoBannerSubtitle;

  /// No description provided for @specialty.
  ///
  /// In en, this message translates to:
  /// **'Specialty'**
  String get specialty;

  /// No description provided for @specialtyHint.
  ///
  /// In en, this message translates to:
  /// **'Internal Medicine & Diabetes'**
  String get specialtyHint;

  /// No description provided for @experienceYears.
  ///
  /// In en, this message translates to:
  /// **'Years of Experience (Optional)'**
  String get experienceYears;

  /// No description provided for @experienceYearsHint.
  ///
  /// In en, this message translates to:
  /// **'12'**
  String get experienceYearsHint;

  /// No description provided for @clinicOrHospital.
  ///
  /// In en, this message translates to:
  /// **'Clinic or Hospital (Optional)'**
  String get clinicOrHospital;

  /// No description provided for @clinicHint.
  ///
  /// In en, this message translates to:
  /// **'Nile Specialized Hospital'**
  String get clinicHint;

  /// No description provided for @agreeToTerms.
  ///
  /// In en, this message translates to:
  /// **'I agree to Terms & Conditions and Privacy Policy for Medical Data certified for healthcare.'**
  String get agreeToTerms;

  /// No description provided for @alreadyHaveAccount.
  ///
  /// In en, this message translates to:
  /// **'Already have an account?'**
  String get alreadyHaveAccount;

  /// No description provided for @passwordRecoveryHeader.
  ///
  /// In en, this message translates to:
  /// **'Recover Password'**
  String get passwordRecoveryHeader;

  /// No description provided for @passwordRecoveryTitle.
  ///
  /// In en, this message translates to:
  /// **'Recover Password'**
  String get passwordRecoveryTitle;

  /// No description provided for @passwordRecoverySubtitle.
  ///
  /// In en, this message translates to:
  /// **'Enter your email and we will send you a secure reset link.'**
  String get passwordRecoverySubtitle;

  /// No description provided for @sendResetLink.
  ///
  /// In en, this message translates to:
  /// **'Send Reset Link'**
  String get sendResetLink;

  /// No description provided for @backToLogin.
  ///
  /// In en, this message translates to:
  /// **'Back to Login'**
  String get backToLogin;

  /// No description provided for @emailVerificationTitle.
  ///
  /// In en, this message translates to:
  /// **'Check Your Email'**
  String get emailVerificationTitle;

  /// No description provided for @emailVerificationSubtitle.
  ///
  /// In en, this message translates to:
  /// **'A password reset link has been sent to your email address.'**
  String get emailVerificationSubtitle;

  /// No description provided for @openEmailApp.
  ///
  /// In en, this message translates to:
  /// **'Open Email App'**
  String get openEmailApp;

  /// No description provided for @continueButton.
  ///
  /// In en, this message translates to:
  /// **'Continue'**
  String get continueButton;

  /// No description provided for @setNewPasswordHeader.
  ///
  /// In en, this message translates to:
  /// **'New Password'**
  String get setNewPasswordHeader;

  /// No description provided for @setNewPasswordTitle.
  ///
  /// In en, this message translates to:
  /// **'New Password'**
  String get setNewPasswordTitle;

  /// No description provided for @setNewPasswordSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Choose a strong password to protect your account.'**
  String get setNewPasswordSubtitle;

  /// No description provided for @resetLinkVerified.
  ///
  /// In en, this message translates to:
  /// **'Reset link verified'**
  String get resetLinkVerified;

  /// No description provided for @newPassword.
  ///
  /// In en, this message translates to:
  /// **'New Password'**
  String get newPassword;

  /// No description provided for @updatePasswordButton.
  ///
  /// In en, this message translates to:
  /// **'Update Password'**
  String get updatePasswordButton;

  /// No description provided for @ruleMinChars.
  ///
  /// In en, this message translates to:
  /// **'At least 8 characters'**
  String get ruleMinChars;

  /// No description provided for @ruleContainNumber.
  ///
  /// In en, this message translates to:
  /// **'Contains at least one number (0-9)'**
  String get ruleContainNumber;

  /// No description provided for @ruleContainSymbol.
  ///
  /// In en, this message translates to:
  /// **'At least one special symbol (! @ # \$ %)'**
  String get ruleContainSymbol;

  /// No description provided for @save.
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get save;

  /// No description provided for @homeNav.
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get homeNav;

  /// No description provided for @vitalsNav.
  ///
  /// In en, this message translates to:
  /// **'Vitals'**
  String get vitalsNav;

  /// No description provided for @medicationsNav.
  ///
  /// In en, this message translates to:
  /// **'Medications'**
  String get medicationsNav;

  /// No description provided for @reportsNav.
  ///
  /// In en, this message translates to:
  /// **'Reports'**
  String get reportsNav;

  /// No description provided for @profileNav.
  ///
  /// In en, this message translates to:
  /// **'Profile'**
  String get profileNav;

  /// No description provided for @goodMorning.
  ///
  /// In en, this message translates to:
  /// **'Good morning'**
  String get goodMorning;

  /// No description provided for @defaultUserName.
  ///
  /// In en, this message translates to:
  /// **'Sarah Abdullah'**
  String get defaultUserName;

  /// No description provided for @defaultUserInitials.
  ///
  /// In en, this message translates to:
  /// **'SA'**
  String get defaultUserInitials;

  /// No description provided for @healthScoreToday.
  ///
  /// In en, this message translates to:
  /// **'Health Score Today'**
  String get healthScoreToday;

  /// No description provided for @healthScoreStable.
  ///
  /// In en, this message translates to:
  /// **'Your indicators are stable, keep up your routine.'**
  String get healthScoreStable;

  /// No description provided for @todayVitals.
  ///
  /// In en, this message translates to:
  /// **'Today\'s Indicators'**
  String get todayVitals;

  /// No description provided for @viewAll.
  ///
  /// In en, this message translates to:
  /// **'View All'**
  String get viewAll;

  /// No description provided for @normalStatus.
  ///
  /// In en, this message translates to:
  /// **'Normal'**
  String get normalStatus;

  /// No description provided for @bloodSugar.
  ///
  /// In en, this message translates to:
  /// **'Blood Sugar'**
  String get bloodSugar;

  /// No description provided for @bloodSugarUnit.
  ///
  /// In en, this message translates to:
  /// **'mg/dL'**
  String get bloodSugarUnit;

  /// No description provided for @bloodPressure.
  ///
  /// In en, this message translates to:
  /// **'Blood Pressure'**
  String get bloodPressure;

  /// No description provided for @bloodPressureUnit.
  ///
  /// In en, this message translates to:
  /// **'mmHg'**
  String get bloodPressureUnit;

  /// No description provided for @heartRate.
  ///
  /// In en, this message translates to:
  /// **'Heart Rate'**
  String get heartRate;

  /// No description provided for @heartRateUnit.
  ///
  /// In en, this message translates to:
  /// **'bpm'**
  String get heartRateUnit;

  /// No description provided for @weight.
  ///
  /// In en, this message translates to:
  /// **'Weight'**
  String get weight;

  /// No description provided for @weightUnit.
  ///
  /// In en, this message translates to:
  /// **'kg'**
  String get weightUnit;

  /// No description provided for @nextDoseTime.
  ///
  /// In en, this message translates to:
  /// **'Next dose • 9:00 AM'**
  String get nextDoseTime;

  /// No description provided for @nextDoseMedication.
  ///
  /// In en, this message translates to:
  /// **'Metformin 500 mg'**
  String get nextDoseMedication;

  /// No description provided for @nextDoseTiming.
  ///
  /// In en, this message translates to:
  /// **'After breakfast'**
  String get nextDoseTiming;

  /// No description provided for @confirmDose.
  ///
  /// In en, this message translates to:
  /// **'Confirm Dose Intake'**
  String get confirmDose;

  /// No description provided for @doctorExtraDetailsTitle.
  ///
  /// In en, this message translates to:
  /// **'Doctor Professional Details'**
  String get doctorExtraDetailsTitle;

  /// No description provided for @doctorExtraDetailsSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Specialty, experience & credentials'**
  String get doctorExtraDetailsSubtitle;

  /// No description provided for @doctorDashboardNav.
  ///
  /// In en, this message translates to:
  /// **'Dashboard'**
  String get doctorDashboardNav;

  /// No description provided for @doctorPatientsNav.
  ///
  /// In en, this message translates to:
  /// **'Patients'**
  String get doctorPatientsNav;

  /// No description provided for @doctorAppointmentsNav.
  ///
  /// In en, this message translates to:
  /// **'Appointments'**
  String get doctorAppointmentsNav;

  /// No description provided for @doctorProfileNav.
  ///
  /// In en, this message translates to:
  /// **'Profile'**
  String get doctorProfileNav;

  /// No description provided for @adminDashboardNav.
  ///
  /// In en, this message translates to:
  /// **'Overview'**
  String get adminDashboardNav;

  /// No description provided for @adminUsersNav.
  ///
  /// In en, this message translates to:
  /// **'Users'**
  String get adminUsersNav;

  /// No description provided for @adminApprovalsNav.
  ///
  /// In en, this message translates to:
  /// **'Approvals'**
  String get adminApprovalsNav;

  /// No description provided for @adminSettingsNav.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get adminSettingsNav;

  /// No description provided for @comingSoon.
  ///
  /// In en, this message translates to:
  /// **'Coming soon'**
  String get comingSoon;

  /// No description provided for @welcomeUser.
  ///
  /// In en, this message translates to:
  /// **'Welcome, {name}'**
  String welcomeUser(String name);

  /// No description provided for @welcomeTagline.
  ///
  /// In en, this message translates to:
  /// **'Your health matters.. let\'s care for it together'**
  String get welcomeTagline;

  /// No description provided for @healthSummaryTitle.
  ///
  /// In en, this message translates to:
  /// **'Health Summary'**
  String get healthSummaryTitle;

  /// No description provided for @latestRecordedReadings.
  ///
  /// In en, this message translates to:
  /// **'Latest recorded readings'**
  String get latestRecordedReadings;

  /// No description provided for @lastReadingTwoHours.
  ///
  /// In en, this message translates to:
  /// **'Last reading · 2 hours ago'**
  String get lastReadingTwoHours;

  /// No description provided for @lastReadingFourHours.
  ///
  /// In en, this message translates to:
  /// **'Last reading · 4 hours ago'**
  String get lastReadingFourHours;

  /// No description provided for @lastReadingMorning.
  ///
  /// In en, this message translates to:
  /// **'Last reading · Today, 7:20 AM'**
  String get lastReadingMorning;

  /// No description provided for @lastReadingTodayTime.
  ///
  /// In en, this message translates to:
  /// **'Last reading · Today, 8:35 AM'**
  String get lastReadingTodayTime;

  /// No description provided for @healthIndicatorsTitle.
  ///
  /// In en, this message translates to:
  /// **'Health Indicators'**
  String get healthIndicatorsTitle;

  /// No description provided for @trackReadingsOverTime.
  ///
  /// In en, this message translates to:
  /// **'Track readings over time'**
  String get trackReadingsOverTime;

  /// No description provided for @details.
  ///
  /// In en, this message translates to:
  /// **'Details'**
  String get details;

  /// No description provided for @week.
  ///
  /// In en, this message translates to:
  /// **'Week'**
  String get week;

  /// No description provided for @month.
  ///
  /// In en, this message translates to:
  /// **'Month'**
  String get month;

  /// No description provided for @threeMonths.
  ///
  /// In en, this message translates to:
  /// **'3 Months'**
  String get threeMonths;

  /// No description provided for @chartDisclaimer.
  ///
  /// In en, this message translates to:
  /// **'Displayed readings are for demo purposes and not medical diagnosis.'**
  String get chartDisclaimer;

  /// No description provided for @sat.
  ///
  /// In en, this message translates to:
  /// **'Sat'**
  String get sat;

  /// No description provided for @sun.
  ///
  /// In en, this message translates to:
  /// **'Sun'**
  String get sun;

  /// No description provided for @mon.
  ///
  /// In en, this message translates to:
  /// **'Mon'**
  String get mon;

  /// No description provided for @tue.
  ///
  /// In en, this message translates to:
  /// **'Tue'**
  String get tue;

  /// No description provided for @wed.
  ///
  /// In en, this message translates to:
  /// **'Wed'**
  String get wed;

  /// No description provided for @thu.
  ///
  /// In en, this message translates to:
  /// **'Thu'**
  String get thu;

  /// No description provided for @fri.
  ///
  /// In en, this message translates to:
  /// **'Fri'**
  String get fri;

  /// No description provided for @nextAppointmentTitle.
  ///
  /// In en, this message translates to:
  /// **'Next Appointment'**
  String get nextAppointmentTitle;

  /// No description provided for @nextConsultation.
  ///
  /// In en, this message translates to:
  /// **'Next medical consultation'**
  String get nextConsultation;

  /// No description provided for @familyMedicine.
  ///
  /// In en, this message translates to:
  /// **'Family Medicine'**
  String get familyMedicine;

  /// No description provided for @demoDoctorName.
  ///
  /// In en, this message translates to:
  /// **'Dr. Samer Al-Harbi'**
  String get demoDoctorName;

  /// No description provided for @demoAppointmentTime.
  ///
  /// In en, this message translates to:
  /// **'Sunday, May 18 · 10:30 AM'**
  String get demoAppointmentTime;

  /// No description provided for @viewDetails.
  ///
  /// In en, this message translates to:
  /// **'View Details'**
  String get viewDetails;

  /// No description provided for @quickAccessTitle.
  ///
  /// In en, this message translates to:
  /// **'Quick Access'**
  String get quickAccessTitle;

  /// No description provided for @quickAccessSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Everything you need in one place'**
  String get quickAccessSubtitle;

  /// No description provided for @medicationsSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Reminders & dose tracking'**
  String get medicationsSubtitle;

  /// No description provided for @medicalReportsTitle.
  ///
  /// In en, this message translates to:
  /// **'Medical Reports'**
  String get medicalReportsTitle;

  /// No description provided for @medicalReportsSubtitle.
  ///
  /// In en, this message translates to:
  /// **'View and export reports'**
  String get medicalReportsSubtitle;

  /// No description provided for @notificationsTitle.
  ///
  /// In en, this message translates to:
  /// **'Notifications'**
  String get notificationsTitle;

  /// No description provided for @notificationsSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Latest updates and reminders'**
  String get notificationsSubtitle;

  /// No description provided for @notifMedTitle.
  ///
  /// In en, this message translates to:
  /// **'Time for your medication'**
  String get notifMedTitle;

  /// No description provided for @notifMedBody.
  ///
  /// In en, this message translates to:
  /// **'Metformin 500 mg · After breakfast'**
  String get notifMedBody;

  /// No description provided for @notifMedTime.
  ///
  /// In en, this message translates to:
  /// **'10 mins ago'**
  String get notifMedTime;

  /// No description provided for @notifBpTitle.
  ///
  /// In en, this message translates to:
  /// **'Blood pressure reminder'**
  String get notifBpTitle;

  /// No description provided for @notifBpBody.
  ///
  /// In en, this message translates to:
  /// **'You haven\'t logged blood pressure today.'**
  String get notifBpBody;

  /// No description provided for @notifBpTime.
  ///
  /// In en, this message translates to:
  /// **'1 hour ago'**
  String get notifBpTime;

  /// No description provided for @notifWeightTitle.
  ///
  /// In en, this message translates to:
  /// **'Weight logging time'**
  String get notifWeightTitle;

  /// No description provided for @notifWeightBody.
  ///
  /// In en, this message translates to:
  /// **'Log your weekly weight to track changes.'**
  String get notifWeightBody;

  /// No description provided for @notifWeightTime.
  ///
  /// In en, this message translates to:
  /// **'2 hours ago'**
  String get notifWeightTime;

  /// No description provided for @notifHrTitle.
  ///
  /// In en, this message translates to:
  /// **'Heart rate tracking'**
  String get notifHrTitle;

  /// No description provided for @notifHrBody.
  ///
  /// In en, this message translates to:
  /// **'You can add a resting heart rate reading.'**
  String get notifHrBody;

  /// No description provided for @notifHrTime.
  ///
  /// In en, this message translates to:
  /// **'3 hours ago'**
  String get notifHrTime;

  /// No description provided for @notifMsgTitle.
  ///
  /// In en, this message translates to:
  /// **'New message from Dr. Samer'**
  String get notifMsgTitle;

  /// No description provided for @notifMsgBody.
  ///
  /// In en, this message translates to:
  /// **'I reviewed your latest readings...'**
  String get notifMsgBody;

  /// No description provided for @notifMsgTime.
  ///
  /// In en, this message translates to:
  /// **'Yesterday'**
  String get notifMsgTime;

  /// No description provided for @notifApptTitle.
  ///
  /// In en, this message translates to:
  /// **'Your appointment is confirmed'**
  String get notifApptTitle;

  /// No description provided for @notifApptBody.
  ///
  /// In en, this message translates to:
  /// **'Sunday, May 18 · 10:30 AM'**
  String get notifApptBody;

  /// No description provided for @notifApptTime.
  ///
  /// In en, this message translates to:
  /// **'Yesterday'**
  String get notifApptTime;

  /// No description provided for @readingsHistorySubtitle.
  ///
  /// In en, this message translates to:
  /// **'Your health measurements history'**
  String get readingsHistorySubtitle;

  /// No description provided for @readingsCount.
  ///
  /// In en, this message translates to:
  /// **'{count} readings'**
  String readingsCount(int count);

  /// No description provided for @last7Days.
  ///
  /// In en, this message translates to:
  /// **'Last 7 days'**
  String get last7Days;

  /// No description provided for @last30Days.
  ///
  /// In en, this message translates to:
  /// **'Last 30 days'**
  String get last30Days;

  /// No description provided for @allReadings.
  ///
  /// In en, this message translates to:
  /// **'All readings'**
  String get allReadings;

  /// No description provided for @followUpStatus.
  ///
  /// In en, this message translates to:
  /// **'Follow up'**
  String get followUpStatus;

  /// No description provided for @stableStatus.
  ///
  /// In en, this message translates to:
  /// **'Stable'**
  String get stableStatus;

  /// No description provided for @addReading.
  ///
  /// In en, this message translates to:
  /// **'Add Reading'**
  String get addReading;

  /// No description provided for @addReadingTitle.
  ///
  /// In en, this message translates to:
  /// **'Add New Reading'**
  String get addReadingTitle;

  /// No description provided for @readingValueLabel.
  ///
  /// In en, this message translates to:
  /// **'Reading Value'**
  String get readingValueLabel;

  /// No description provided for @readingNoteLabel.
  ///
  /// In en, this message translates to:
  /// **'Note (optional)'**
  String get readingNoteLabel;

  /// No description provided for @saveReading.
  ///
  /// In en, this message translates to:
  /// **'Save Reading'**
  String get saveReading;

  /// No description provided for @todayTime830.
  ///
  /// In en, this message translates to:
  /// **'Today, 8:30 AM'**
  String get todayTime830;

  /// No description provided for @yesterdayTime915.
  ///
  /// In en, this message translates to:
  /// **'Yesterday, 9:15 PM'**
  String get yesterdayTime915;

  /// No description provided for @may14Time745.
  ///
  /// In en, this message translates to:
  /// **'May 14, 7:45 AM'**
  String get may14Time745;

  /// No description provided for @pulseNote72.
  ///
  /// In en, this message translates to:
  /// **'Pulse 72'**
  String get pulseNote72;

  /// No description provided for @pulseNote76.
  ///
  /// In en, this message translates to:
  /// **'Pulse 76'**
  String get pulseNote76;

  /// No description provided for @pulseNote70.
  ///
  /// In en, this message translates to:
  /// **'Pulse 70'**
  String get pulseNote70;

  /// No description provided for @todayTime730.
  ///
  /// In en, this message translates to:
  /// **'Today, 7:30 AM'**
  String get todayTime730;

  /// No description provided for @yesterdayTime320.
  ///
  /// In en, this message translates to:
  /// **'Yesterday, 3:20 PM'**
  String get yesterdayTime320;

  /// No description provided for @may14Time800.
  ///
  /// In en, this message translates to:
  /// **'May 14, 8:00 AM'**
  String get may14Time800;

  /// No description provided for @beforeBreakfast.
  ///
  /// In en, this message translates to:
  /// **'Before Breakfast'**
  String get beforeBreakfast;

  /// No description provided for @afterLunch.
  ///
  /// In en, this message translates to:
  /// **'After Lunch'**
  String get afterLunch;

  /// No description provided for @fasting.
  ///
  /// In en, this message translates to:
  /// **'Fasting'**
  String get fasting;

  /// No description provided for @todayTime720.
  ///
  /// In en, this message translates to:
  /// **'Today, 7:20 AM'**
  String get todayTime720;

  /// No description provided for @may12Time730.
  ///
  /// In en, this message translates to:
  /// **'May 12, 7:30 AM'**
  String get may12Time730;

  /// No description provided for @may5Time715.
  ///
  /// In en, this message translates to:
  /// **'May 5, 7:15 AM'**
  String get may5Time715;

  /// No description provided for @morningNote.
  ///
  /// In en, this message translates to:
  /// **'Morning'**
  String get morningNote;

  /// No description provided for @todayTime835.
  ///
  /// In en, this message translates to:
  /// **'Today, 8:35 AM'**
  String get todayTime835;

  /// No description provided for @yesterdayTime610.
  ///
  /// In en, this message translates to:
  /// **'Yesterday, 6:10 PM'**
  String get yesterdayTime610;

  /// No description provided for @may14Time900.
  ///
  /// In en, this message translates to:
  /// **'May 14, 9:00 AM'**
  String get may14Time900;

  /// No description provided for @restingTime.
  ///
  /// In en, this message translates to:
  /// **'Resting'**
  String get restingTime;

  /// No description provided for @afterWalking.
  ///
  /// In en, this message translates to:
  /// **'After walking'**
  String get afterWalking;

  /// No description provided for @justNow.
  ///
  /// In en, this message translates to:
  /// **'Just now'**
  String get justNow;

  /// No description provided for @fieldRequired.
  ///
  /// In en, this message translates to:
  /// **'This field is required'**
  String get fieldRequired;

  /// No description provided for @addMeasurementTitle.
  ///
  /// In en, this message translates to:
  /// **'Add Measurement'**
  String get addMeasurementTitle;

  /// No description provided for @addMeasurementSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Log a new health reading'**
  String get addMeasurementSubtitle;

  /// No description provided for @systolicLabel.
  ///
  /// In en, this message translates to:
  /// **'Systolic'**
  String get systolicLabel;

  /// No description provided for @diastolicLabel.
  ///
  /// In en, this message translates to:
  /// **'Diastolic'**
  String get diastolicLabel;

  /// No description provided for @pulseLabel.
  ///
  /// In en, this message translates to:
  /// **'Pulse'**
  String get pulseLabel;

  /// No description provided for @sugarValueLabel.
  ///
  /// In en, this message translates to:
  /// **'Blood Sugar'**
  String get sugarValueLabel;

  /// No description provided for @measurementContextLabel.
  ///
  /// In en, this message translates to:
  /// **'Measurement Context'**
  String get measurementContextLabel;

  /// No description provided for @measurementTimeLabel.
  ///
  /// In en, this message translates to:
  /// **'Measurement Time'**
  String get measurementTimeLabel;

  /// No description provided for @measurementStateLabel.
  ///
  /// In en, this message translates to:
  /// **'Measurement Condition'**
  String get measurementStateLabel;

  /// No description provided for @dateLabel.
  ///
  /// In en, this message translates to:
  /// **'Date'**
  String get dateLabel;

  /// No description provided for @timeLabel.
  ///
  /// In en, this message translates to:
  /// **'Time'**
  String get timeLabel;

  /// No description provided for @notesLabel.
  ///
  /// In en, this message translates to:
  /// **'Notes'**
  String get notesLabel;

  /// No description provided for @optionalLabel.
  ///
  /// In en, this message translates to:
  /// **'Optional'**
  String get optionalLabel;

  /// No description provided for @notesHint.
  ///
  /// In en, this message translates to:
  /// **'Add any note related to this reading'**
  String get notesHint;

  /// No description provided for @medicalDisclaimer.
  ///
  /// In en, this message translates to:
  /// **'This data is for tracking only and does not replace medical advice or diagnosis.'**
  String get medicalDisclaimer;

  /// No description provided for @readingAddedSuccess.
  ///
  /// In en, this message translates to:
  /// **'Reading added successfully'**
  String get readingAddedSuccess;

  /// No description provided for @readingAddedSubtitle.
  ///
  /// In en, this message translates to:
  /// **'The new reading will appear in your health record and analytics.'**
  String get readingAddedSubtitle;

  /// No description provided for @eveningNote.
  ///
  /// In en, this message translates to:
  /// **'Evening'**
  String get eveningNote;

  /// No description provided for @afterExercise.
  ///
  /// In en, this message translates to:
  /// **'After exercise'**
  String get afterExercise;

  /// No description provided for @beforeSleep.
  ///
  /// In en, this message translates to:
  /// **'Before sleep'**
  String get beforeSleep;

  /// No description provided for @noReadingsTitle.
  ///
  /// In en, this message translates to:
  /// **'No readings yet'**
  String get noReadingsTitle;

  /// No description provided for @noReadingsSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Add your first reading to start tracking your health.'**
  String get noReadingsSubtitle;

  /// No description provided for @healthAnalyticsTitle.
  ///
  /// In en, this message translates to:
  /// **'Health Analytics'**
  String get healthAnalyticsTitle;

  /// No description provided for @healthAnalyticsSubtitle.
  ///
  /// In en, this message translates to:
  /// **'A detailed look at your indicators'**
  String get healthAnalyticsSubtitle;

  /// No description provided for @daily.
  ///
  /// In en, this message translates to:
  /// **'Daily'**
  String get daily;

  /// No description provided for @weekly.
  ///
  /// In en, this message translates to:
  /// **'Weekly'**
  String get weekly;

  /// No description provided for @monthly.
  ///
  /// In en, this message translates to:
  /// **'Monthly'**
  String get monthly;

  /// No description provided for @systolicAndDiastolic.
  ///
  /// In en, this message translates to:
  /// **'Systolic & Diastolic'**
  String get systolicAndDiastolic;

  /// No description provided for @mgPerDlFull.
  ///
  /// In en, this message translates to:
  /// **'mg per deciliter'**
  String get mgPerDlFull;

  /// No description provided for @kilogramsFull.
  ///
  /// In en, this message translates to:
  /// **'Kilograms'**
  String get kilogramsFull;

  /// No description provided for @beatsPerMinuteFull.
  ///
  /// In en, this message translates to:
  /// **'Beats per minute'**
  String get beatsPerMinuteFull;

  /// No description provided for @averageLabel.
  ///
  /// In en, this message translates to:
  /// **'Average'**
  String get averageLabel;

  /// No description provided for @minLabel.
  ///
  /// In en, this message translates to:
  /// **'Min'**
  String get minLabel;

  /// No description provided for @maxLabel.
  ///
  /// In en, this message translates to:
  /// **'Max'**
  String get maxLabel;

  /// No description provided for @readingsLogTitle.
  ///
  /// In en, this message translates to:
  /// **'Readings Log'**
  String get readingsLogTitle;

  /// No description provided for @analyticsDisclaimer.
  ///
  /// In en, this message translates to:
  /// **'Elevated indicators help prioritize follow-up and do not represent an automatic diagnosis.'**
  String get analyticsDisclaimer;

  /// No description provided for @exitAppTitle.
  ///
  /// In en, this message translates to:
  /// **'Exit App'**
  String get exitAppTitle;

  /// No description provided for @exitAppMessage.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to exit HayaCare?'**
  String get exitAppMessage;

  /// No description provided for @stayButton.
  ///
  /// In en, this message translates to:
  /// **'Stay'**
  String get stayButton;

  /// No description provided for @exitButton.
  ///
  /// In en, this message translates to:
  /// **'Exit'**
  String get exitButton;

  /// No description provided for @doctorNav.
  ///
  /// In en, this message translates to:
  /// **'Doctor'**
  String get doctorNav;

  /// No description provided for @doctorsTitle.
  ///
  /// In en, this message translates to:
  /// **'Doctors'**
  String get doctorsTitle;

  /// No description provided for @doctorsSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Connect with your doctor with confidence'**
  String get doctorsSubtitle;

  /// No description provided for @doctorsSearchHint.
  ///
  /// In en, this message translates to:
  /// **'Search by name or specialty'**
  String get doctorsSearchHint;

  /// No description provided for @filterAll.
  ///
  /// In en, this message translates to:
  /// **'All'**
  String get filterAll;

  /// No description provided for @filterFamilyMedicine.
  ///
  /// In en, this message translates to:
  /// **'Family Medicine'**
  String get filterFamilyMedicine;

  /// No description provided for @filterDiabetes.
  ///
  /// In en, this message translates to:
  /// **'Diabetes'**
  String get filterDiabetes;

  /// No description provided for @filterCardiology.
  ///
  /// In en, this message translates to:
  /// **'Cardiology'**
  String get filterCardiology;

  /// No description provided for @yearsExpSuffix.
  ///
  /// In en, this message translates to:
  /// **'yrs exp'**
  String get yearsExpSuffix;

  /// No description provided for @yearsExpShort.
  ///
  /// In en, this message translates to:
  /// **'Years Exp.'**
  String get yearsExpShort;

  /// No description provided for @ratingLabel.
  ///
  /// In en, this message translates to:
  /// **'Rating'**
  String get ratingLabel;

  /// No description provided for @patientsLabel.
  ///
  /// In en, this message translates to:
  /// **'Patients'**
  String get patientsLabel;

  /// No description provided for @doctorProfileTitle.
  ///
  /// In en, this message translates to:
  /// **'Doctor Profile'**
  String get doctorProfileTitle;

  /// No description provided for @aboutDoctorTitle.
  ///
  /// In en, this message translates to:
  /// **'About Doctor'**
  String get aboutDoctorTitle;

  /// No description provided for @availabilityTitle.
  ///
  /// In en, this message translates to:
  /// **'Availability'**
  String get availabilityTitle;

  /// No description provided for @requestFollowUp.
  ///
  /// In en, this message translates to:
  /// **'Request Follow-up'**
  String get requestFollowUp;

  /// No description provided for @sendMessage.
  ///
  /// In en, this message translates to:
  /// **'Send Message'**
  String get sendMessage;

  /// No description provided for @followUpRequestedMsg.
  ///
  /// In en, this message translates to:
  /// **'Follow-up request sent to {name}'**
  String followUpRequestedMsg(String name);

  /// No description provided for @messageActionMsg.
  ///
  /// In en, this message translates to:
  /// **'Starting conversation with {name}'**
  String messageActionMsg(String name);

  /// No description provided for @noDoctorsFound.
  ///
  /// In en, this message translates to:
  /// **'No matching doctors found'**
  String get noDoctorsFound;

  /// No description provided for @noDoctorsFoundSub.
  ///
  /// In en, this message translates to:
  /// **'Try changing the search term or specialty filter.'**
  String get noDoctorsFoundSub;

  /// No description provided for @docSamerName.
  ///
  /// In en, this message translates to:
  /// **'Dr. Samer Al-Harbi'**
  String get docSamerName;

  /// No description provided for @docSamerSpecialty.
  ///
  /// In en, this message translates to:
  /// **'Family Medicine'**
  String get docSamerSpecialty;

  /// No description provided for @docSamerTitle.
  ///
  /// In en, this message translates to:
  /// **'Family Medicine Consultant'**
  String get docSamerTitle;

  /// No description provided for @docSamerAvailability.
  ///
  /// In en, this message translates to:
  /// **'Available today'**
  String get docSamerAvailability;

  /// No description provided for @docSamerBio.
  ///
  /// In en, this message translates to:
  /// **'Consultant specializing in comprehensive healthcare and chronic disease management, focused on building practical, tailored follow-up plans for every patient.'**
  String get docSamerBio;

  /// No description provided for @docLayanName.
  ///
  /// In en, this message translates to:
  /// **'Dr. Layan Al-Qahtani'**
  String get docLayanName;

  /// No description provided for @docLayanSpecialty.
  ///
  /// In en, this message translates to:
  /// **'Endocrinology & Diabetes'**
  String get docLayanSpecialty;

  /// No description provided for @docLayanTitle.
  ///
  /// In en, this message translates to:
  /// **'Diabetes & Endocrinology Consultant'**
  String get docLayanTitle;

  /// No description provided for @docLayanAvailability.
  ///
  /// In en, this message translates to:
  /// **'Available tomorrow'**
  String get docLayanAvailability;

  /// No description provided for @docLayanBio.
  ///
  /// In en, this message translates to:
  /// **'Specialist in diabetes care, dose regulation, and continuous glucose monitoring with personalized lifestyle coaching.'**
  String get docLayanBio;

  /// No description provided for @docFahadName.
  ///
  /// In en, this message translates to:
  /// **'Dr. Fahad Al-Otaibi'**
  String get docFahadName;

  /// No description provided for @docFahadSpecialty.
  ///
  /// In en, this message translates to:
  /// **'Cardiology & Vascular'**
  String get docFahadSpecialty;

  /// No description provided for @docFahadTitle.
  ///
  /// In en, this message translates to:
  /// **'Cardiology Consultant'**
  String get docFahadTitle;

  /// No description provided for @docFahadAvailability.
  ///
  /// In en, this message translates to:
  /// **'Available Thursday'**
  String get docFahadAvailability;

  /// No description provided for @docFahadBio.
  ///
  /// In en, this message translates to:
  /// **'Experienced cardiologist focused on hypertension management, preventive heart care, and long-term cardiovascular follow-up.'**
  String get docFahadBio;

  /// No description provided for @daySunday.
  ///
  /// In en, this message translates to:
  /// **'Sunday'**
  String get daySunday;

  /// No description provided for @dayTuesday.
  ///
  /// In en, this message translates to:
  /// **'Tuesday'**
  String get dayTuesday;

  /// No description provided for @dayMonday.
  ///
  /// In en, this message translates to:
  /// **'Monday'**
  String get dayMonday;

  /// No description provided for @dayWednesday.
  ///
  /// In en, this message translates to:
  /// **'Wednesday'**
  String get dayWednesday;

  /// No description provided for @dayThursday.
  ///
  /// In en, this message translates to:
  /// **'Thursday'**
  String get dayThursday;

  /// No description provided for @slot10to4.
  ///
  /// In en, this message translates to:
  /// **'10:00 AM - 4:00 PM'**
  String get slot10to4;

  /// No description provided for @slot12to6.
  ///
  /// In en, this message translates to:
  /// **'12:00 PM - 6:00 PM'**
  String get slot12to6;

  /// No description provided for @slot9to3.
  ///
  /// In en, this message translates to:
  /// **'9:00 AM - 3:00 PM'**
  String get slot9to3;

  /// No description provided for @onlineNow.
  ///
  /// In en, this message translates to:
  /// **'Online now'**
  String get onlineNow;

  /// No description provided for @chatToday.
  ///
  /// In en, this message translates to:
  /// **'Today'**
  String get chatToday;

  /// No description provided for @writeYourMessage.
  ///
  /// In en, this message translates to:
  /// **'Write your message...'**
  String get writeYourMessage;

  /// No description provided for @chatDemoDoctorMsg.
  ///
  /// In en, this message translates to:
  /// **'Hello, I reviewed your recent readings.'**
  String get chatDemoDoctorMsg;

  /// No description provided for @chatDemoPatientMsg.
  ///
  /// In en, this message translates to:
  /// **'Thanks doctor, are the readings within the normal range?'**
  String get chatDemoPatientMsg;

  /// No description provided for @chatDemoDoctorTime.
  ///
  /// In en, this message translates to:
  /// **'10:20 AM'**
  String get chatDemoDoctorTime;

  /// No description provided for @chatDemoPatientTime.
  ///
  /// In en, this message translates to:
  /// **'10:23 AM'**
  String get chatDemoPatientTime;

  /// No description provided for @chatDemoVitalTime.
  ///
  /// In en, this message translates to:
  /// **'Today, 8:30 AM'**
  String get chatDemoVitalTime;

  /// No description provided for @chatReadingValue.
  ///
  /// In en, this message translates to:
  /// **'128/82 mmHg'**
  String get chatReadingValue;

  /// No description provided for @chatJustNow.
  ///
  /// In en, this message translates to:
  /// **'Now'**
  String get chatJustNow;

  /// No description provided for @profileSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Your data and privacy settings'**
  String get profileSubtitle;

  /// No description provided for @profileDemoName.
  ///
  /// In en, this message translates to:
  /// **'Ahmed Khaled'**
  String get profileDemoName;

  /// No description provided for @profileDemoInitials.
  ///
  /// In en, this message translates to:
  /// **'AK'**
  String get profileDemoInitials;

  /// No description provided for @profileDemoEmail.
  ///
  /// In en, this message translates to:
  /// **'ahmad@hayacare.app'**
  String get profileDemoEmail;

  /// No description provided for @editPersonalInfo.
  ///
  /// In en, this message translates to:
  /// **'Edit Personal Info'**
  String get editPersonalInfo;

  /// No description provided for @medicalRecordTitle.
  ///
  /// In en, this message translates to:
  /// **'Medical Record'**
  String get medicalRecordTitle;

  /// No description provided for @medicalRecordSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Conditions, allergies, and medications'**
  String get medicalRecordSubtitle;

  /// No description provided for @profileMedicationsSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Doses and reminders'**
  String get profileMedicationsSubtitle;

  /// No description provided for @messagesTitle.
  ///
  /// In en, this message translates to:
  /// **'Messages'**
  String get messagesTitle;

  /// No description provided for @messagesSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Care team conversations'**
  String get messagesSubtitle;

  /// No description provided for @familyEmergencyTitle.
  ///
  /// In en, this message translates to:
  /// **'Family & Emergency'**
  String get familyEmergencyTitle;

  /// No description provided for @familyEmergencySubtitle.
  ///
  /// In en, this message translates to:
  /// **'Contacts and QR card'**
  String get familyEmergencySubtitle;

  /// No description provided for @healthTipsTitle.
  ///
  /// In en, this message translates to:
  /// **'Health Tips'**
  String get healthTipsTitle;

  /// No description provided for @healthTipsSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Educational info and daily habits'**
  String get healthTipsSubtitle;

  /// No description provided for @preferencesTitle.
  ///
  /// In en, this message translates to:
  /// **'Preferences'**
  String get preferencesTitle;

  /// No description provided for @languageTitle.
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get languageTitle;

  /// No description provided for @languageDirectionSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Interface language and text direction'**
  String get languageDirectionSubtitle;

  /// No description provided for @themeTitle.
  ///
  /// In en, this message translates to:
  /// **'Theme'**
  String get themeTitle;

  /// No description provided for @measurementUnitsTitle.
  ///
  /// In en, this message translates to:
  /// **'Measurement Units'**
  String get measurementUnitsTitle;

  /// No description provided for @measurementUnitsValue.
  ///
  /// In en, this message translates to:
  /// **'mmHg · mg/dL'**
  String get measurementUnitsValue;

  /// No description provided for @remindersTitle.
  ///
  /// In en, this message translates to:
  /// **'Reminders'**
  String get remindersTitle;

  /// No description provided for @remindersSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Medications, readings, and appointments'**
  String get remindersSubtitle;

  /// No description provided for @privacyAndControlTitle.
  ///
  /// In en, this message translates to:
  /// **'Privacy & Control'**
  String get privacyAndControlTitle;

  /// No description provided for @shareHealthDataTitle.
  ///
  /// In en, this message translates to:
  /// **'Share Health Data'**
  String get shareHealthDataTitle;

  /// No description provided for @shareHealthDataSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Allow authorized doctor to view your data'**
  String get shareHealthDataSubtitle;

  /// No description provided for @healthAssistantAccessTitle.
  ///
  /// In en, this message translates to:
  /// **'Health Assistant Access'**
  String get healthAssistantAccessTitle;

  /// No description provided for @healthAssistantAccessSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Allow assistant to use your data'**
  String get healthAssistantAccessSubtitle;

  /// No description provided for @privacyDefaultNote.
  ///
  /// In en, this message translates to:
  /// **'Both options are off by default, and you have full control'**
  String get privacyDefaultNote;

  /// No description provided for @signOut.
  ///
  /// In en, this message translates to:
  /// **'Sign Out'**
  String get signOut;

  /// No description provided for @medicalRecordPageSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Your essential health information'**
  String get medicalRecordPageSubtitle;

  /// No description provided for @healthConditionsTitle.
  ///
  /// In en, this message translates to:
  /// **'Health Conditions'**
  String get healthConditionsTitle;

  /// No description provided for @allergiesTitle.
  ///
  /// In en, this message translates to:
  /// **'Allergies'**
  String get allergiesTitle;

  /// No description provided for @currentMedicationsTitle.
  ///
  /// In en, this message translates to:
  /// **'Current Medications'**
  String get currentMedicationsTitle;

  /// No description provided for @emergencyContactTitle.
  ///
  /// In en, this message translates to:
  /// **'Emergency Contact'**
  String get emergencyContactTitle;

  /// No description provided for @editAction.
  ///
  /// In en, this message translates to:
  /// **'Edit'**
  String get editAction;

  /// No description provided for @manageAction.
  ///
  /// In en, this message translates to:
  /// **'Manage'**
  String get manageAction;

  /// No description provided for @conditionHypertension.
  ///
  /// In en, this message translates to:
  /// **'Hypertension'**
  String get conditionHypertension;

  /// No description provided for @conditionType2Diabetes.
  ///
  /// In en, this message translates to:
  /// **'Type 2 Diabetes'**
  String get conditionType2Diabetes;

  /// No description provided for @allergyPenicillin.
  ///
  /// In en, this message translates to:
  /// **'Penicillin Allergy'**
  String get allergyPenicillin;

  /// No description provided for @medMetformin500.
  ///
  /// In en, this message translates to:
  /// **'Metformin 500 mg'**
  String get medMetformin500;

  /// No description provided for @medAmlodipine5.
  ///
  /// In en, this message translates to:
  /// **'Amlodipine 5 mg'**
  String get medAmlodipine5;

  /// No description provided for @emergencyContactName.
  ///
  /// In en, this message translates to:
  /// **'Sara Ahmed'**
  String get emergencyContactName;

  /// No description provided for @emergencyContactRelation.
  ///
  /// In en, this message translates to:
  /// **'Spouse'**
  String get emergencyContactRelation;

  /// No description provided for @emergencyContactPhone.
  ///
  /// In en, this message translates to:
  /// **'+966 50 123 4567'**
  String get emergencyContactPhone;

  /// No description provided for @medicationsPageSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Track doses and reminders'**
  String get medicationsPageSubtitle;

  /// No description provided for @activeMedicationsCount.
  ///
  /// In en, this message translates to:
  /// **'Active Medications'**
  String get activeMedicationsCount;

  /// No description provided for @adherenceThisMonth.
  ///
  /// In en, this message translates to:
  /// **'Monthly Adherence'**
  String get adherenceThisMonth;

  /// No description provided for @remindersActiveStatus.
  ///
  /// In en, this message translates to:
  /// **'Reminders Active'**
  String get remindersActiveStatus;

  /// No description provided for @todaysDoses.
  ///
  /// In en, this message translates to:
  /// **'Today\'s Doses'**
  String get todaysDoses;

  /// No description provided for @demoTodayDateLabel.
  ///
  /// In en, this message translates to:
  /// **'Sunday, May 18'**
  String get demoTodayDateLabel;

  /// No description provided for @medMetforminName.
  ///
  /// In en, this message translates to:
  /// **'Metformin'**
  String get medMetforminName;

  /// No description provided for @medMetforminDosage.
  ///
  /// In en, this message translates to:
  /// **'500 mg · Twice daily'**
  String get medMetforminDosage;

  /// No description provided for @medMetforminSchedule.
  ///
  /// In en, this message translates to:
  /// **'9:00 AM · After breakfast · 92% adherence'**
  String get medMetforminSchedule;

  /// No description provided for @medAmlodipineName.
  ///
  /// In en, this message translates to:
  /// **'Amlodipine'**
  String get medAmlodipineName;

  /// No description provided for @medAmlodipineDosage.
  ///
  /// In en, this message translates to:
  /// **'5 mg · Once daily'**
  String get medAmlodipineDosage;

  /// No description provided for @medAmlodipineSchedule.
  ///
  /// In en, this message translates to:
  /// **'8:00 PM · Evening · 86% adherence'**
  String get medAmlodipineSchedule;

  /// No description provided for @doseTakenBadge.
  ///
  /// In en, this message translates to:
  /// **'Taken'**
  String get doseTakenBadge;

  /// No description provided for @doseUpcomingBadge.
  ///
  /// In en, this message translates to:
  /// **'Upcoming'**
  String get doseUpcomingBadge;

  /// No description provided for @doseLoggedButton.
  ///
  /// In en, this message translates to:
  /// **'Dose Logged'**
  String get doseLoggedButton;

  /// No description provided for @logDoseButton.
  ///
  /// In en, this message translates to:
  /// **'Log Dose'**
  String get logDoseButton;

  /// No description provided for @reportsPageSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Shareable health summaries'**
  String get reportsPageSubtitle;

  /// No description provided for @periodThisWeek.
  ///
  /// In en, this message translates to:
  /// **'This Week'**
  String get periodThisWeek;

  /// No description provided for @periodThisMonth.
  ///
  /// In en, this message translates to:
  /// **'This Month'**
  String get periodThisMonth;

  /// No description provided for @periodThreeMonths.
  ///
  /// In en, this message translates to:
  /// **'3 Months'**
  String get periodThreeMonths;

  /// No description provided for @healthSummaryLabel.
  ///
  /// In en, this message translates to:
  /// **'Health Summary'**
  String get healthSummaryLabel;

  /// No description provided for @reportMonthTitle.
  ///
  /// In en, this message translates to:
  /// **'May 2025 Report'**
  String get reportMonthTitle;

  /// No description provided for @reportWeekTitle.
  ///
  /// In en, this message translates to:
  /// **'Weekly Report'**
  String get reportWeekTitle;

  /// No description provided for @reportQuarterTitle.
  ///
  /// In en, this message translates to:
  /// **'Quarterly Report'**
  String get reportQuarterTitle;

  /// No description provided for @reportMonthRange.
  ///
  /// In en, this message translates to:
  /// **'Apr 18 - May 18'**
  String get reportMonthRange;

  /// No description provided for @reportWeekRange.
  ///
  /// In en, this message translates to:
  /// **'May 11 - May 18'**
  String get reportWeekRange;

  /// No description provided for @reportQuarterRange.
  ///
  /// In en, this message translates to:
  /// **'Feb 18 - May 18'**
  String get reportQuarterRange;

  /// No description provided for @avgBloodPressure.
  ///
  /// In en, this message translates to:
  /// **'Avg Blood Pressure'**
  String get avgBloodPressure;

  /// No description provided for @avgBloodSugar.
  ///
  /// In en, this message translates to:
  /// **'Avg Blood Sugar'**
  String get avgBloodSugar;

  /// No description provided for @avgWeight.
  ///
  /// In en, this message translates to:
  /// **'Avg Weight'**
  String get avgWeight;

  /// No description provided for @avgHeartRate.
  ///
  /// In en, this message translates to:
  /// **'Avg Heart Rate'**
  String get avgHeartRate;

  /// No description provided for @medicationAdherence.
  ///
  /// In en, this message translates to:
  /// **'Medication Adherence'**
  String get medicationAdherence;

  /// No description provided for @unitMmHg.
  ///
  /// In en, this message translates to:
  /// **'mmHg'**
  String get unitMmHg;

  /// No description provided for @unitMgDl.
  ///
  /// In en, this message translates to:
  /// **'mg/dL'**
  String get unitMgDl;

  /// No description provided for @unitKg.
  ///
  /// In en, this message translates to:
  /// **'kg'**
  String get unitKg;

  /// No description provided for @unitBpm.
  ///
  /// In en, this message translates to:
  /// **'bpm'**
  String get unitBpm;

  /// No description provided for @reportIncludesTitle.
  ///
  /// In en, this message translates to:
  /// **'Report Includes'**
  String get reportIncludesTitle;

  /// No description provided for @reportIncludeBp.
  ///
  /// In en, this message translates to:
  /// **'Blood pressure readings summary'**
  String get reportIncludeBp;

  /// No description provided for @reportIncludeSugar.
  ///
  /// In en, this message translates to:
  /// **'Blood sugar readings summary'**
  String get reportIncludeSugar;

  /// No description provided for @reportIncludeWeightHr.
  ///
  /// In en, this message translates to:
  /// **'Weight and heart rate summary'**
  String get reportIncludeWeightHr;

  /// No description provided for @reportIncludeLog.
  ///
  /// In en, this message translates to:
  /// **'Readings log and dates'**
  String get reportIncludeLog;

  /// No description provided for @exportPdfButton.
  ///
  /// In en, this message translates to:
  /// **'Export PDF Report'**
  String get exportPdfButton;

  /// No description provided for @exportPdfSuccess.
  ///
  /// In en, this message translates to:
  /// **'PDF report prepared for sharing'**
  String get exportPdfSuccess;

  /// No description provided for @messagesPageSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Secure communication with care team'**
  String get messagesPageSubtitle;

  /// No description provided for @searchConversationsHint.
  ///
  /// In en, this message translates to:
  /// **'Search conversations'**
  String get searchConversationsHint;

  /// No description provided for @msgSamerLast.
  ///
  /// In en, this message translates to:
  /// **'Your recent readings are stable, keep following the plan.'**
  String get msgSamerLast;

  /// No description provided for @msgSamerTime.
  ///
  /// In en, this message translates to:
  /// **'10:24 AM'**
  String get msgSamerTime;

  /// No description provided for @hayaCareTeamName.
  ///
  /// In en, this message translates to:
  /// **'HayaCare Team'**
  String get hayaCareTeamName;

  /// No description provided for @hayaCareTeamInitials.
  ///
  /// In en, this message translates to:
  /// **'HC'**
  String get hayaCareTeamInitials;

  /// No description provided for @msgTeamLast.
  ///
  /// In en, this message translates to:
  /// **'Hello, how can we help you?'**
  String get msgTeamLast;

  /// No description provided for @msgTeamTime.
  ///
  /// In en, this message translates to:
  /// **'Yesterday'**
  String get msgTeamTime;

  /// No description provided for @healthTipsPageSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Trusted educational info for better daily habits'**
  String get healthTipsPageSubtitle;

  /// No description provided for @tipCategoryAll.
  ///
  /// In en, this message translates to:
  /// **'All'**
  String get tipCategoryAll;

  /// No description provided for @tipCategoryHeart.
  ///
  /// In en, this message translates to:
  /// **'Heart'**
  String get tipCategoryHeart;

  /// No description provided for @tipCategoryNutrition.
  ///
  /// In en, this message translates to:
  /// **'Nutrition'**
  String get tipCategoryNutrition;

  /// No description provided for @tipCategoryMedications.
  ///
  /// In en, this message translates to:
  /// **'Medications'**
  String get tipCategoryMedications;

  /// No description provided for @tipHeartTitle.
  ///
  /// In en, this message translates to:
  /// **'Measure pressure at the same time'**
  String get tipHeartTitle;

  /// No description provided for @tipHeartDesc.
  ///
  /// In en, this message translates to:
  /// **'Rest for five minutes before measuring and sit comfortably for more consistent readings.'**
  String get tipHeartDesc;

  /// No description provided for @tipNutritionTitle.
  ///
  /// In en, this message translates to:
  /// **'A balanced meal starts with greens'**
  String get tipNutritionTitle;

  /// No description provided for @tipNutritionDesc.
  ///
  /// In en, this message translates to:
  /// **'Adding vegetables and protein to your meal helps build more balanced eating habits.'**
  String get tipNutritionDesc;

  /// No description provided for @tipMedTitle.
  ///
  /// In en, this message translates to:
  /// **'Link doses to a daily routine'**
  String get tipMedTitle;

  /// No description provided for @tipMedDesc.
  ///
  /// In en, this message translates to:
  /// **'Use HayaCare reminders and log your dose right after taking it for easier tracking.'**
  String get tipMedDesc;

  /// No description provided for @healthTipsDisclaimer.
  ///
  /// In en, this message translates to:
  /// **'General educational content and does not replace medical advice or diagnosis.'**
  String get healthTipsDisclaimer;

  /// No description provided for @familyEmergencyPageSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Important information when needed'**
  String get familyEmergencyPageSubtitle;

  /// No description provided for @emergencyMedicalCardTitle.
  ///
  /// In en, this message translates to:
  /// **'Emergency Medical Card'**
  String get emergencyMedicalCardTitle;

  /// No description provided for @fullNameLabel.
  ///
  /// In en, this message translates to:
  /// **'Full Name'**
  String get fullNameLabel;

  /// No description provided for @bloodTypeLabel.
  ///
  /// In en, this message translates to:
  /// **'Blood Type'**
  String get bloodTypeLabel;

  /// No description provided for @bloodTypeOPlus.
  ///
  /// In en, this message translates to:
  /// **'O+'**
  String get bloodTypeOPlus;

  /// No description provided for @knownConditionsLabel.
  ///
  /// In en, this message translates to:
  /// **'Known Conditions'**
  String get knownConditionsLabel;

  /// No description provided for @knownConditionsValue.
  ///
  /// In en, this message translates to:
  /// **'Type 2 Diabetes, Hypertension'**
  String get knownConditionsValue;

  /// No description provided for @allergyShortValue.
  ///
  /// In en, this message translates to:
  /// **'Penicillin'**
  String get allergyShortValue;

  /// No description provided for @importantMedsLabel.
  ///
  /// In en, this message translates to:
  /// **'Important Medications'**
  String get importantMedsLabel;

  /// No description provided for @importantMedsValue.
  ///
  /// In en, this message translates to:
  /// **'Metformin, Amlodipine'**
  String get importantMedsValue;

  /// No description provided for @emergencyContactShortLabel.
  ///
  /// In en, this message translates to:
  /// **'Emergency Contact'**
  String get emergencyContactShortLabel;

  /// No description provided for @viewFullCard.
  ///
  /// In en, this message translates to:
  /// **'View Full Card'**
  String get viewFullCard;

  /// No description provided for @shareAction.
  ///
  /// In en, this message translates to:
  /// **'Share'**
  String get shareAction;

  /// No description provided for @consentShareCardTitle.
  ///
  /// In en, this message translates to:
  /// **'Consent to Share Emergency Card'**
  String get consentShareCardTitle;

  /// No description provided for @consentShareCardSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Your private info is only shared when you enable consent.'**
  String get consentShareCardSubtitle;

  /// No description provided for @emergencyQrTitle.
  ///
  /// In en, this message translates to:
  /// **'Emergency QR Code'**
  String get emergencyQrTitle;

  /// No description provided for @emergencyQrSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Shows the minimum info you consented to share.'**
  String get emergencyQrSubtitle;

  /// No description provided for @enlargeQrButton.
  ///
  /// In en, this message translates to:
  /// **'Enlarge QR'**
  String get enlargeQrButton;

  /// No description provided for @emergencyInfoSectionTitle.
  ///
  /// In en, this message translates to:
  /// **'Emergency Information'**
  String get emergencyInfoSectionTitle;

  /// No description provided for @contactPersonLabel.
  ///
  /// In en, this message translates to:
  /// **'Contact Person'**
  String get contactPersonLabel;

  /// No description provided for @relationshipLabel.
  ///
  /// In en, this message translates to:
  /// **'Relationship'**
  String get relationshipLabel;

  /// No description provided for @phoneLabel.
  ///
  /// In en, this message translates to:
  /// **'Phone Number'**
  String get phoneLabel;

  /// No description provided for @familyMembersSectionTitle.
  ///
  /// In en, this message translates to:
  /// **'Family Members'**
  String get familyMembersSectionTitle;

  /// No description provided for @addMemberAction.
  ///
  /// In en, this message translates to:
  /// **'+ Add'**
  String get addMemberAction;

  /// No description provided for @primaryContactSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Spouse · Primary Contact'**
  String get primaryContactSubtitle;

  /// No description provided for @activeStatusBadge.
  ///
  /// In en, this message translates to:
  /// **'Active'**
  String get activeStatusBadge;

  /// No description provided for @emergencyMemberInitials.
  ///
  /// In en, this message translates to:
  /// **'SA'**
  String get emergencyMemberInitials;

  /// No description provided for @aiAssistantTitle.
  ///
  /// In en, this message translates to:
  /// **'HayaCare Assistant'**
  String get aiAssistantTitle;

  /// No description provided for @aiAssistantSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Interactive health assistant · Demo model'**
  String get aiAssistantSubtitle;

  /// No description provided for @aiWelcomeMessage.
  ///
  /// In en, this message translates to:
  /// **'Hello, I am the HayaCare Assistant. I can explain readings, remind you of medications, and share general health info.'**
  String get aiWelcomeMessage;

  /// No description provided for @aiChipBpMeaning.
  ///
  /// In en, this message translates to:
  /// **'What does my BP reading mean?'**
  String get aiChipBpMeaning;

  /// No description provided for @aiChipNextMed.
  ///
  /// In en, this message translates to:
  /// **'My next medication dose'**
  String get aiChipNextMed;

  /// No description provided for @aiChipGeneralTip.
  ///
  /// In en, this message translates to:
  /// **'General health tip'**
  String get aiChipGeneralTip;

  /// No description provided for @aiInputHint.
  ///
  /// In en, this message translates to:
  /// **'Ask about your readings or medications...'**
  String get aiInputHint;

  /// No description provided for @aiDisclaimer.
  ///
  /// In en, this message translates to:
  /// **'Does not replace a doctor or provide diagnosis. Call emergency services if needed.'**
  String get aiDisclaimer;

  /// No description provided for @aiReplyBpMeaning.
  ///
  /// In en, this message translates to:
  /// **'Your latest reading (128/82 mmHg) is within an acceptable range. Keep resting 5 minutes before each measurement.'**
  String get aiReplyBpMeaning;

  /// No description provided for @aiReplyNextMed.
  ///
  /// In en, this message translates to:
  /// **'Your next dose is Amlodipine 5 mg at 8:00 PM today.'**
  String get aiReplyNextMed;

  /// No description provided for @aiReplyGeneralTip.
  ///
  /// In en, this message translates to:
  /// **'Drinking enough water and keeping consistent meal and sleep times helps stabilize your daily readings.'**
  String get aiReplyGeneralTip;

  /// No description provided for @aiReplyDefault.
  ///
  /// In en, this message translates to:
  /// **'Thank you for your question. Based on your recent log, your readings look stable. Always consult your doctor for medical decisions.'**
  String get aiReplyDefault;

  /// No description provided for @resetSearchAction.
  ///
  /// In en, this message translates to:
  /// **'Reset Search'**
  String get resetSearchAction;

  /// No description provided for @noMessagesFound.
  ///
  /// In en, this message translates to:
  /// **'No conversations found'**
  String get noMessagesFound;

  /// No description provided for @noMessagesFoundSub.
  ///
  /// In en, this message translates to:
  /// **'Try searching with a different name or keyword.'**
  String get noMessagesFoundSub;

  /// No description provided for @noTipsFound.
  ///
  /// In en, this message translates to:
  /// **'No tips in this category'**
  String get noTipsFound;

  /// No description provided for @noTipsFoundSub.
  ///
  /// In en, this message translates to:
  /// **'Try selecting another category to view health tips.'**
  String get noTipsFoundSub;

  /// No description provided for @signOutConfirmTitle.
  ///
  /// In en, this message translates to:
  /// **'Sign Out'**
  String get signOutConfirmTitle;

  /// No description provided for @signOutConfirmMessage.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to sign out of HayaCare?'**
  String get signOutConfirmMessage;

  /// No description provided for @cancelButton.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancelButton;

  /// No description provided for @addMedicationTitle.
  ///
  /// In en, this message translates to:
  /// **'Add Medication'**
  String get addMedicationTitle;

  /// No description provided for @addMedicationSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Enter medication details and reminder'**
  String get addMedicationSubtitle;

  /// No description provided for @medicationNameLabel.
  ///
  /// In en, this message translates to:
  /// **'Medication Name'**
  String get medicationNameLabel;

  /// No description provided for @medicationNameHint.
  ///
  /// In en, this message translates to:
  /// **'e.g., Metformin'**
  String get medicationNameHint;

  /// No description provided for @dosageLabel.
  ///
  /// In en, this message translates to:
  /// **'Dosage'**
  String get dosageLabel;

  /// No description provided for @dosageHint.
  ///
  /// In en, this message translates to:
  /// **'500 mg'**
  String get dosageHint;

  /// No description provided for @frequencyLabel.
  ///
  /// In en, this message translates to:
  /// **'Frequency'**
  String get frequencyLabel;

  /// No description provided for @frequencyHint.
  ///
  /// In en, this message translates to:
  /// **'Twice daily'**
  String get frequencyHint;

  /// No description provided for @doseTimeLabel.
  ///
  /// In en, this message translates to:
  /// **'Dose Time'**
  String get doseTimeLabel;

  /// No description provided for @doseTimeHint.
  ///
  /// In en, this message translates to:
  /// **'Select time'**
  String get doseTimeHint;

  /// No description provided for @doseReminderTitle.
  ///
  /// In en, this message translates to:
  /// **'Dose Reminder'**
  String get doseReminderTitle;

  /// No description provided for @doseReminderSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Send notification at each dose time'**
  String get doseReminderSubtitle;

  /// No description provided for @saveMedicationButton.
  ///
  /// In en, this message translates to:
  /// **'Save Medication'**
  String get saveMedicationButton;

  /// No description provided for @medicationAddedSuccess.
  ///
  /// In en, this message translates to:
  /// **'Medication added successfully'**
  String get medicationAddedSuccess;

  /// No description provided for @medicationRequiredError.
  ///
  /// In en, this message translates to:
  /// **'Please enter medication name and dosage'**
  String get medicationRequiredError;

  /// No description provided for @mealTimingLabel.
  ///
  /// In en, this message translates to:
  /// **'Meal Timing (Optional)'**
  String get mealTimingLabel;

  /// No description provided for @afterBreakfast.
  ///
  /// In en, this message translates to:
  /// **'After Breakfast'**
  String get afterBreakfast;

  /// No description provided for @beforeLunch.
  ///
  /// In en, this message translates to:
  /// **'Before Lunch'**
  String get beforeLunch;

  /// No description provided for @beforeDinner.
  ///
  /// In en, this message translates to:
  /// **'Before Dinner'**
  String get beforeDinner;

  /// No description provided for @afterDinner.
  ///
  /// In en, this message translates to:
  /// **'After Dinner'**
  String get afterDinner;

  /// No description provided for @editEmergencyInfoTitle.
  ///
  /// In en, this message translates to:
  /// **'Edit Emergency Information'**
  String get editEmergencyInfoTitle;

  /// No description provided for @saveChangesButton.
  ///
  /// In en, this message translates to:
  /// **'Save Changes'**
  String get saveChangesButton;

  /// No description provided for @emergencyUpdatedSuccess.
  ///
  /// In en, this message translates to:
  /// **'Emergency information updated'**
  String get emergencyUpdatedSuccess;

  /// No description provided for @addFamilyMemberTitle.
  ///
  /// In en, this message translates to:
  /// **'Add Family Member'**
  String get addFamilyMemberTitle;

  /// No description provided for @familyMemberNameHint.
  ///
  /// In en, this message translates to:
  /// **'e.g., Mohammed Ahmed'**
  String get familyMemberNameHint;

  /// No description provided for @relationshipHint.
  ///
  /// In en, this message translates to:
  /// **'e.g., Brother'**
  String get relationshipHint;

  /// No description provided for @additionalContactSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Additional contact'**
  String get additionalContactSubtitle;

  /// No description provided for @familyMemberAddedSuccess.
  ///
  /// In en, this message translates to:
  /// **'Family member added'**
  String get familyMemberAddedSuccess;

  /// No description provided for @conditionsShortLabel.
  ///
  /// In en, this message translates to:
  /// **'Conditions'**
  String get conditionsShortLabel;

  /// No description provided for @medicationsShortLabel.
  ///
  /// In en, this message translates to:
  /// **'Medications'**
  String get medicationsShortLabel;

  /// No description provided for @emergencyShortLabel.
  ///
  /// In en, this message translates to:
  /// **'Emergency'**
  String get emergencyShortLabel;

  /// No description provided for @fullCardDisclaimer.
  ///
  /// In en, this message translates to:
  /// **'Demo card, not shared without patient consent'**
  String get fullCardDisclaimer;

  /// No description provided for @exportPdfError.
  ///
  /// In en, this message translates to:
  /// **'Could not export PDF report'**
  String get exportPdfError;

  /// No description provided for @addNewItemHint.
  ///
  /// In en, this message translates to:
  /// **'Add new item...'**
  String get addNewItemHint;

  /// No description provided for @addAction.
  ///
  /// In en, this message translates to:
  /// **'Add'**
  String get addAction;

  /// No description provided for @medicalRecordUpdatedSuccess.
  ///
  /// In en, this message translates to:
  /// **'Medical record updated'**
  String get medicalRecordUpdatedSuccess;

  /// No description provided for @noItemsAddedYet.
  ///
  /// In en, this message translates to:
  /// **'No items added yet'**
  String get noItemsAddedYet;

  /// No description provided for @manageEmergencyContactTitle.
  ///
  /// In en, this message translates to:
  /// **'Manage Emergency Contact'**
  String get manageEmergencyContactTitle;

  /// No description provided for @personalInfoUpdatedSuccess.
  ///
  /// In en, this message translates to:
  /// **'Personal information updated'**
  String get personalInfoUpdatedSuccess;

  /// No description provided for @fieldRequiredError.
  ///
  /// In en, this message translates to:
  /// **'This field is required'**
  String get fieldRequiredError;

  /// No description provided for @editMedicationTitle.
  ///
  /// In en, this message translates to:
  /// **'Edit Medication'**
  String get editMedicationTitle;

  /// No description provided for @editReadingTitle.
  ///
  /// In en, this message translates to:
  /// **'Edit Measurement'**
  String get editReadingTitle;

  /// No description provided for @updateButton.
  ///
  /// In en, this message translates to:
  /// **'Update'**
  String get updateButton;

  /// No description provided for @deleteButton.
  ///
  /// In en, this message translates to:
  /// **'Delete'**
  String get deleteButton;

  /// No description provided for @medicationUpdatedSuccess.
  ///
  /// In en, this message translates to:
  /// **'Medication updated'**
  String get medicationUpdatedSuccess;

  /// No description provided for @medicationDeletedSuccess.
  ///
  /// In en, this message translates to:
  /// **'Medication deleted'**
  String get medicationDeletedSuccess;

  /// No description provided for @readingUpdatedSuccess.
  ///
  /// In en, this message translates to:
  /// **'Measurement updated'**
  String get readingUpdatedSuccess;

  /// No description provided for @readingDeletedSuccess.
  ///
  /// In en, this message translates to:
  /// **'Measurement deleted'**
  String get readingDeletedSuccess;

  /// No description provided for @noMedicationsTitle.
  ///
  /// In en, this message translates to:
  /// **'No medications added'**
  String get noMedicationsTitle;

  /// No description provided for @noMedicationsSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Tap + above to add your medications and reminders.'**
  String get noMedicationsSubtitle;

  /// No description provided for @healthScoreLabel.
  ///
  /// In en, this message translates to:
  /// **'Health Score'**
  String get healthScoreLabel;

  /// No description provided for @streakDaysLabel.
  ///
  /// In en, this message translates to:
  /// **'{count} day streak'**
  String streakDaysLabel(int count);

  /// No description provided for @sosTitle.
  ///
  /// In en, this message translates to:
  /// **'Emergency SOS'**
  String get sosTitle;

  /// No description provided for @sosSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Alert your family and active doctors'**
  String get sosSubtitle;

  /// No description provided for @sosButton.
  ///
  /// In en, this message translates to:
  /// **'Send SOS'**
  String get sosButton;

  /// No description provided for @sosConfirmTitle.
  ///
  /// In en, this message translates to:
  /// **'Send Emergency SOS?'**
  String get sosConfirmTitle;

  /// No description provided for @sosConfirmMessage.
  ///
  /// In en, this message translates to:
  /// **'An urgent alert will be sent to your emergency contacts and active care team.'**
  String get sosConfirmMessage;

  /// No description provided for @sosSentSuccess.
  ///
  /// In en, this message translates to:
  /// **'Emergency SOS sent'**
  String get sosSentSuccess;

  /// No description provided for @sosCooldownLabel.
  ///
  /// In en, this message translates to:
  /// **'Wait {seconds}s'**
  String sosCooldownLabel(int seconds);

  /// No description provided for @oxygenLabel.
  ///
  /// In en, this message translates to:
  /// **'Oxygen'**
  String get oxygenLabel;

  /// No description provided for @temperatureLabel.
  ///
  /// In en, this message translates to:
  /// **'Temp'**
  String get temperatureLabel;

  /// No description provided for @oxygenUnit.
  ///
  /// In en, this message translates to:
  /// **'%'**
  String get oxygenUnit;

  /// No description provided for @temperatureUnit.
  ///
  /// In en, this message translates to:
  /// **'°C'**
  String get temperatureUnit;

  /// No description provided for @voiceInputButton.
  ///
  /// In en, this message translates to:
  /// **'Voice Input'**
  String get voiceInputButton;

  /// No description provided for @voiceInputHint.
  ///
  /// In en, this message translates to:
  /// **'Say e.g. 130/85 or 105'**
  String get voiceInputHint;

  /// No description provided for @voiceInputApplied.
  ///
  /// In en, this message translates to:
  /// **'Voice reading filled — review before saving'**
  String get voiceInputApplied;

  /// No description provided for @invalidRangeError.
  ///
  /// In en, this message translates to:
  /// **'Value is outside the logical medical range'**
  String get invalidRangeError;

  /// No description provided for @largeTextModeTitle.
  ///
  /// In en, this message translates to:
  /// **'Large Text Mode'**
  String get largeTextModeTitle;

  /// No description provided for @largeTextModeSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Increase text size across the app'**
  String get largeTextModeSubtitle;

  /// No description provided for @ramadanModeTitle.
  ///
  /// In en, this message translates to:
  /// **'Ramadan Mode'**
  String get ramadanModeTitle;

  /// No description provided for @ramadanModeSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Auto-tag fasting on blood sugar readings'**
  String get ramadanModeSubtitle;

  /// No description provided for @regenerateLinkButton.
  ///
  /// In en, this message translates to:
  /// **'Regenerate Link'**
  String get regenerateLinkButton;

  /// No description provided for @linkRegeneratedSuccess.
  ///
  /// In en, this message translates to:
  /// **'Secret emergency link regenerated'**
  String get linkRegeneratedSuccess;

  /// No description provided for @inviteByEmailHint.
  ///
  /// In en, this message translates to:
  /// **'family@example.com'**
  String get inviteByEmailHint;

  /// No description provided for @pendingStatusBadge.
  ///
  /// In en, this message translates to:
  /// **'Pending'**
  String get pendingStatusBadge;

  /// No description provided for @endLinkAction.
  ///
  /// In en, this message translates to:
  /// **'End Link'**
  String get endLinkAction;

  /// No description provided for @linkEndedSuccess.
  ///
  /// In en, this message translates to:
  /// **'Family link ended'**
  String get linkEndedSuccess;

  /// No description provided for @clearChatAction.
  ///
  /// In en, this message translates to:
  /// **'Clear'**
  String get clearChatAction;

  /// No description provided for @chatClearedSuccess.
  ///
  /// In en, this message translates to:
  /// **'Conversation cleared'**
  String get chatClearedSuccess;

  /// No description provided for @markAllReadAction.
  ///
  /// In en, this message translates to:
  /// **'Mark all read'**
  String get markAllReadAction;

  /// No description provided for @deleteReadAction.
  ///
  /// In en, this message translates to:
  /// **'Clear read'**
  String get deleteReadAction;

  /// No description provided for @relationNone.
  ///
  /// In en, this message translates to:
  /// **'No active link'**
  String get relationNone;

  /// No description provided for @relationPending.
  ///
  /// In en, this message translates to:
  /// **'Pending reply'**
  String get relationPending;

  /// No description provided for @relationActive.
  ///
  /// In en, this message translates to:
  /// **'Active'**
  String get relationActive;

  /// No description provided for @rateDoctorButton.
  ///
  /// In en, this message translates to:
  /// **'Rate Doctor'**
  String get rateDoctorButton;

  /// No description provided for @ratingSubmittedSuccess.
  ///
  /// In en, this message translates to:
  /// **'Thank you for rating'**
  String get ratingSubmittedSuccess;

  /// No description provided for @personalThresholdsTitle.
  ///
  /// In en, this message translates to:
  /// **'Alert Thresholds'**
  String get personalThresholdsTitle;

  /// No description provided for @personalThresholdsSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Customize your normal reading limits'**
  String get personalThresholdsSubtitle;

  /// No description provided for @securitySessionsTitle.
  ///
  /// In en, this message translates to:
  /// **'Security & Sessions'**
  String get securitySessionsTitle;

  /// No description provided for @securitySessionsSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Change password & active devices'**
  String get securitySessionsSubtitle;

  /// No description provided for @changePasswordTitle.
  ///
  /// In en, this message translates to:
  /// **'Change Password'**
  String get changePasswordTitle;

  /// No description provided for @activeSessionsTitle.
  ///
  /// In en, this message translates to:
  /// **'Active Sessions'**
  String get activeSessionsTitle;

  /// No description provided for @currentDeviceLabel.
  ///
  /// In en, this message translates to:
  /// **'This Device · Active now'**
  String get currentDeviceLabel;

  /// No description provided for @endOtherSessionsButton.
  ///
  /// In en, this message translates to:
  /// **'Sign out other devices'**
  String get endOtherSessionsButton;

  /// No description provided for @sessionsEndedSuccess.
  ///
  /// In en, this message translates to:
  /// **'Other sessions signed out'**
  String get sessionsEndedSuccess;

  /// No description provided for @maxBpThresholdLabel.
  ///
  /// In en, this message translates to:
  /// **'Max Systolic BP (mmHg)'**
  String get maxBpThresholdLabel;

  /// No description provided for @maxSugarThresholdLabel.
  ///
  /// In en, this message translates to:
  /// **'Max Blood Sugar (mg/dL)'**
  String get maxSugarThresholdLabel;

  /// No description provided for @voiceListeningStatus.
  ///
  /// In en, this message translates to:
  /// **'Listening... speak now'**
  String get voiceListeningStatus;

  /// No description provided for @voiceTapMicToStart.
  ///
  /// In en, this message translates to:
  /// **'Tap the microphone to speak'**
  String get voiceTapMicToStart;

  /// No description provided for @voiceMicUnavailable.
  ///
  /// In en, this message translates to:
  /// **'Microphone unavailable or permission denied'**
  String get voiceMicUnavailable;

  /// No description provided for @voiceArabicChip.
  ///
  /// In en, this message translates to:
  /// **'العربية'**
  String get voiceArabicChip;

  /// No description provided for @voiceEnglishChip.
  ///
  /// In en, this message translates to:
  /// **'English'**
  String get voiceEnglishChip;

  /// No description provided for @voiceApplyButton.
  ///
  /// In en, this message translates to:
  /// **'Apply Reading'**
  String get voiceApplyButton;

  /// No description provided for @monitoredPeopleTitle.
  ///
  /// In en, this message translates to:
  /// **'People I Monitor'**
  String get monitoredPeopleTitle;

  /// No description provided for @monitoredPeopleSubtitle.
  ///
  /// In en, this message translates to:
  /// **'View linked family members\' readings (read-only)'**
  String get monitoredPeopleSubtitle;

  /// No description provided for @incomingInviteBadge.
  ///
  /// In en, this message translates to:
  /// **'Invitation'**
  String get incomingInviteBadge;

  /// No description provided for @acceptInviteButton.
  ///
  /// In en, this message translates to:
  /// **'Accept'**
  String get acceptInviteButton;

  /// No description provided for @declineInviteButton.
  ///
  /// In en, this message translates to:
  /// **'Decline'**
  String get declineInviteButton;

  /// No description provided for @viewSummaryButton.
  ///
  /// In en, this message translates to:
  /// **'View Summary'**
  String get viewSummaryButton;

  /// No description provided for @readOnlyBadge.
  ///
  /// In en, this message translates to:
  /// **'Read-Only View'**
  String get readOnlyBadge;

  /// No description provided for @readOnlyNotice.
  ///
  /// In en, this message translates to:
  /// **'You can view latest readings and urgent alerts only. Editing or adding data is disabled.'**
  String get readOnlyNotice;

  /// No description provided for @latestVitalsSummaryTitle.
  ///
  /// In en, this message translates to:
  /// **'Latest Vitals Summary'**
  String get latestVitalsSummaryTitle;

  /// No description provided for @urgentAlertsHistoryTitle.
  ///
  /// In en, this message translates to:
  /// **'Urgent Alerts & SOS'**
  String get urgentAlertsHistoryTitle;

  /// No description provided for @noUrgentAlertsText.
  ///
  /// In en, this message translates to:
  /// **'No recent urgent alerts'**
  String get noUrgentAlertsText;

  /// No description provided for @inviteAcceptedSuccess.
  ///
  /// In en, this message translates to:
  /// **'Monitoring link accepted'**
  String get inviteAcceptedSuccess;

  /// No description provided for @inviteDeclinedInfo.
  ///
  /// In en, this message translates to:
  /// **'Monitoring invitation declined'**
  String get inviteDeclinedInfo;

  /// No description provided for @parentMonitorName.
  ///
  /// In en, this message translates to:
  /// **'Ahmed Hassan (Father)'**
  String get parentMonitorName;

  /// No description provided for @motherInviteName.
  ///
  /// In en, this message translates to:
  /// **'Fatma Ali (Mother)'**
  String get motherInviteName;

  /// No description provided for @statusWatchLabel.
  ///
  /// In en, this message translates to:
  /// **'Watch'**
  String get statusWatchLabel;

  /// No description provided for @urgentAlertSampleMsg.
  ///
  /// In en, this message translates to:
  /// **'Urgent reading alert: Blood pressure above threshold'**
  String get urgentAlertSampleMsg;

  /// No description provided for @oxygenSaturationFull.
  ///
  /// In en, this message translates to:
  /// **'Oxygen Saturation (%)'**
  String get oxygenSaturationFull;

  /// No description provided for @bodyTemperatureFull.
  ///
  /// In en, this message translates to:
  /// **'Body Temperature (°C)'**
  String get bodyTemperatureFull;

  /// No description provided for @voiceHintBp.
  ///
  /// In en, this message translates to:
  /// **'Say e.g. 120 over 80 today at 8 PM'**
  String get voiceHintBp;

  /// No description provided for @voiceHintSugar.
  ///
  /// In en, this message translates to:
  /// **'Say e.g. 105 fasting yesterday'**
  String get voiceHintSugar;

  /// No description provided for @voiceHintWeight.
  ///
  /// In en, this message translates to:
  /// **'Say e.g. 82.4 morning'**
  String get voiceHintWeight;

  /// No description provided for @voiceHintHeartRate.
  ///
  /// In en, this message translates to:
  /// **'Say e.g. 72 after exercise'**
  String get voiceHintHeartRate;

  /// No description provided for @voiceHintOxygen.
  ///
  /// In en, this message translates to:
  /// **'Say e.g. 98 at rest'**
  String get voiceHintOxygen;

  /// No description provided for @voiceHintTemperature.
  ///
  /// In en, this message translates to:
  /// **'Say e.g. 36.8 today'**
  String get voiceHintTemperature;

  /// No description provided for @aiShareDataTitle.
  ///
  /// In en, this message translates to:
  /// **'Share my health data'**
  String get aiShareDataTitle;

  /// No description provided for @aiShareDataSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Off by default — assistant cannot see readings until enabled'**
  String get aiShareDataSubtitle;

  /// No description provided for @aiNoDataSharedReply.
  ///
  /// In en, this message translates to:
  /// **'Health data sharing is currently off, so I cannot see your readings or medications. Enable \"Share my health data\" above if you would like me to review them.'**
  String get aiNoDataSharedReply;
}

class _SDelegate extends LocalizationsDelegate<S> {
  const _SDelegate();

  @override
  Future<S> load(Locale locale) {
    return SynchronousFuture<S>(lookupS(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['ar', 'en'].contains(locale.languageCode);

  @override
  bool shouldReload(_SDelegate old) => false;
}

S lookupS(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ar':
      return SAr();
    case 'en':
      return SEn();
  }

  throw FlutterError(
    'S.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
