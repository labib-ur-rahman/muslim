import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_ar.dart';
import 'app_localizations_bn.dart';
import 'app_localizations_de.dart';
import 'app_localizations_en.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
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
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

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
    Locale('bn'),
    Locale('de'),
    Locale('en'),
  ];

  /// No description provided for @app_name.
  ///
  /// In en, this message translates to:
  /// **'Noor Al-Bayan'**
  String get app_name;

  /// No description provided for @pray_times.
  ///
  /// In en, this message translates to:
  /// **'Prayer Times'**
  String get pray_times;

  /// No description provided for @fajer.
  ///
  /// In en, this message translates to:
  /// **'Fajr'**
  String get fajer;

  /// No description provided for @duhur.
  ///
  /// In en, this message translates to:
  /// **'Dhuhr'**
  String get duhur;

  /// No description provided for @asr.
  ///
  /// In en, this message translates to:
  /// **'Asr'**
  String get asr;

  /// No description provided for @magrib.
  ///
  /// In en, this message translates to:
  /// **'Maghrib'**
  String get magrib;

  /// No description provided for @esha.
  ///
  /// In en, this message translates to:
  /// **'Isha'**
  String get esha;

  /// No description provided for @main_categories.
  ///
  /// In en, this message translates to:
  /// **'Main Sections'**
  String get main_categories;

  /// No description provided for @quran_kareem.
  ///
  /// In en, this message translates to:
  /// **'Holy Quran'**
  String get quran_kareem;

  /// No description provided for @tafseer.
  ///
  /// In en, this message translates to:
  /// **'Tafsir'**
  String get tafseer;

  /// No description provided for @sunah.
  ///
  /// In en, this message translates to:
  /// **'Sunnah'**
  String get sunah;

  /// No description provided for @qebla_direction.
  ///
  /// In en, this message translates to:
  /// **'Qibla Direction'**
  String get qebla_direction;

  /// No description provided for @adkar_adia.
  ///
  /// In en, this message translates to:
  /// **'Adhkar & Supplications'**
  String get adkar_adia;

  /// No description provided for @quran_reciters.
  ///
  /// In en, this message translates to:
  /// **'Reciters'**
  String get quran_reciters;

  /// No description provided for @home.
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get home;

  /// No description provided for @updates.
  ///
  /// In en, this message translates to:
  /// **'Updates'**
  String get updates;

  /// No description provided for @settings.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settings;

  /// No description provided for @reader_mishary_alafasy.
  ///
  /// In en, this message translates to:
  /// **'Mishary Alafasy'**
  String get reader_mishary_alafasy;

  /// No description provided for @reader_abdul_basit.
  ///
  /// In en, this message translates to:
  /// **'Abdul Basit Abdul Samad'**
  String get reader_abdul_basit;

  /// No description provided for @reader_mahmoud_alhusary.
  ///
  /// In en, this message translates to:
  /// **'Mahmoud Al-Husary'**
  String get reader_mahmoud_alhusary;

  /// No description provided for @reader_mustafa_ismail.
  ///
  /// In en, this message translates to:
  /// **'Mustafa Ismail'**
  String get reader_mustafa_ismail;

  /// No description provided for @reader_yasser_aldosari.
  ///
  /// In en, this message translates to:
  /// **'Yasser Al-Dosari'**
  String get reader_yasser_aldosari;

  /// No description provided for @reader_alsudais.
  ///
  /// In en, this message translates to:
  /// **'Abdul Rahman Al-Sudais'**
  String get reader_alsudais;

  /// No description provided for @reader_minshawi.
  ///
  /// In en, this message translates to:
  /// **'Mohamed Siddiq Al-Minshawi'**
  String get reader_minshawi;

  /// No description provided for @accoutn_settings.
  ///
  /// In en, this message translates to:
  /// **'Account Settings'**
  String get accoutn_settings;

  /// No description provided for @app_settings.
  ///
  /// In en, this message translates to:
  /// **'App Settings'**
  String get app_settings;

  /// No description provided for @personal_information.
  ///
  /// In en, this message translates to:
  /// **'Personal Information'**
  String get personal_information;

  /// No description provided for @payment_information.
  ///
  /// In en, this message translates to:
  /// **'Payment Information'**
  String get payment_information;

  /// No description provided for @faviort.
  ///
  /// In en, this message translates to:
  /// **'Favorites'**
  String get faviort;

  /// No description provided for @notifcations.
  ///
  /// In en, this message translates to:
  /// **'Notifications'**
  String get notifcations;

  /// No description provided for @language.
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get language;

  /// No description provided for @dark_mode.
  ///
  /// In en, this message translates to:
  /// **'Dark Mode'**
  String get dark_mode;

  /// No description provided for @font_size.
  ///
  /// In en, this message translates to:
  /// **'Font Size'**
  String get font_size;

  /// No description provided for @app_color.
  ///
  /// In en, this message translates to:
  /// **'App Color'**
  String get app_color;

  /// No description provided for @app_language.
  ///
  /// In en, this message translates to:
  /// **'App Language'**
  String get app_language;

  /// No description provided for @brandBlue.
  ///
  /// In en, this message translates to:
  /// **'Elegant'**
  String get brandBlue;

  /// No description provided for @blueWhale.
  ///
  /// In en, this message translates to:
  /// **'Blue'**
  String get blueWhale;

  /// No description provided for @sakura.
  ///
  /// In en, this message translates to:
  /// **'Pink'**
  String get sakura;

  /// No description provided for @money.
  ///
  /// In en, this message translates to:
  /// **'Green'**
  String get money;

  /// No description provided for @gold.
  ///
  /// In en, this message translates to:
  /// **'Gold'**
  String get gold;

  /// No description provided for @vesuviusBurn.
  ///
  /// In en, this message translates to:
  /// **'Orange'**
  String get vesuviusBurn;

  /// No description provided for @barossa.
  ///
  /// In en, this message translates to:
  /// **'Red'**
  String get barossa;

  /// No description provided for @shark.
  ///
  /// In en, this message translates to:
  /// **'Grey'**
  String get shark;

  /// No description provided for @controll_panel.
  ///
  /// In en, this message translates to:
  /// **'Control Panel'**
  String get controll_panel;

  /// No description provided for @last_reading.
  ///
  /// In en, this message translates to:
  /// **'Last Reading Position'**
  String get last_reading;

  /// No description provided for @search_in_quran.
  ///
  /// In en, this message translates to:
  /// **'Search in Quran'**
  String get search_in_quran;

  /// No description provided for @share_app.
  ///
  /// In en, this message translates to:
  /// **'Share App'**
  String get share_app;

  /// No description provided for @current_surah.
  ///
  /// In en, this message translates to:
  /// **'Current Surah'**
  String get current_surah;

  /// No description provided for @next.
  ///
  /// In en, this message translates to:
  /// **'Next'**
  String get next;

  /// No description provided for @previous.
  ///
  /// In en, this message translates to:
  /// **'Previous'**
  String get previous;

  /// No description provided for @page_number.
  ///
  /// In en, this message translates to:
  /// **'Page Number'**
  String get page_number;

  /// No description provided for @select_surah.
  ///
  /// In en, this message translates to:
  /// **'Select Surah'**
  String get select_surah;

  /// No description provided for @search_placeholder.
  ///
  /// In en, this message translates to:
  /// **'Search in the Holy Quran verses...'**
  String get search_placeholder;

  /// No description provided for @start_searching.
  ///
  /// In en, this message translates to:
  /// **'Start typing to search for verses'**
  String get start_searching;

  /// No description provided for @story.
  ///
  /// In en, this message translates to:
  /// **'Stories'**
  String get story;

  /// No description provided for @faviorte.
  ///
  /// In en, this message translates to:
  /// **'Favorites'**
  String get faviorte;

  /// No description provided for @books.
  ///
  /// In en, this message translates to:
  /// **'Books'**
  String get books;

  /// No description provided for @saved_bookmarks.
  ///
  /// In en, this message translates to:
  /// **'Saved Bookmarks'**
  String get saved_bookmarks;

  /// No description provided for @save_reading_place.
  ///
  /// In en, this message translates to:
  /// **'Save reading position'**
  String get save_reading_place;

  /// No description provided for @mark_removed.
  ///
  /// In en, this message translates to:
  /// **'Bookmark removed'**
  String get mark_removed;

  /// No description provided for @mark_added.
  ///
  /// In en, this message translates to:
  /// **'Bookmark added'**
  String get mark_added;

  /// No description provided for @more_options.
  ///
  /// In en, this message translates to:
  /// **'More options'**
  String get more_options;

  /// No description provided for @go_back.
  ///
  /// In en, this message translates to:
  /// **'Go back'**
  String get go_back;

  /// No description provided for @app_information.
  ///
  /// In en, this message translates to:
  /// **'App Information'**
  String get app_information;

  /// No description provided for @privacy_policy.
  ///
  /// In en, this message translates to:
  /// **'Privacy Policy'**
  String get privacy_policy;

  /// No description provided for @terms_of_use.
  ///
  /// In en, this message translates to:
  /// **'Terms of Use'**
  String get terms_of_use;

  /// No description provided for @app_certificates.
  ///
  /// In en, this message translates to:
  /// **'App Certificates'**
  String get app_certificates;

  /// No description provided for @version.
  ///
  /// In en, this message translates to:
  /// **'Version'**
  String get version;

  /// No description provided for @last_reading_surah.
  ///
  /// In en, this message translates to:
  /// **'Last Reading'**
  String get last_reading_surah;

  /// No description provided for @today_duaa.
  ///
  /// In en, this message translates to:
  /// **'Today\'s Supplication'**
  String get today_duaa;

  /// No description provided for @show_all.
  ///
  /// In en, this message translates to:
  /// **'Show All'**
  String get show_all;

  /// No description provided for @sunah_hadeth.
  ///
  /// In en, this message translates to:
  /// **'Hadith and Sunnah'**
  String get sunah_hadeth;

  /// No description provided for @sahih_bukhari.
  ///
  /// In en, this message translates to:
  /// **'Sahih al-Bukhari'**
  String get sahih_bukhari;

  /// No description provided for @sahih_muslim.
  ///
  /// In en, this message translates to:
  /// **'Sahih Muslim'**
  String get sahih_muslim;

  /// No description provided for @sunan_abi_dawud.
  ///
  /// In en, this message translates to:
  /// **'Sunan Abi Dawud'**
  String get sunan_abi_dawud;

  /// No description provided for @sunan_at_tirmidhi.
  ///
  /// In en, this message translates to:
  /// **'Sunan at-Tirmidhi'**
  String get sunan_at_tirmidhi;

  /// No description provided for @sunan_an_nasai.
  ///
  /// In en, this message translates to:
  /// **'Sunan an-Nasa\'i'**
  String get sunan_an_nasai;

  /// No description provided for @sunan_ibn_majah.
  ///
  /// In en, this message translates to:
  /// **'Sunan Ibn Majah'**
  String get sunan_ibn_majah;

  /// No description provided for @time_format.
  ///
  /// In en, this message translates to:
  /// **'Time Format'**
  String get time_format;

  /// No description provided for @active_24_format.
  ///
  /// In en, this message translates to:
  /// **'24-hour format'**
  String get active_24_format;

  /// No description provided for @close.
  ///
  /// In en, this message translates to:
  /// **'Close'**
  String get close;

  /// No description provided for @updateLater.
  ///
  /// In en, this message translates to:
  /// **'Later'**
  String get updateLater;

  /// No description provided for @updateNow.
  ///
  /// In en, this message translates to:
  /// **'Update now'**
  String get updateNow;

  /// No description provided for @updateApp.
  ///
  /// In en, this message translates to:
  /// **'Update app'**
  String get updateApp;

  /// No description provided for @openGooglePlay.
  ///
  /// In en, this message translates to:
  /// **'Open Google Play'**
  String get openGooglePlay;

  /// No description provided for @updateFailed.
  ///
  /// In en, this message translates to:
  /// **'The in-app update could not be started. Try again or open the store.'**
  String get updateFailed;

  /// No description provided for @storeOpenFailed.
  ///
  /// In en, this message translates to:
  /// **'The app page could not be opened in Google Play.'**
  String get storeOpenFailed;

  /// No description provided for @settings_header_title.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settings_header_title;

  /// No description provided for @settings_header_subtitle.
  ///
  /// In en, this message translates to:
  /// **'Customize your experience to fit your needs'**
  String get settings_header_subtitle;

  /// No description provided for @settings_appearance_title.
  ///
  /// In en, this message translates to:
  /// **'Appearance & Reading'**
  String get settings_appearance_title;

  /// No description provided for @settings_appearance_subtitle.
  ///
  /// In en, this message translates to:
  /// **'Customize the app look and reading experience'**
  String get settings_appearance_subtitle;

  /// No description provided for @settings_dark_mode_enabled.
  ///
  /// In en, this message translates to:
  /// **'Dark mode is on'**
  String get settings_dark_mode_enabled;

  /// No description provided for @settings_light_mode_enabled.
  ///
  /// In en, this message translates to:
  /// **'Light mode is on'**
  String get settings_light_mode_enabled;

  /// No description provided for @settings_app_color_subtitle.
  ///
  /// In en, this message translates to:
  /// **'Color of buttons and highlighted elements'**
  String get settings_app_color_subtitle;

  /// No description provided for @settings_adkar_font_size.
  ///
  /// In en, this message translates to:
  /// **'Adhkar Font Size'**
  String get settings_adkar_font_size;

  /// No description provided for @settings_adkar_font_size_subtitle.
  ///
  /// In en, this message translates to:
  /// **'Text size inside Adhkar pages'**
  String get settings_adkar_font_size_subtitle;

  /// No description provided for @settings_prayer_times_title.
  ///
  /// In en, this message translates to:
  /// **'Prayer Times'**
  String get settings_prayer_times_title;

  /// No description provided for @settings_prayer_times_subtitle.
  ///
  /// In en, this message translates to:
  /// **'Calculation, madhab, and time display'**
  String get settings_prayer_times_subtitle;

  /// No description provided for @settings_calculation_method.
  ///
  /// In en, this message translates to:
  /// **'Prayer Calculation Method'**
  String get settings_calculation_method;

  /// No description provided for @settings_madhab_asr.
  ///
  /// In en, this message translates to:
  /// **'Madhab (Asr Prayer)'**
  String get settings_madhab_asr;

  /// No description provided for @settings_madhab_standard.
  ///
  /// In en, this message translates to:
  /// **'Standard'**
  String get settings_madhab_standard;

  /// No description provided for @settings_madhab_hanafi.
  ///
  /// In en, this message translates to:
  /// **'Hanafi'**
  String get settings_madhab_hanafi;

  /// No description provided for @settings_madhab_standard_subtitle.
  ///
  /// In en, this message translates to:
  /// **'Shafi, Maliki, Hanbali'**
  String get settings_madhab_standard_subtitle;

  /// No description provided for @settings_24_hour_format.
  ///
  /// In en, this message translates to:
  /// **'24-hour format'**
  String get settings_24_hour_format;

  /// No description provided for @settings_24_hour_example_enabled.
  ///
  /// In en, this message translates to:
  /// **'Example: 18:30'**
  String get settings_24_hour_example_enabled;

  /// No description provided for @settings_24_hour_example_disabled.
  ///
  /// In en, this message translates to:
  /// **'Example: 6:30 PM'**
  String get settings_24_hour_example_disabled;

  /// No description provided for @settings_notifications_title.
  ///
  /// In en, this message translates to:
  /// **'Notifications & Alerts'**
  String get settings_notifications_title;

  /// No description provided for @settings_notifications_subtitle.
  ///
  /// In en, this message translates to:
  /// **'Prayer, morning, and evening Adhkar alerts'**
  String get settings_notifications_subtitle;

  /// No description provided for @settings_prayer_notifications.
  ///
  /// In en, this message translates to:
  /// **'Prayer Notifications'**
  String get settings_prayer_notifications;

  /// No description provided for @settings_notifications_enabled.
  ///
  /// In en, this message translates to:
  /// **'Notifications are on'**
  String get settings_notifications_enabled;

  /// No description provided for @settings_notifications_disabled.
  ///
  /// In en, this message translates to:
  /// **'Notifications are off'**
  String get settings_notifications_disabled;

  /// No description provided for @settings_customize_prayers.
  ///
  /// In en, this message translates to:
  /// **'Customize Prayers'**
  String get settings_customize_prayers;

  /// No description provided for @settings_customize_prayers_subtitle.
  ///
  /// In en, this message translates to:
  /// **'Choose the prayers you want alerts for'**
  String get settings_customize_prayers_subtitle;

  /// No description provided for @settings_prayer_sounds.
  ///
  /// In en, this message translates to:
  /// **'Prayer Sounds'**
  String get settings_prayer_sounds;

  /// No description provided for @settings_prayer_sounds_subtitle.
  ///
  /// In en, this message translates to:
  /// **'Adhan, notification sound, or silent vibration'**
  String get settings_prayer_sounds_subtitle;

  /// No description provided for @settings_notification_sounds.
  ///
  /// In en, this message translates to:
  /// **'Notification Sounds'**
  String get settings_notification_sounds;

  /// No description provided for @settings_notification_sounds_subtitle.
  ///
  /// In en, this message translates to:
  /// **'Choose sounds from Android settings for each type'**
  String get settings_notification_sounds_subtitle;

  /// No description provided for @settings_morning_adkar.
  ///
  /// In en, this message translates to:
  /// **'Morning Adhkar'**
  String get settings_morning_adkar;

  /// No description provided for @settings_evening_adkar.
  ///
  /// In en, this message translates to:
  /// **'Evening Adhkar'**
  String get settings_evening_adkar;

  /// No description provided for @settings_tap_to_edit_reminder.
  ///
  /// In en, this message translates to:
  /// **'Tap the row to edit reminder time'**
  String get settings_tap_to_edit_reminder;

  /// No description provided for @settings_reminder_disabled.
  ///
  /// In en, this message translates to:
  /// **'Reminder is off'**
  String get settings_reminder_disabled;

  /// No description provided for @settings_fajr_time.
  ///
  /// In en, this message translates to:
  /// **'Fajr time'**
  String get settings_fajr_time;

  /// No description provided for @settings_maghrib_time.
  ///
  /// In en, this message translates to:
  /// **'Maghrib time'**
  String get settings_maghrib_time;

  /// No description provided for @settings_pick_reminder_time_help.
  ///
  /// In en, this message translates to:
  /// **'Choose reminder time, or cancel to use the suggested time'**
  String get settings_pick_reminder_time_help;

  /// No description provided for @settings_location_privacy_title.
  ///
  /// In en, this message translates to:
  /// **'Location & Privacy'**
  String get settings_location_privacy_title;

  /// No description provided for @settings_location_privacy_subtitle.
  ///
  /// In en, this message translates to:
  /// **'Data used for prayer and Qibla direction'**
  String get settings_location_privacy_subtitle;

  /// No description provided for @settings_update_location.
  ///
  /// In en, this message translates to:
  /// **'Update Location Data'**
  String get settings_update_location;

  /// No description provided for @settings_update_location_subtitle.
  ///
  /// In en, this message translates to:
  /// **'Detect your location again and calculate times'**
  String get settings_update_location_subtitle;

  /// No description provided for @settings_about_title.
  ///
  /// In en, this message translates to:
  /// **'About the App'**
  String get settings_about_title;

  /// No description provided for @settings_about_subtitle.
  ///
  /// In en, this message translates to:
  /// **'Zad Al-Muslim information and sharing'**
  String get settings_about_subtitle;

  /// No description provided for @settings_app_information_subtitle.
  ///
  /// In en, this message translates to:
  /// **'Version, licenses, and terms of use'**
  String get settings_app_information_subtitle;

  /// No description provided for @settings_share_app.
  ///
  /// In en, this message translates to:
  /// **'Share App'**
  String get settings_share_app;

  /// No description provided for @settings_share_app_subtitle.
  ///
  /// In en, this message translates to:
  /// **'Share Zad Al-Muslim with someone you love'**
  String get settings_share_app_subtitle;

  /// No description provided for @settings_sensitive_title.
  ///
  /// In en, this message translates to:
  /// **'Sensitive Actions'**
  String get settings_sensitive_title;

  /// No description provided for @settings_sensitive_subtitle.
  ///
  /// In en, this message translates to:
  /// **'These actions need confirmation'**
  String get settings_sensitive_subtitle;

  /// No description provided for @settings_delete_location.
  ///
  /// In en, this message translates to:
  /// **'Delete Location Data'**
  String get settings_delete_location;

  /// No description provided for @settings_delete_location_subtitle.
  ///
  /// In en, this message translates to:
  /// **'Prayer and Qibla may be affected until location is updated'**
  String get settings_delete_location_subtitle;

  /// No description provided for @settings_reset_settings.
  ///
  /// In en, this message translates to:
  /// **'Reset Settings'**
  String get settings_reset_settings;

  /// No description provided for @settings_reset_settings_subtitle.
  ///
  /// In en, this message translates to:
  /// **'Restore all default settings'**
  String get settings_reset_settings_subtitle;

  /// No description provided for @settings_cancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get settings_cancel;

  /// No description provided for @settings_delete.
  ///
  /// In en, this message translates to:
  /// **'Delete'**
  String get settings_delete;

  /// No description provided for @settings_confirm.
  ///
  /// In en, this message translates to:
  /// **'OK'**
  String get settings_confirm;

  /// No description provided for @settings_delete_location_dialog_title.
  ///
  /// In en, this message translates to:
  /// **'Delete Location Data'**
  String get settings_delete_location_dialog_title;

  /// No description provided for @settings_delete_location_dialog_message.
  ///
  /// In en, this message translates to:
  /// **'If you continue deleting your location data, prayer times and Qibla direction may not work correctly.\nAre you sure you want to delete it?'**
  String get settings_delete_location_dialog_message;

  /// No description provided for @settings_delete_location_success.
  ///
  /// In en, this message translates to:
  /// **'Location data deleted successfully'**
  String get settings_delete_location_success;

  /// No description provided for @settings_delete_location_error.
  ///
  /// In en, this message translates to:
  /// **'An error occurred while deleting data'**
  String get settings_delete_location_error;

  /// No description provided for @settings_update_location_dialog_title.
  ///
  /// In en, this message translates to:
  /// **'Update Location Data'**
  String get settings_update_location_dialog_title;

  /// No description provided for @settings_update_location_dialog_message.
  ///
  /// In en, this message translates to:
  /// **'Your location coordinates will be fetched for Prayer Times and Qibla features, stored locally, and not accessible to anyone as stated in the Privacy Policy.\nDo you agree to update?'**
  String get settings_update_location_dialog_message;

  /// No description provided for @settings_update_location_success.
  ///
  /// In en, this message translates to:
  /// **'Location data updated successfully'**
  String get settings_update_location_success;

  /// No description provided for @settings_update_location_error.
  ///
  /// In en, this message translates to:
  /// **'An error occurred while updating location'**
  String get settings_update_location_error;

  /// No description provided for @settings_reset_settings_dialog_title.
  ///
  /// In en, this message translates to:
  /// **'Reset Settings'**
  String get settings_reset_settings_dialog_title;

  /// No description provided for @settings_reset_settings_dialog_message.
  ///
  /// In en, this message translates to:
  /// **'Reading, prayer, and alert settings will return to their defaults. Do you want to continue?'**
  String get settings_reset_settings_dialog_message;

  /// No description provided for @settings_reset_settings_confirm.
  ///
  /// In en, this message translates to:
  /// **'Reset'**
  String get settings_reset_settings_confirm;

  /// No description provided for @settings_calc_auto.
  ///
  /// In en, this message translates to:
  /// **'Automatic (based on location)'**
  String get settings_calc_auto;

  /// No description provided for @settings_calc_mwl.
  ///
  /// In en, this message translates to:
  /// **'Muslim World League'**
  String get settings_calc_mwl;

  /// No description provided for @settings_calc_umm_al_qura.
  ///
  /// In en, this message translates to:
  /// **'Umm Al-Qura University (Makkah)'**
  String get settings_calc_umm_al_qura;

  /// No description provided for @settings_calc_egypt.
  ///
  /// In en, this message translates to:
  /// **'Egyptian General Authority of Survey'**
  String get settings_calc_egypt;

  /// No description provided for @settings_calc_karachi.
  ///
  /// In en, this message translates to:
  /// **'University of Islamic Sciences (Karachi)'**
  String get settings_calc_karachi;

  /// No description provided for @settings_calc_turkey.
  ///
  /// In en, this message translates to:
  /// **'Presidency of Religious Affairs (Turkey)'**
  String get settings_calc_turkey;

  /// No description provided for @settings_calc_dubai.
  ///
  /// In en, this message translates to:
  /// **'Islamic Affairs Department (Dubai)'**
  String get settings_calc_dubai;

  /// No description provided for @settings_calc_moon_sighting.
  ///
  /// In en, this message translates to:
  /// **'Moon Sighting Committee'**
  String get settings_calc_moon_sighting;

  /// No description provided for @settings_calc_isna.
  ///
  /// In en, this message translates to:
  /// **'Islamic Society of North America (ISNA)'**
  String get settings_calc_isna;

  /// No description provided for @settings_calc_kuwait.
  ///
  /// In en, this message translates to:
  /// **'Kuwait'**
  String get settings_calc_kuwait;

  /// No description provided for @settings_calc_qatar.
  ///
  /// In en, this message translates to:
  /// **'Qatar'**
  String get settings_calc_qatar;

  /// No description provided for @settings_calc_singapore.
  ///
  /// In en, this message translates to:
  /// **'Singapore'**
  String get settings_calc_singapore;

  /// No description provided for @settings_calc_tehran.
  ///
  /// In en, this message translates to:
  /// **'Institute of Geophysics (University of Tehran)'**
  String get settings_calc_tehran;

  /// No description provided for @settings_color_turquoise.
  ///
  /// In en, this message translates to:
  /// **'Turquoise'**
  String get settings_color_turquoise;

  /// No description provided for @settings_color_olive.
  ///
  /// In en, this message translates to:
  /// **'Olive'**
  String get settings_color_olive;

  /// No description provided for @settings_color_night_blue.
  ///
  /// In en, this message translates to:
  /// **'Night Blue'**
  String get settings_color_night_blue;

  /// No description provided for @settings_color_purple.
  ///
  /// In en, this message translates to:
  /// **'Purple'**
  String get settings_color_purple;

  /// No description provided for @settings_color_maroon.
  ///
  /// In en, this message translates to:
  /// **'Maroon'**
  String get settings_color_maroon;

  /// No description provided for @settings_color_sand.
  ///
  /// In en, this message translates to:
  /// **'Sand'**
  String get settings_color_sand;

  /// No description provided for @settings_color_custom.
  ///
  /// In en, this message translates to:
  /// **'Custom'**
  String get settings_color_custom;

  /// No description provided for @settings_calculation_method_updated.
  ///
  /// In en, this message translates to:
  /// **'Calculation method updated. Please restart the app to ensure accurate times.'**
  String get settings_calculation_method_updated;

  /// No description provided for @settings_madhab_auto_standard.
  ///
  /// In en, this message translates to:
  /// **'Automatic (Shafi, Maliki, Hanbali)'**
  String get settings_madhab_auto_standard;

  /// No description provided for @settings_madhab_updated.
  ///
  /// In en, this message translates to:
  /// **'Madhab updated. Please restart the app to ensure accurate times.'**
  String get settings_madhab_updated;

  /// No description provided for @settings_adkar_font_size_dialog_subtitle.
  ///
  /// In en, this message translates to:
  /// **'Adjust the font size shown on the Adhkar page'**
  String get settings_adkar_font_size_dialog_subtitle;

  /// No description provided for @settings_done.
  ///
  /// In en, this message translates to:
  /// **'Done'**
  String get settings_done;

  /// No description provided for @settings_prayer_notification_selection_title.
  ///
  /// In en, this message translates to:
  /// **'Customize Prayer Notifications'**
  String get settings_prayer_notification_selection_title;

  /// No description provided for @settings_prayer_fajr.
  ///
  /// In en, this message translates to:
  /// **'Fajr Prayer'**
  String get settings_prayer_fajr;

  /// No description provided for @settings_prayer_sunrise.
  ///
  /// In en, this message translates to:
  /// **'Sunrise'**
  String get settings_prayer_sunrise;

  /// No description provided for @settings_prayer_dhuhr.
  ///
  /// In en, this message translates to:
  /// **'Dhuhr Prayer'**
  String get settings_prayer_dhuhr;

  /// No description provided for @settings_prayer_asr.
  ///
  /// In en, this message translates to:
  /// **'Asr Prayer'**
  String get settings_prayer_asr;

  /// No description provided for @settings_prayer_maghrib.
  ///
  /// In en, this message translates to:
  /// **'Maghrib Prayer'**
  String get settings_prayer_maghrib;

  /// No description provided for @settings_prayer_isha.
  ///
  /// In en, this message translates to:
  /// **'Isha Prayer'**
  String get settings_prayer_isha;

  /// No description provided for @settings_adhan_sound.
  ///
  /// In en, this message translates to:
  /// **'Adhan Sound'**
  String get settings_adhan_sound;

  /// No description provided for @settings_in_progress.
  ///
  /// In en, this message translates to:
  /// **'In progress'**
  String get settings_in_progress;

  /// No description provided for @settings_adhan_makkah.
  ///
  /// In en, this message translates to:
  /// **'Adhan of the Grand Mosque in Makkah (Sheikh Ali Mulla)'**
  String get settings_adhan_makkah;

  /// No description provided for @settings_adhan_madinah.
  ///
  /// In en, this message translates to:
  /// **'Adhan of the Prophet’s Mosque (Sheikh Essam Bukhari)'**
  String get settings_adhan_madinah;

  /// No description provided for @settings_adhan_aqsa.
  ///
  /// In en, this message translates to:
  /// **'Adhan of Al-Aqsa Mosque (Jerusalem)'**
  String get settings_adhan_aqsa;

  /// No description provided for @settings_adhan_egypt_refaat.
  ///
  /// In en, this message translates to:
  /// **'Egyptian Adhan (Sheikh Muhammad Rifaat)'**
  String get settings_adhan_egypt_refaat;

  /// No description provided for @settings_adhan_egypt_abdul_basit.
  ///
  /// In en, this message translates to:
  /// **'Egyptian Adhan (Sheikh Abdul Basit Abdus Samad)'**
  String get settings_adhan_egypt_abdul_basit;

  /// No description provided for @settings_adhan_umayyad.
  ///
  /// In en, this message translates to:
  /// **'Group Adhan (Umayyad Mosque, Damascus)'**
  String get settings_adhan_umayyad;

  /// No description provided for @settings_adhan_hijaz.
  ///
  /// In en, this message translates to:
  /// **'Adhan in Hijaz maqam (Madinah style)'**
  String get settings_adhan_hijaz;

  /// No description provided for @settings_adhan_rast.
  ///
  /// In en, this message translates to:
  /// **'Adhan in Rast maqam (Turkish style)'**
  String get settings_adhan_rast;

  /// No description provided for @settings_adhan_saba.
  ///
  /// In en, this message translates to:
  /// **'Adhan in Saba maqam (melancholic style)'**
  String get settings_adhan_saba;

  /// No description provided for @settings_adhan_maghribi.
  ///
  /// In en, this message translates to:
  /// **'Maghrebi Adhan (Kairouan style)'**
  String get settings_adhan_maghribi;

  /// No description provided for @settings_alert_method.
  ///
  /// In en, this message translates to:
  /// **'Alert Method'**
  String get settings_alert_method;

  /// No description provided for @settings_muezzin.
  ///
  /// In en, this message translates to:
  /// **'Muezzin'**
  String get settings_muezzin;

  /// No description provided for @settings_save.
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get settings_save;

  /// No description provided for @settings_audio_mode_adhan.
  ///
  /// In en, this message translates to:
  /// **'Adhan sound'**
  String get settings_audio_mode_adhan;

  /// No description provided for @settings_audio_mode_notification.
  ///
  /// In en, this message translates to:
  /// **'Notification sound'**
  String get settings_audio_mode_notification;

  /// No description provided for @settings_audio_mode_silent_vibration.
  ///
  /// In en, this message translates to:
  /// **'Silent vibration'**
  String get settings_audio_mode_silent_vibration;

  /// No description provided for @settings_adhan_reciter_abdulbaset.
  ///
  /// In en, this message translates to:
  /// **'Abdul Basit Abdus Samad'**
  String get settings_adhan_reciter_abdulbaset;

  /// No description provided for @settings_adhan_reciter_alimulla.
  ///
  /// In en, this message translates to:
  /// **'Ali Ahmed Mulla'**
  String get settings_adhan_reciter_alimulla;

  /// No description provided for @settings_adhan_reciter_alqatami.
  ///
  /// In en, this message translates to:
  /// **'Nasser Al-Qatami'**
  String get settings_adhan_reciter_alqatami;

  /// No description provided for @settings_adhan_reciter_aserehy.
  ///
  /// In en, this message translates to:
  /// **'Essam Al-Suraihi'**
  String get settings_adhan_reciter_aserehy;

  /// No description provided for @settings_adhan_reciter_joshar.
  ///
  /// In en, this message translates to:
  /// **'Ahmed Jawhar'**
  String get settings_adhan_reciter_joshar;

  /// No description provided for @settings_adhan_reciter_kefah.
  ///
  /// In en, this message translates to:
  /// **'Kifah Al-Azzawi'**
  String get settings_adhan_reciter_kefah;

  /// No description provided for @settings_adhan_reciter_riad.
  ///
  /// In en, this message translates to:
  /// **'Riad Al-Naqshbandi'**
  String get settings_adhan_reciter_riad;

  /// No description provided for @home_notifications_tooltip.
  ///
  /// In en, this message translates to:
  /// **'Notifications'**
  String get home_notifications_tooltip;

  /// No description provided for @home_about_semantics.
  ///
  /// In en, this message translates to:
  /// **'About and share Zad Al-Muslim'**
  String get home_about_semantics;

  /// No description provided for @home_about_tooltip.
  ///
  /// In en, this message translates to:
  /// **'About the app'**
  String get home_about_tooltip;

  /// No description provided for @home_hijri_date_title.
  ///
  /// In en, this message translates to:
  /// **'Hijri Date'**
  String get home_hijri_date_title;

  /// No description provided for @home_hijri_date_subtitle.
  ///
  /// In en, this message translates to:
  /// **'Today’s date according to the Hijri calendar'**
  String get home_hijri_date_subtitle;

  /// No description provided for @home_hijri_label.
  ///
  /// In en, this message translates to:
  /// **'Hijri'**
  String get home_hijri_label;

  /// No description provided for @home_gregorian_date_title.
  ///
  /// In en, this message translates to:
  /// **'Gregorian Date'**
  String get home_gregorian_date_title;

  /// No description provided for @home_gregorian_date_subtitle.
  ///
  /// In en, this message translates to:
  /// **'Today’s date according to the Gregorian calendar'**
  String get home_gregorian_date_subtitle;

  /// No description provided for @home_gregorian_label.
  ///
  /// In en, this message translates to:
  /// **'Gregorian'**
  String get home_gregorian_label;

  /// No description provided for @home_daily_message_morning.
  ///
  /// In en, this message translates to:
  /// **'Start your day with remembrance of Allah and reciting His Book'**
  String get home_daily_message_morning;

  /// No description provided for @home_daily_message_midday.
  ///
  /// In en, this message translates to:
  /// **'Your daily companion for Quran and Adhkar'**
  String get home_daily_message_midday;

  /// No description provided for @home_daily_message_evening.
  ///
  /// In en, this message translates to:
  /// **'End your day with what brings you closer to Allah'**
  String get home_daily_message_evening;

  /// No description provided for @home_daily_message_night.
  ///
  /// In en, this message translates to:
  /// **'Let remembrance of Allah be the last thing you end your day with'**
  String get home_daily_message_night;

  /// No description provided for @home_about_dialog_title.
  ///
  /// In en, this message translates to:
  /// **'Behind the App'**
  String get home_about_dialog_title;

  /// No description provided for @home_about_dialog_body.
  ///
  /// In en, this message translates to:
  /// **'Behind this simple screen and these organized lines of code is a long journey of passion, late nights, and continuous learning. Through this project, I wanted to offer you a daily faith companion that combines ease of use, beautiful design, and smooth performance without ads disturbing your quiet moments with remembrance of Allah.'**
  String get home_about_dialog_body;

  /// No description provided for @home_share_text.
  ///
  /// In en, this message translates to:
  /// **'I recommend the Zad Al-Muslim app, your daily companion for Adhkar and supplications, with no ads and a smooth, polished experience.\n\nhttps://play.google.com/store/apps/details?id=com.shirahsoft_muslim.adnan'**
  String get home_share_text;

  /// No description provided for @home_share_reward.
  ///
  /// In en, this message translates to:
  /// **'Share the reward'**
  String get home_share_reward;

  /// No description provided for @hijri_muharram.
  ///
  /// In en, this message translates to:
  /// **'Muharram'**
  String get hijri_muharram;

  /// No description provided for @hijri_safar.
  ///
  /// In en, this message translates to:
  /// **'Safar'**
  String get hijri_safar;

  /// No description provided for @hijri_rabi_al_awwal.
  ///
  /// In en, this message translates to:
  /// **'Rabi al-Awwal'**
  String get hijri_rabi_al_awwal;

  /// No description provided for @hijri_rabi_al_thani.
  ///
  /// In en, this message translates to:
  /// **'Rabi al-Thani'**
  String get hijri_rabi_al_thani;

  /// No description provided for @hijri_jumada_al_awwal.
  ///
  /// In en, this message translates to:
  /// **'Jumada al-Awwal'**
  String get hijri_jumada_al_awwal;

  /// No description provided for @hijri_jumada_al_thani.
  ///
  /// In en, this message translates to:
  /// **'Jumada al-Thani'**
  String get hijri_jumada_al_thani;

  /// No description provided for @hijri_rajab.
  ///
  /// In en, this message translates to:
  /// **'Rajab'**
  String get hijri_rajab;

  /// No description provided for @hijri_shaban.
  ///
  /// In en, this message translates to:
  /// **'Shaaban'**
  String get hijri_shaban;

  /// No description provided for @hijri_ramadan.
  ///
  /// In en, this message translates to:
  /// **'Ramadan'**
  String get hijri_ramadan;

  /// No description provided for @hijri_shawwal.
  ///
  /// In en, this message translates to:
  /// **'Shawwal'**
  String get hijri_shawwal;

  /// No description provided for @hijri_dhu_al_qadah.
  ///
  /// In en, this message translates to:
  /// **'Dhu al-Qadah'**
  String get hijri_dhu_al_qadah;

  /// No description provided for @hijri_dhu_al_hijjah.
  ///
  /// In en, this message translates to:
  /// **'Dhu al-Hijjah'**
  String get hijri_dhu_al_hijjah;

  /// No description provided for @home_prayer_location_not_allowed.
  ///
  /// In en, this message translates to:
  /// **'Location sharing has not been allowed'**
  String get home_prayer_location_not_allowed;

  /// No description provided for @home_prayer_load_error.
  ///
  /// In en, this message translates to:
  /// **'Could not load prayer times'**
  String get home_prayer_load_error;

  /// No description provided for @home_next_prayer.
  ///
  /// In en, this message translates to:
  /// **'Next Prayer'**
  String get home_next_prayer;

  /// No description provided for @home_prayer_time_close.
  ///
  /// In en, this message translates to:
  /// **'Almost time'**
  String get home_prayer_time_close;

  /// No description provided for @home_today_prayer_times.
  ///
  /// In en, this message translates to:
  /// **'Today’s times'**
  String get home_today_prayer_times;

  /// No description provided for @home_prayer_time_label.
  ///
  /// In en, this message translates to:
  /// **'Prayer time'**
  String get home_prayer_time_label;

  /// No description provided for @home_prayer_due_now_label.
  ///
  /// In en, this message translates to:
  /// **'Prayer time'**
  String get home_prayer_due_now_label;

  /// No description provided for @home_prayer_remaining_label.
  ///
  /// In en, this message translates to:
  /// **'Time remaining'**
  String get home_prayer_remaining_label;

  /// No description provided for @home_show_all_prayer_times.
  ///
  /// In en, this message translates to:
  /// **'Show all prayer times'**
  String get home_show_all_prayer_times;

  /// No description provided for @home_prayer_calculating.
  ///
  /// In en, this message translates to:
  /// **'Calculating prayer times'**
  String get home_prayer_calculating;

  /// No description provided for @home_prayer_card_subtitle.
  ///
  /// In en, this message translates to:
  /// **'Follow prayer times moment by moment'**
  String get home_prayer_card_subtitle;

  /// No description provided for @home_go_to_prayer_times.
  ///
  /// In en, this message translates to:
  /// **'Go to Prayer Times'**
  String get home_go_to_prayer_times;

  /// No description provided for @home_prayer_status_due.
  ///
  /// In en, this message translates to:
  /// **'It is time for prayer'**
  String get home_prayer_status_due;

  /// No description provided for @home_prayer_status_close.
  ///
  /// In en, this message translates to:
  /// **'Prayer time is near'**
  String get home_prayer_status_close;

  /// No description provided for @home_prayer_status_soon.
  ///
  /// In en, this message translates to:
  /// **'Not much time left'**
  String get home_prayer_status_soon;

  /// No description provided for @home_prayer_status_prepare.
  ///
  /// In en, this message translates to:
  /// **'Prepare for the next prayer'**
  String get home_prayer_status_prepare;

  /// No description provided for @home_remaining_less_than_minute.
  ///
  /// In en, this message translates to:
  /// **'In less than a minute'**
  String get home_remaining_less_than_minute;

  /// No description provided for @home_remaining_hours_minutes.
  ///
  /// In en, this message translates to:
  /// **'In {hours} h {minutes} min'**
  String home_remaining_hours_minutes(int hours, int minutes);

  /// No description provided for @home_remaining_one_hour.
  ///
  /// In en, this message translates to:
  /// **'In one hour'**
  String get home_remaining_one_hour;

  /// No description provided for @home_remaining_hours.
  ///
  /// In en, this message translates to:
  /// **'In {hours} hours'**
  String home_remaining_hours(int hours);

  /// No description provided for @home_remaining_minutes.
  ///
  /// In en, this message translates to:
  /// **'In {minutes} minutes'**
  String home_remaining_minutes(int minutes);

  /// No description provided for @home_reading_empty_body.
  ///
  /// In en, this message translates to:
  /// **'Start your journey with the Holy Quran, and save your place to continue from where you stopped.'**
  String get home_reading_empty_body;

  /// No description provided for @home_reading_start_title.
  ///
  /// In en, this message translates to:
  /// **'Start Quran Recitation'**
  String get home_reading_start_title;

  /// No description provided for @home_reading_continue_title.
  ///
  /// In en, this message translates to:
  /// **'Continue Reading'**
  String get home_reading_continue_title;

  /// No description provided for @home_reading_start_subtitle.
  ///
  /// In en, this message translates to:
  /// **'Your journey with the Book of Allah starts here'**
  String get home_reading_start_subtitle;

  /// No description provided for @home_reading_progress_semantics.
  ///
  /// In en, this message translates to:
  /// **'Reading progress {percent} percent'**
  String home_reading_progress_semantics(int percent);

  /// No description provided for @home_reading_position_page.
  ///
  /// In en, this message translates to:
  /// **'Your place: page {page}'**
  String home_reading_position_page(int page);

  /// No description provided for @home_reading_position_ayah_page.
  ///
  /// In en, this message translates to:
  /// **'Your place: ayah {ayah} • page {page}'**
  String home_reading_position_ayah_page(int ayah, int page);

  /// No description provided for @home_reading_remaining_pages.
  ///
  /// In en, this message translates to:
  /// **'Remaining: {pages} pages'**
  String home_reading_remaining_pages(int pages);

  /// No description provided for @home_reading_continue_action.
  ///
  /// In en, this message translates to:
  /// **'Continue reading'**
  String get home_reading_continue_action;

  /// No description provided for @home_reading_start_action.
  ///
  /// In en, this message translates to:
  /// **'Start reading'**
  String get home_reading_start_action;

  /// No description provided for @home_reading_surah_page.
  ///
  /// In en, this message translates to:
  /// **'Surah {surah} • page {page}'**
  String home_reading_surah_page(String surah, int page);

  /// No description provided for @home_reading_surah_ayah_page.
  ///
  /// In en, this message translates to:
  /// **'Surah {surah} • ayah {ayah} • page {page}'**
  String home_reading_surah_ayah_page(String surah, int ayah, int page);

  /// No description provided for @home_moratal_title.
  ///
  /// In en, this message translates to:
  /// **'Quran Recitation'**
  String get home_moratal_title;

  /// No description provided for @home_moratal_subtitle.
  ///
  /// In en, this message translates to:
  /// **'Listen and download'**
  String get home_moratal_subtitle;

  /// No description provided for @home_moratal_action.
  ///
  /// In en, this message translates to:
  /// **'Listen now'**
  String get home_moratal_action;

  /// No description provided for @home_adkar_action.
  ///
  /// In en, this message translates to:
  /// **'Settle your heart with remembrance of Allah'**
  String get home_adkar_action;

  /// No description provided for @home_qibla_subtitle.
  ///
  /// In en, this message translates to:
  /// **'Find the direction'**
  String get home_qibla_subtitle;

  /// No description provided for @home_qibla_action.
  ///
  /// In en, this message translates to:
  /// **'Compass is ready'**
  String get home_qibla_action;

  /// No description provided for @home_sunnah_subtitle.
  ///
  /// In en, this message translates to:
  /// **'Hadith and Prophetic guidance'**
  String get home_sunnah_subtitle;

  /// No description provided for @home_sunnah_action.
  ///
  /// In en, this message translates to:
  /// **'Browse Hadith'**
  String get home_sunnah_action;

  /// No description provided for @home_daily_adkar.
  ///
  /// In en, this message translates to:
  /// **'Daily Adhkar'**
  String get home_daily_adkar;

  /// No description provided for @home_daily_services_title.
  ///
  /// In en, this message translates to:
  /// **'Your Daily Services'**
  String get home_daily_services_title;

  /// No description provided for @home_daily_services_subtitle.
  ///
  /// In en, this message translates to:
  /// **'Quran, Adhkar, and Sunnah at your fingertips'**
  String get home_daily_services_subtitle;

  /// No description provided for @notifications_page_subtitle.
  ///
  /// In en, this message translates to:
  /// **'Follow the latest alerts'**
  String get notifications_page_subtitle;

  /// No description provided for @notifications_empty_title.
  ///
  /// In en, this message translates to:
  /// **'No notifications'**
  String get notifications_empty_title;

  /// No description provided for @notifications_empty_subtitle.
  ///
  /// In en, this message translates to:
  /// **'We will let you know when a new notification arrives'**
  String get notifications_empty_subtitle;

  /// No description provided for @notifications_delete_tooltip.
  ///
  /// In en, this message translates to:
  /// **'Delete notification'**
  String get notifications_delete_tooltip;

  /// No description provided for @retry.
  ///
  /// In en, this message translates to:
  /// **'Retry'**
  String get retry;

  /// No description provided for @duaa_shared_from_app.
  ///
  /// In en, this message translates to:
  /// **'From the Zad Al-Muslim app'**
  String get duaa_shared_from_app;

  /// No description provided for @duaa_daily_subtitle.
  ///
  /// In en, this message translates to:
  /// **'A selected supplication refreshed every day'**
  String get duaa_daily_subtitle;

  /// No description provided for @duaa_show_less.
  ///
  /// In en, this message translates to:
  /// **'Show less'**
  String get duaa_show_less;

  /// No description provided for @duaa_show_full.
  ///
  /// In en, this message translates to:
  /// **'Show full supplication'**
  String get duaa_show_full;

  /// No description provided for @duaa_copy_action.
  ///
  /// In en, this message translates to:
  /// **'Copy supplication'**
  String get duaa_copy_action;

  /// No description provided for @duaa_share_action.
  ///
  /// In en, this message translates to:
  /// **'Share'**
  String get duaa_share_action;

  /// No description provided for @duaa_copied_message.
  ///
  /// In en, this message translates to:
  /// **'Supplication copied'**
  String get duaa_copied_message;

  /// No description provided for @duaa_load_error.
  ///
  /// In en, this message translates to:
  /// **'Could not load today\'s supplication'**
  String get duaa_load_error;

  /// No description provided for @quick_adkar_title.
  ///
  /// In en, this message translates to:
  /// **'Adhkar Shortcuts'**
  String get quick_adkar_title;

  /// No description provided for @quick_adkar_subtitle.
  ///
  /// In en, this message translates to:
  /// **'Quick access to your daily Adhkar'**
  String get quick_adkar_subtitle;

  /// No description provided for @quick_adkar_morning_evening.
  ///
  /// In en, this message translates to:
  /// **'Morning & Evening'**
  String get quick_adkar_morning_evening;

  /// No description provided for @quick_adkar_sleep.
  ///
  /// In en, this message translates to:
  /// **'Sleep Adhkar'**
  String get quick_adkar_sleep;

  /// No description provided for @quick_adkar_after_prayer.
  ///
  /// In en, this message translates to:
  /// **'After Prayer'**
  String get quick_adkar_after_prayer;

  /// No description provided for @quick_adkar_wake_up.
  ///
  /// In en, this message translates to:
  /// **'Wake Up'**
  String get quick_adkar_wake_up;

  /// No description provided for @quick_adkar_worry_sadness.
  ///
  /// In en, this message translates to:
  /// **'Worry & Sadness'**
  String get quick_adkar_worry_sadness;

  /// No description provided for @quick_adkar_forgiveness.
  ///
  /// In en, this message translates to:
  /// **'Forgiveness'**
  String get quick_adkar_forgiveness;

  /// No description provided for @quick_adkar_recommended_now.
  ///
  /// In en, this message translates to:
  /// **'Suggested now'**
  String get quick_adkar_recommended_now;

  /// No description provided for @quick_adkar_open.
  ///
  /// In en, this message translates to:
  /// **'Open Dhikr'**
  String get quick_adkar_open;

  /// No description provided for @quick_adkar_unavailable.
  ///
  /// In en, this message translates to:
  /// **'Unavailable'**
  String get quick_adkar_unavailable;

  /// No description provided for @quick_adkar_load_error.
  ///
  /// In en, this message translates to:
  /// **'Could not load Adhkar shortcuts'**
  String get quick_adkar_load_error;

  /// No description provided for @adkar_details_count.
  ///
  /// In en, this message translates to:
  /// **'{count} Adhkar and supplications'**
  String adkar_details_count(int count);

  /// No description provided for @adkar_details_item_number.
  ///
  /// In en, this message translates to:
  /// **'Dhikr #{index}'**
  String adkar_details_item_number(int index);

  /// No description provided for @adkar_details_completed_semantics.
  ///
  /// In en, this message translates to:
  /// **'Dhikr completed'**
  String get adkar_details_completed_semantics;

  /// No description provided for @adkar_details_remaining_semantics.
  ///
  /// In en, this message translates to:
  /// **'{count} repetitions remaining'**
  String adkar_details_remaining_semantics(int count);

  /// No description provided for @adkar_details_completed_short.
  ///
  /// In en, this message translates to:
  /// **'Done'**
  String get adkar_details_completed_short;

  /// No description provided for @adkar_details_dialog_title.
  ///
  /// In en, this message translates to:
  /// **'Dhikr Details'**
  String get adkar_details_dialog_title;

  /// No description provided for @adkar_details_footnote_title.
  ///
  /// In en, this message translates to:
  /// **'Hadith reference / note'**
  String get adkar_details_footnote_title;

  /// No description provided for @adkar_no_data.
  ///
  /// In en, this message translates to:
  /// **'No Adhkar data available.'**
  String get adkar_no_data;

  /// No description provided for @adkar_search_hint.
  ///
  /// In en, this message translates to:
  /// **'Search Adhkar...'**
  String get adkar_search_hint;

  /// No description provided for @adkar_virtues_title.
  ///
  /// In en, this message translates to:
  /// **'Virtues of Dhikr'**
  String get adkar_virtues_title;

  /// No description provided for @adkar_show_more_virtues.
  ///
  /// In en, this message translates to:
  /// **'Show more virtues'**
  String get adkar_show_more_virtues;

  /// No description provided for @adkar_header_subtitle.
  ///
  /// In en, this message translates to:
  /// **'Your daily protection through Dhikr and supplication'**
  String get adkar_header_subtitle;

  /// No description provided for @adkar_empty_search.
  ///
  /// In en, this message translates to:
  /// **'No results for “{query}”'**
  String adkar_empty_search(String query);

  /// No description provided for @adkar_load_error.
  ///
  /// In en, this message translates to:
  /// **'Could not load Adhkar'**
  String get adkar_load_error;

  /// No description provided for @qibla_magnetic_warning.
  ///
  /// In en, this message translates to:
  /// **'For the best accuracy, keep away from electrical devices and metal objects.'**
  String get qibla_magnetic_warning;

  /// No description provided for @qibla_angle_label.
  ///
  /// In en, this message translates to:
  /// **'Qibla angle'**
  String get qibla_angle_label;

  /// No description provided for @qibla_distance_label.
  ///
  /// In en, this message translates to:
  /// **'Distance to Kaaba'**
  String get qibla_distance_label;

  /// No description provided for @qibla_distance_km.
  ///
  /// In en, this message translates to:
  /// **'{distance} km'**
  String qibla_distance_km(String distance);

  /// No description provided for @qibla_calibration_tip.
  ///
  /// In en, this message translates to:
  /// **'Move the phone in a figure-eight shape if the compass direction seems unstable.'**
  String get qibla_calibration_tip;

  /// No description provided for @qibla_compass_loading.
  ///
  /// In en, this message translates to:
  /// **'Loading compass...'**
  String get qibla_compass_loading;

  /// No description provided for @qibla_no_sensor_title.
  ///
  /// In en, this message translates to:
  /// **'Sensor unavailable'**
  String get qibla_no_sensor_title;

  /// No description provided for @qibla_no_sensor_subtitle.
  ///
  /// In en, this message translates to:
  /// **'Your device does not have the magnetic sensor (magnetometer) required to determine compass direction.'**
  String get qibla_no_sensor_subtitle;

  /// No description provided for @qibla_no_location_title.
  ///
  /// In en, this message translates to:
  /// **'Location not set'**
  String get qibla_no_location_title;

  /// No description provided for @qibla_no_location_subtitle.
  ///
  /// In en, this message translates to:
  /// **'You have not allowed location sharing, so Qibla direction cannot be calculated. You can grant location permission now to use this feature.'**
  String get qibla_no_location_subtitle;

  /// No description provided for @qibla_find_my_location.
  ///
  /// In en, this message translates to:
  /// **'Find my location'**
  String get qibla_find_my_location;

  /// No description provided for @qibla_header_subtitle.
  ///
  /// In en, this message translates to:
  /// **'Find the direction of the Kaaba accurately'**
  String get qibla_header_subtitle;

  /// No description provided for @qibla_aligned.
  ///
  /// In en, this message translates to:
  /// **'You are facing the Qibla'**
  String get qibla_aligned;

  /// No description provided for @qibla_heading_north.
  ///
  /// In en, this message translates to:
  /// **'North - {degrees}°'**
  String qibla_heading_north(String degrees);

  /// No description provided for @qibla_heading_north_east.
  ///
  /// In en, this message translates to:
  /// **'North East - {degrees}°'**
  String qibla_heading_north_east(String degrees);

  /// No description provided for @qibla_heading_east.
  ///
  /// In en, this message translates to:
  /// **'East - {degrees}°'**
  String qibla_heading_east(String degrees);

  /// No description provided for @qibla_heading_south_east.
  ///
  /// In en, this message translates to:
  /// **'South East - {degrees}°'**
  String qibla_heading_south_east(String degrees);

  /// No description provided for @qibla_heading_south.
  ///
  /// In en, this message translates to:
  /// **'South - {degrees}°'**
  String qibla_heading_south(String degrees);

  /// No description provided for @qibla_heading_south_west.
  ///
  /// In en, this message translates to:
  /// **'South West - {degrees}°'**
  String qibla_heading_south_west(String degrees);

  /// No description provided for @qibla_heading_west.
  ///
  /// In en, this message translates to:
  /// **'West - {degrees}°'**
  String qibla_heading_west(String degrees);

  /// No description provided for @qibla_heading_north_west.
  ///
  /// In en, this message translates to:
  /// **'North West - {degrees}°'**
  String qibla_heading_north_west(String degrees);

  /// No description provided for @hadith_tab_all.
  ///
  /// In en, this message translates to:
  /// **'Hadiths'**
  String get hadith_tab_all;

  /// No description provided for @hadith_tab_favorites.
  ///
  /// In en, this message translates to:
  /// **'Favorites'**
  String get hadith_tab_favorites;

  /// No description provided for @hadith_header_title.
  ///
  /// In en, this message translates to:
  /// **'Sunnah & Hadith'**
  String get hadith_header_title;

  /// No description provided for @hadith_header_subtitle.
  ///
  /// In en, this message translates to:
  /// **'From the guidance of the Prophet ﷺ and his authentic Sunnah'**
  String get hadith_header_subtitle;

  /// No description provided for @hadith_filter_book.
  ///
  /// In en, this message translates to:
  /// **'Book'**
  String get hadith_filter_book;

  /// No description provided for @hadith_load_error.
  ///
  /// In en, this message translates to:
  /// **'Error loading Hadiths: {error}'**
  String hadith_load_error(String error);

  /// No description provided for @hadith_clear_filters.
  ///
  /// In en, this message translates to:
  /// **'Clear filters'**
  String get hadith_clear_filters;

  /// No description provided for @hadith_empty_title.
  ///
  /// In en, this message translates to:
  /// **'No matching results'**
  String get hadith_empty_title;

  /// No description provided for @hadith_empty_subtitle.
  ///
  /// In en, this message translates to:
  /// **'Try changing the search phrase or removing some filters.'**
  String get hadith_empty_subtitle;

  /// No description provided for @hadith_error.
  ///
  /// In en, this message translates to:
  /// **'An error occurred: {error}'**
  String hadith_error(String error);

  /// No description provided for @hadith_favorites_empty_title.
  ///
  /// In en, this message translates to:
  /// **'Your favorites are waiting'**
  String get hadith_favorites_empty_title;

  /// No description provided for @hadith_favorites_empty_subtitle.
  ///
  /// In en, this message translates to:
  /// **'Tap the star beside any Hadith to save it and return to it easily.'**
  String get hadith_favorites_empty_subtitle;

  /// No description provided for @hadith_search_hint.
  ///
  /// In en, this message translates to:
  /// **'Search Hadiths...'**
  String get hadith_search_hint;

  /// No description provided for @hadith_book_label.
  ///
  /// In en, this message translates to:
  /// **'Book {bookName}'**
  String hadith_book_label(String bookName);

  /// No description provided for @hadith_remove_favorite.
  ///
  /// In en, this message translates to:
  /// **'Remove from favorites'**
  String get hadith_remove_favorite;

  /// No description provided for @hadith_add_favorite.
  ///
  /// In en, this message translates to:
  /// **'Add to favorites'**
  String get hadith_add_favorite;

  /// No description provided for @hadith_tap_to_read.
  ///
  /// In en, this message translates to:
  /// **'Tap to read the full Hadith'**
  String get hadith_tap_to_read;

  /// No description provided for @hadith_text_title.
  ///
  /// In en, this message translates to:
  /// **'Hadith Text'**
  String get hadith_text_title;

  /// No description provided for @hadith_source_bukhari.
  ///
  /// In en, this message translates to:
  /// **'Sahih al-Bukhari'**
  String get hadith_source_bukhari;

  /// No description provided for @hadith_share_reference.
  ///
  /// In en, this message translates to:
  /// **'Sahih al-Bukhari | Book {bookName} - Hadith No. {hadithNumber}'**
  String hadith_share_reference(String bookName, int hadithNumber);

  /// No description provided for @hadith_number_label.
  ///
  /// In en, this message translates to:
  /// **'Hadith number'**
  String get hadith_number_label;

  /// No description provided for @hadith_source_label.
  ///
  /// In en, this message translates to:
  /// **'Source'**
  String get hadith_source_label;

  /// No description provided for @hadith_book_belief.
  ///
  /// In en, this message translates to:
  /// **'Faith'**
  String get hadith_book_belief;

  /// No description provided for @hadith_book_salat.
  ///
  /// In en, this message translates to:
  /// **'Prayer'**
  String get hadith_book_salat;

  /// No description provided for @hadith_book_knowledge.
  ///
  /// In en, this message translates to:
  /// **'Knowledge'**
  String get hadith_book_knowledge;

  /// No description provided for @hadith_book_sales.
  ///
  /// In en, this message translates to:
  /// **'Sales and Trade'**
  String get hadith_book_sales;

  /// No description provided for @hadith_book_adab.
  ///
  /// In en, this message translates to:
  /// **'Good Manners'**
  String get hadith_book_adab;

  /// No description provided for @hadith_book_riqaq.
  ///
  /// In en, this message translates to:
  /// **'Softening the Hearts'**
  String get hadith_book_riqaq;

  /// No description provided for @hadith_book_invocations.
  ///
  /// In en, this message translates to:
  /// **'Invocations'**
  String get hadith_book_invocations;

  /// No description provided for @hadith_book_tawhid.
  ///
  /// In en, this message translates to:
  /// **'Monotheism'**
  String get hadith_book_tawhid;

  /// No description provided for @quran_select_qari_title.
  ///
  /// In en, this message translates to:
  /// **'Select Reciter'**
  String get quran_select_qari_title;

  /// No description provided for @quran_index_title.
  ///
  /// In en, this message translates to:
  /// **'Mushaf Index'**
  String get quran_index_title;

  /// No description provided for @quran_index_subtitle.
  ///
  /// In en, this message translates to:
  /// **'Choose a Surah or Juz to start reading'**
  String get quran_index_subtitle;

  /// No description provided for @quran_surahs_tab.
  ///
  /// In en, this message translates to:
  /// **'Surahs'**
  String get quran_surahs_tab;

  /// No description provided for @quran_juz_tab.
  ///
  /// In en, this message translates to:
  /// **'Juz'**
  String get quran_juz_tab;

  /// No description provided for @quran_ayah_count.
  ///
  /// In en, this message translates to:
  /// **'{count} verses'**
  String quran_ayah_count(int count);

  /// No description provided for @quran_juz_number.
  ///
  /// In en, this message translates to:
  /// **'Juz {number}'**
  String quran_juz_number(int number);

  /// No description provided for @quran_surah_label.
  ///
  /// In en, this message translates to:
  /// **'Surah {surahName}'**
  String quran_surah_label(String surahName);

  /// No description provided for @quran_page_number.
  ///
  /// In en, this message translates to:
  /// **'Page {pageNumber}'**
  String quran_page_number(int pageNumber);

  /// No description provided for @quran_ayah_number.
  ///
  /// In en, this message translates to:
  /// **'Ayah {ayahNumber}'**
  String quran_ayah_number(int ayahNumber);

  /// No description provided for @quran_check_internet.
  ///
  /// In en, this message translates to:
  /// **'Please check your internet connection.'**
  String get quran_check_internet;

  /// No description provided for @quran_size_mb.
  ///
  /// In en, this message translates to:
  /// **'{size} MB'**
  String quran_size_mb(String size);

  /// No description provided for @moratal_download_quran_title.
  ///
  /// In en, this message translates to:
  /// **'Download the Holy Quran'**
  String get moratal_download_quran_title;

  /// No description provided for @moratal_download_quran_subtitle.
  ///
  /// In en, this message translates to:
  /// **'Download complete Quran Surahs to listen offline anytime.'**
  String get moratal_download_quran_subtitle;

  /// No description provided for @moratal_header_subtitle.
  ///
  /// In en, this message translates to:
  /// **'Choose your favorite reciter and listen with focus'**
  String get moratal_header_subtitle;

  /// No description provided for @moratal_manage_downloads.
  ///
  /// In en, this message translates to:
  /// **'Manage downloads'**
  String get moratal_manage_downloads;

  /// No description provided for @moratal_narration_warsh.
  ///
  /// In en, this message translates to:
  /// **'Warsh narration from Nafi'**
  String get moratal_narration_warsh;

  /// No description provided for @moratal_narration_dorai.
  ///
  /// In en, this message translates to:
  /// **'Al-Duri narration from Al-Kisa\'i'**
  String get moratal_narration_dorai;

  /// No description provided for @moratal_narration_hafs.
  ///
  /// In en, this message translates to:
  /// **'Hafs narration from Asim'**
  String get moratal_narration_hafs;

  /// No description provided for @moratal_downloading_surah_progress.
  ///
  /// In en, this message translates to:
  /// **'Downloading Surah {current} of 114'**
  String moratal_downloading_surah_progress(int current);

  /// No description provided for @moratal_show_surahs.
  ///
  /// In en, this message translates to:
  /// **'Show Surahs'**
  String get moratal_show_surahs;

  /// No description provided for @moratal_all_surahs_downloaded.
  ///
  /// In en, this message translates to:
  /// **'All Surahs are downloaded. You can listen offline!'**
  String get moratal_all_surahs_downloaded;

  /// No description provided for @moratal_download_stopped_for_qari.
  ///
  /// In en, this message translates to:
  /// **'Stopped downloading Surahs for {qariName}'**
  String moratal_download_stopped_for_qari(String qariName);

  /// No description provided for @moratal_resuming_download_for_qari.
  ///
  /// In en, this message translates to:
  /// **'Resuming Surah downloads for {qariName}'**
  String moratal_resuming_download_for_qari(String qariName);

  /// No description provided for @moratal_started_download_for_qari.
  ///
  /// In en, this message translates to:
  /// **'Started downloading Surahs for {qariName}'**
  String moratal_started_download_for_qari(String qariName);

  /// No description provided for @moratal_default_qari.
  ///
  /// In en, this message translates to:
  /// **'the reciter'**
  String get moratal_default_qari;

  /// No description provided for @moratal_resume_download_title.
  ///
  /// In en, this message translates to:
  /// **'Resume Download'**
  String get moratal_resume_download_title;

  /// No description provided for @moratal_download_all_title.
  ///
  /// In en, this message translates to:
  /// **'Download Quran Surahs'**
  String get moratal_download_all_title;

  /// No description provided for @moratal_resume_download_message.
  ///
  /// In en, this message translates to:
  /// **'Quran Surahs recited by {qariName} will resume downloading from where they stopped.'**
  String moratal_resume_download_message(String qariName);

  /// No description provided for @moratal_download_all_message.
  ///
  /// In en, this message translates to:
  /// **'All Holy Quran Surahs (114 Surahs) recited by {qariName} will be downloaded to your device.'**
  String moratal_download_all_message(String qariName);

  /// No description provided for @moratal_download_data_warning.
  ///
  /// In en, this message translates to:
  /// **'This process may use between 500 MB and 2 GB of internet data.'**
  String get moratal_download_data_warning;

  /// No description provided for @moratal_download_keep_open_warning.
  ///
  /// In en, this message translates to:
  /// **'Please keep the app open until the download completes. You can resume anytime if the app closes.'**
  String get moratal_download_keep_open_warning;

  /// No description provided for @moratal_resume.
  ///
  /// In en, this message translates to:
  /// **'Resume'**
  String get moratal_resume;

  /// No description provided for @moratal_download_now.
  ///
  /// In en, this message translates to:
  /// **'Download now'**
  String get moratal_download_now;

  /// No description provided for @moratal_stop_download_title.
  ///
  /// In en, this message translates to:
  /// **'Stop Download'**
  String get moratal_stop_download_title;

  /// No description provided for @moratal_stop_download_message.
  ///
  /// In en, this message translates to:
  /// **'Do you want to stop the download?\nDownloaded Surahs will be saved, and you can resume later.'**
  String get moratal_stop_download_message;

  /// No description provided for @moratal_continue_download.
  ///
  /// In en, this message translates to:
  /// **'Continue download'**
  String get moratal_continue_download;

  /// No description provided for @moratal_stop.
  ///
  /// In en, this message translates to:
  /// **'Stop'**
  String get moratal_stop;

  /// No description provided for @moratal_deleted_all_for_qari.
  ///
  /// In en, this message translates to:
  /// **'Deleted all Surahs of {qariName} from the device.'**
  String moratal_deleted_all_for_qari(String qariName);

  /// No description provided for @moratal_delete_downloaded_title.
  ///
  /// In en, this message translates to:
  /// **'Delete Downloaded Surahs'**
  String get moratal_delete_downloaded_title;

  /// No description provided for @moratal_delete_downloaded_message.
  ///
  /// In en, this message translates to:
  /// **'{count} downloaded Surahs recited by {qariName} will be deleted from your device.\nThis action cannot be undone.'**
  String moratal_delete_downloaded_message(int count, String qariName);

  /// No description provided for @moratal_surahs_title.
  ///
  /// In en, this message translates to:
  /// **'Holy Quran Surahs'**
  String get moratal_surahs_title;

  /// No description provided for @moratal_download_surah.
  ///
  /// In en, this message translates to:
  /// **'Download Surah'**
  String get moratal_download_surah;

  /// No description provided for @moratal_delete_surah.
  ///
  /// In en, this message translates to:
  /// **'Delete Surah'**
  String get moratal_delete_surah;

  /// No description provided for @moratal_cancel_download.
  ///
  /// In en, this message translates to:
  /// **'Cancel download'**
  String get moratal_cancel_download;

  /// No description provided for @moratal_surah_downloaded_success.
  ///
  /// In en, this message translates to:
  /// **'Surah {surahName} downloaded successfully'**
  String moratal_surah_downloaded_success(String surahName);

  /// No description provided for @moratal_surah_deleted_success.
  ///
  /// In en, this message translates to:
  /// **'Surah {surahName} deleted from the device'**
  String moratal_surah_deleted_success(String surahName);

  /// No description provided for @moratal_cancelled_temp_deleted.
  ///
  /// In en, this message translates to:
  /// **'Download cancelled and temporary file deleted.'**
  String get moratal_cancelled_temp_deleted;

  /// No description provided for @moratal_delete_surah_message.
  ///
  /// In en, this message translates to:
  /// **'Do you want to delete this Surah from the device?\nThis action cannot be undone.'**
  String get moratal_delete_surah_message;

  /// No description provided for @moratal_enable_repeat.
  ///
  /// In en, this message translates to:
  /// **'Enable repeat'**
  String get moratal_enable_repeat;

  /// No description provided for @moratal_repeat_all.
  ///
  /// In en, this message translates to:
  /// **'Repeat all'**
  String get moratal_repeat_all;

  /// No description provided for @moratal_disable_repeat.
  ///
  /// In en, this message translates to:
  /// **'Turn off repeat'**
  String get moratal_disable_repeat;

  /// No description provided for @moratal_playback_speed.
  ///
  /// In en, this message translates to:
  /// **'Playback speed'**
  String get moratal_playback_speed;

  /// No description provided for @moratal_speed_normal.
  ///
  /// In en, this message translates to:
  /// **'1.0x (Normal)'**
  String get moratal_speed_normal;

  /// No description provided for @moratal_previous_surah.
  ///
  /// In en, this message translates to:
  /// **'Previous Surah'**
  String get moratal_previous_surah;

  /// No description provided for @moratal_rewind_10.
  ///
  /// In en, this message translates to:
  /// **'Rewind 10 seconds'**
  String get moratal_rewind_10;

  /// No description provided for @moratal_forward_10.
  ///
  /// In en, this message translates to:
  /// **'Forward 10 seconds'**
  String get moratal_forward_10;

  /// No description provided for @moratal_next_surah.
  ///
  /// In en, this message translates to:
  /// **'Next Surah'**
  String get moratal_next_surah;

  /// No description provided for @pray_time_location_disabled_message.
  ///
  /// In en, this message translates to:
  /// **'GPS is disabled. Please turn it on'**
  String get pray_time_location_disabled_message;

  /// No description provided for @pray_time_fetch_error.
  ///
  /// In en, this message translates to:
  /// **'Could not get prayer times'**
  String get pray_time_fetch_error;

  /// No description provided for @pray_time_location_loading.
  ///
  /// In en, this message translates to:
  /// **'Loading location...'**
  String get pray_time_location_loading;

  /// No description provided for @pray_time_today.
  ///
  /// In en, this message translates to:
  /// **'Today'**
  String get pray_time_today;

  /// No description provided for @pray_time_tomorrow.
  ///
  /// In en, this message translates to:
  /// **'Tomorrow'**
  String get pray_time_tomorrow;

  /// No description provided for @pray_time_yesterday.
  ///
  /// In en, this message translates to:
  /// **'Yesterday'**
  String get pray_time_yesterday;

  /// No description provided for @pray_time_times_section_title.
  ///
  /// In en, this message translates to:
  /// **'Prayer Times'**
  String get pray_time_times_section_title;

  /// No description provided for @pray_time_previous_day.
  ///
  /// In en, this message translates to:
  /// **'Previous'**
  String get pray_time_previous_day;

  /// No description provided for @pray_time_next_day.
  ///
  /// In en, this message translates to:
  /// **'Next'**
  String get pray_time_next_day;

  /// No description provided for @pray_time_remaining_to_adhan.
  ///
  /// In en, this message translates to:
  /// **'Remaining until Adhan'**
  String get pray_time_remaining_to_adhan;

  /// No description provided for @pray_time_adjust_prayer_time.
  ///
  /// In en, this message translates to:
  /// **'Adjust {prayerName} time'**
  String pray_time_adjust_prayer_time(String prayerName);

  /// No description provided for @pray_time_adjustment_limit.
  ///
  /// In en, this message translates to:
  /// **'Maximum ± 60 minutes'**
  String get pray_time_adjustment_limit;

  /// No description provided for @pray_time_no_adjustment.
  ///
  /// In en, this message translates to:
  /// **'No adjustment'**
  String get pray_time_no_adjustment;

  /// No description provided for @pray_time_original_time.
  ///
  /// In en, this message translates to:
  /// **'Original'**
  String get pray_time_original_time;

  /// No description provided for @pray_time_minutes_offset_positive.
  ///
  /// In en, this message translates to:
  /// **'+{minutes} minutes'**
  String pray_time_minutes_offset_positive(int minutes);

  /// No description provided for @pray_time_minutes_offset.
  ///
  /// In en, this message translates to:
  /// **'{minutes} minutes'**
  String pray_time_minutes_offset(int minutes);

  /// No description provided for @pray_time_save_adjustment.
  ///
  /// In en, this message translates to:
  /// **'Save adjustment'**
  String get pray_time_save_adjustment;

  /// No description provided for @pray_time_reset_adjustments_title.
  ///
  /// In en, this message translates to:
  /// **'Reset Adjustments'**
  String get pray_time_reset_adjustments_title;

  /// No description provided for @pray_time_reset_adjustments_message.
  ///
  /// In en, this message translates to:
  /// **'Do you want to return all prayer times to their original calculated times?'**
  String get pray_time_reset_adjustments_message;

  /// No description provided for @pray_time_no_internet_title.
  ///
  /// In en, this message translates to:
  /// **'No internet connection'**
  String get pray_time_no_internet_title;

  /// No description provided for @pray_time_no_internet_subtitle.
  ///
  /// In en, this message translates to:
  /// **'It will update automatically when the connection returns'**
  String get pray_time_no_internet_subtitle;

  /// No description provided for @pray_time_location_service_disabled.
  ///
  /// In en, this message translates to:
  /// **'Location service is disabled'**
  String get pray_time_location_service_disabled;

  /// No description provided for @pray_time_location_permission_required.
  ///
  /// In en, this message translates to:
  /// **'Location permission is required'**
  String get pray_time_location_permission_required;

  /// No description provided for @pray_time_location_permission_denied_forever.
  ///
  /// In en, this message translates to:
  /// **'Location permission is permanently denied'**
  String get pray_time_location_permission_denied_forever;

  /// No description provided for @pray_time_loading.
  ///
  /// In en, this message translates to:
  /// **'Loading'**
  String get pray_time_loading;

  /// No description provided for @pray_time_error_title.
  ///
  /// In en, this message translates to:
  /// **'An error occurred'**
  String get pray_time_error_title;

  /// No description provided for @pray_time_unknown_error_title.
  ///
  /// In en, this message translates to:
  /// **'Sorry, something went wrong'**
  String get pray_time_unknown_error_title;

  /// No description provided for @pray_time_unknown_error_message.
  ///
  /// In en, this message translates to:
  /// **'Unknown error'**
  String get pray_time_unknown_error_message;

  /// No description provided for @pray_time_grant_location_permission.
  ///
  /// In en, this message translates to:
  /// **'Grant location permission'**
  String get pray_time_grant_location_permission;

  /// No description provided for @pray_time_enable_location_service.
  ///
  /// In en, this message translates to:
  /// **'Turn on location service'**
  String get pray_time_enable_location_service;

  /// No description provided for @pray_time_gps_auto_refresh_message.
  ///
  /// In en, this message translates to:
  /// **'It will update automatically when GPS is enabled'**
  String get pray_time_gps_auto_refresh_message;

  /// No description provided for @pray_time_manual_permission_message.
  ///
  /// In en, this message translates to:
  /// **'Location access must be granted manually'**
  String get pray_time_manual_permission_message;

  /// No description provided for @pray_time_detecting_location.
  ///
  /// In en, this message translates to:
  /// **'Detecting your current location...'**
  String get pray_time_detecting_location;

  /// No description provided for @pray_time_alert_title.
  ///
  /// In en, this message translates to:
  /// **'Alert'**
  String get pray_time_alert_title;

  /// No description provided for @pray_time_location_deleted_message.
  ///
  /// In en, this message translates to:
  /// **'Location data was previously deleted from the app at your request. The currently displayed prayer times may be inaccurate because they rely on the last known location before deletion.\nWould you like to update location data now to correct the times?'**
  String get pray_time_location_deleted_message;

  /// No description provided for @pray_time_ignore.
  ///
  /// In en, this message translates to:
  /// **'Ignore'**
  String get pray_time_ignore;

  /// No description provided for @pray_time_soon.
  ///
  /// In en, this message translates to:
  /// **'Soon'**
  String get pray_time_soon;

  /// No description provided for @generic_error.
  ///
  /// In en, this message translates to:
  /// **'An error occurred'**
  String get generic_error;

  /// No description provided for @moratal_play.
  ///
  /// In en, this message translates to:
  /// **'Play'**
  String get moratal_play;

  /// No description provided for @moratal_pause.
  ///
  /// In en, this message translates to:
  /// **'Pause'**
  String get moratal_pause;

  /// No description provided for @quran_nav_index.
  ///
  /// In en, this message translates to:
  /// **'Index'**
  String get quran_nav_index;

  /// No description provided for @quran_nav_search.
  ///
  /// In en, this message translates to:
  /// **'Search'**
  String get quran_nav_search;

  /// No description provided for @quran_nav_bookmarks.
  ///
  /// In en, this message translates to:
  /// **'Bookmarks'**
  String get quran_nav_bookmarks;

  /// No description provided for @quran_settings_title.
  ///
  /// In en, this message translates to:
  /// **'Quran Settings'**
  String get quran_settings_title;

  /// No description provided for @quran_settings_subtitle.
  ///
  /// In en, this message translates to:
  /// **'Customize reading and listening'**
  String get quran_settings_subtitle;

  /// No description provided for @quran_settings_reading_appearance.
  ///
  /// In en, this message translates to:
  /// **'Reading and Appearance'**
  String get quran_settings_reading_appearance;

  /// No description provided for @quran_settings_reading_bg_color.
  ///
  /// In en, this message translates to:
  /// **'Reading background color'**
  String get quran_settings_reading_bg_color;

  /// No description provided for @quran_settings_page_view_type.
  ///
  /// In en, this message translates to:
  /// **'Quran page view'**
  String get quran_settings_page_view_type;

  /// No description provided for @quran_settings_keep_screen_awake.
  ///
  /// In en, this message translates to:
  /// **'Keep screen awake while reading'**
  String get quran_settings_keep_screen_awake;

  /// No description provided for @quran_settings_listening_memorization.
  ///
  /// In en, this message translates to:
  /// **'Listening and Memorization'**
  String get quran_settings_listening_memorization;

  /// No description provided for @quran_settings_select_qari_voice.
  ///
  /// In en, this message translates to:
  /// **'Select reciter voice'**
  String get quran_settings_select_qari_voice;

  /// No description provided for @quran_settings_ayah_delay.
  ///
  /// In en, this message translates to:
  /// **'Delay between verses'**
  String get quran_settings_ayah_delay;

  /// No description provided for @quran_settings_auto_scroll_audio.
  ///
  /// In en, this message translates to:
  /// **'Auto-scroll with reciter audio'**
  String get quran_settings_auto_scroll_audio;

  /// No description provided for @quran_settings_general.
  ///
  /// In en, this message translates to:
  /// **'General Settings'**
  String get quran_settings_general;

  /// No description provided for @quran_settings_download_tafsir.
  ///
  /// In en, this message translates to:
  /// **'Download Tafsir'**
  String get quran_settings_download_tafsir;

  /// No description provided for @quran_settings_daily_reminders.
  ///
  /// In en, this message translates to:
  /// **'Daily reading reminders'**
  String get quran_settings_daily_reminders;

  /// No description provided for @quran_delay_no_pause.
  ///
  /// In en, this message translates to:
  /// **'No pause'**
  String get quran_delay_no_pause;

  /// No description provided for @quran_delay_one_second.
  ///
  /// In en, this message translates to:
  /// **'1 second'**
  String get quran_delay_one_second;

  /// No description provided for @quran_delay_two_seconds.
  ///
  /// In en, this message translates to:
  /// **'2 seconds'**
  String get quran_delay_two_seconds;

  /// No description provided for @quran_delay_seconds.
  ///
  /// In en, this message translates to:
  /// **'{seconds} seconds'**
  String quran_delay_seconds(int seconds);

  /// No description provided for @quran_reminder_time.
  ///
  /// In en, this message translates to:
  /// **'Time: {time}'**
  String quran_reminder_time(String time);

  /// No description provided for @quran_reminder_after_fajr.
  ///
  /// In en, this message translates to:
  /// **'Time: after Fajr'**
  String get quran_reminder_after_fajr;

  /// No description provided for @quran_reminder_pick_hint.
  ///
  /// In en, this message translates to:
  /// **'Tap here to choose reminder time'**
  String get quran_reminder_pick_hint;

  /// No description provided for @quran_reminder_picker_help.
  ///
  /// In en, this message translates to:
  /// **'Choose reminder time, or cancel to use the suggested time'**
  String get quran_reminder_picker_help;

  /// No description provided for @quran_view_fixed.
  ///
  /// In en, this message translates to:
  /// **'Fixed layout'**
  String get quran_view_fixed;

  /// No description provided for @quran_view_fixed_description.
  ///
  /// In en, this message translates to:
  /// **'Show each page at a fixed size'**
  String get quran_view_fixed_description;

  /// No description provided for @quran_view_zoomable.
  ///
  /// In en, this message translates to:
  /// **'Zoomable layout'**
  String get quran_view_zoomable;

  /// No description provided for @quran_view_zoomable_description.
  ///
  /// In en, this message translates to:
  /// **'Pinch with two fingers to zoom in or out'**
  String get quran_view_zoomable_description;

  /// No description provided for @quran_view_page_display.
  ///
  /// In en, this message translates to:
  /// **'Page display mode'**
  String get quran_view_page_display;

  /// No description provided for @quran_juz_starts_at.
  ///
  /// In en, this message translates to:
  /// **'Surah {surahName} - Page {pageNumber}'**
  String quran_juz_starts_at(String surahName, int pageNumber);

  /// No description provided for @quran_search_hint.
  ///
  /// In en, this message translates to:
  /// **'Search for a Surah or Ayah...'**
  String get quran_search_hint;

  /// No description provided for @quran_search_empty_title.
  ///
  /// In en, this message translates to:
  /// **'Search Quran verses'**
  String get quran_search_empty_title;

  /// No description provided for @quran_search_empty_subtitle.
  ///
  /// In en, this message translates to:
  /// **'Type a word or part of a verse to find it quickly.'**
  String get quran_search_empty_subtitle;

  /// No description provided for @quran_search_no_results_title.
  ///
  /// In en, this message translates to:
  /// **'No results'**
  String get quran_search_no_results_title;

  /// No description provided for @quran_search_no_results_subtitle.
  ///
  /// In en, this message translates to:
  /// **'Check the spelling or try a shorter phrase.'**
  String get quran_search_no_results_subtitle;

  /// No description provided for @quran_search_recent.
  ///
  /// In en, this message translates to:
  /// **'Recent searches'**
  String get quran_search_recent;

  /// No description provided for @quran_search_suggested_results.
  ///
  /// In en, this message translates to:
  /// **'Suggested results'**
  String get quran_search_suggested_results;

  /// No description provided for @quran_search_results_count.
  ///
  /// In en, this message translates to:
  /// **'Search results ({count})'**
  String quran_search_results_count(int count);

  /// No description provided for @quran_surah_ayah_label.
  ///
  /// In en, this message translates to:
  /// **'Surah {surahName} - Ayah {ayahNumber}'**
  String quran_surah_ayah_label(String surahName, int ayahNumber);

  /// No description provided for @quran_saved_bookmarks.
  ///
  /// In en, this message translates to:
  /// **'Saved bookmarks'**
  String get quran_saved_bookmarks;

  /// No description provided for @quran_pages_tab.
  ///
  /// In en, this message translates to:
  /// **'Pages'**
  String get quran_pages_tab;

  /// No description provided for @quran_ayahs_tab.
  ///
  /// In en, this message translates to:
  /// **'Verses'**
  String get quran_ayahs_tab;

  /// No description provided for @quran_no_saved_bookmarks.
  ///
  /// In en, this message translates to:
  /// **'No saved bookmarks'**
  String get quran_no_saved_bookmarks;

  /// No description provided for @quran_ayah_page_label.
  ///
  /// In en, this message translates to:
  /// **'Ayah {ayahNumber} - Page {pageNumber}'**
  String quran_ayah_page_label(int ayahNumber, int pageNumber);

  /// No description provided for @quran_saved_date.
  ///
  /// In en, this message translates to:
  /// **'Saved on: {date}'**
  String quran_saved_date(String date);

  /// No description provided for @quran_delete_bookmark.
  ///
  /// In en, this message translates to:
  /// **'Delete bookmark'**
  String get quran_delete_bookmark;

  /// No description provided for @quran_color_dark_default.
  ///
  /// In en, this message translates to:
  /// **'Default dark'**
  String get quran_color_dark_default;

  /// No description provided for @quran_color_night_black.
  ///
  /// In en, this message translates to:
  /// **'Night black'**
  String get quran_color_night_black;

  /// No description provided for @quran_color_dark_sepia.
  ///
  /// In en, this message translates to:
  /// **'Dark sepia'**
  String get quran_color_dark_sepia;

  /// No description provided for @quran_color_dark_blue.
  ///
  /// In en, this message translates to:
  /// **'Dark blue'**
  String get quran_color_dark_blue;

  /// No description provided for @quran_color_light_sepia.
  ///
  /// In en, this message translates to:
  /// **'Default light (sepia)'**
  String get quran_color_light_sepia;

  /// No description provided for @quran_color_bright_white.
  ///
  /// In en, this message translates to:
  /// **'Bright white'**
  String get quran_color_bright_white;

  /// No description provided for @quran_color_soft_gray.
  ///
  /// In en, this message translates to:
  /// **'Soft gray'**
  String get quran_color_soft_gray;

  /// No description provided for @quran_color_light_cream.
  ///
  /// In en, this message translates to:
  /// **'Light cream'**
  String get quran_color_light_cream;

  /// No description provided for @quran_reading_mark_added.
  ///
  /// In en, this message translates to:
  /// **'Reading bookmark added'**
  String get quran_reading_mark_added;

  /// No description provided for @quran_bookmark_removed.
  ///
  /// In en, this message translates to:
  /// **'Bookmark removed'**
  String get quran_bookmark_removed;

  /// No description provided for @quran_action_copy.
  ///
  /// In en, this message translates to:
  /// **'Copy'**
  String get quran_action_copy;

  /// No description provided for @quran_action_read.
  ///
  /// In en, this message translates to:
  /// **'Read'**
  String get quran_action_read;

  /// No description provided for @quran_action_listen.
  ///
  /// In en, this message translates to:
  /// **'Listen'**
  String get quran_action_listen;

  /// No description provided for @quran_action_bookmark.
  ///
  /// In en, this message translates to:
  /// **'Bookmark'**
  String get quran_action_bookmark;

  /// No description provided for @quran_action_tafsir.
  ///
  /// In en, this message translates to:
  /// **'Tafsir'**
  String get quran_action_tafsir;

  /// No description provided for @quran_action_share.
  ///
  /// In en, this message translates to:
  /// **'Share'**
  String get quran_action_share;

  /// No description provided for @quran_ayah_copied_success.
  ///
  /// In en, this message translates to:
  /// **'Ayah copied successfully'**
  String get quran_ayah_copied_success;

  /// No description provided for @quran_ayah_copied.
  ///
  /// In en, this message translates to:
  /// **'Ayah copied'**
  String get quran_ayah_copied;

  /// No description provided for @quran_audio_connection_error.
  ///
  /// In en, this message translates to:
  /// **'Could not play audio. Check your internet connection.'**
  String get quran_audio_connection_error;

  /// No description provided for @quran_audio_connection_error_short.
  ///
  /// In en, this message translates to:
  /// **'Could not play the Ayah. Check your connection.'**
  String get quran_audio_connection_error_short;

  /// No description provided for @quran_ayah_saved_home.
  ///
  /// In en, this message translates to:
  /// **'Ayah saved. You can access it quickly from the home page.'**
  String get quran_ayah_saved_home;

  /// No description provided for @quran_currently_listening.
  ///
  /// In en, this message translates to:
  /// **'Listening now'**
  String get quran_currently_listening;

  /// No description provided for @quran_remove_reading_position.
  ///
  /// In en, this message translates to:
  /// **'Remove reading position'**
  String get quran_remove_reading_position;

  /// No description provided for @quran_save_reading_position.
  ///
  /// In en, this message translates to:
  /// **'Save reading position'**
  String get quran_save_reading_position;

  /// No description provided for @quran_reading_position_removed.
  ///
  /// In en, this message translates to:
  /// **'Reading position removed'**
  String get quran_reading_position_removed;

  /// No description provided for @quran_reading_position_saved.
  ///
  /// In en, this message translates to:
  /// **'Reading position saved and your progress will appear on the home page'**
  String get quran_reading_position_saved;

  /// No description provided for @quran_remove_bookmark.
  ///
  /// In en, this message translates to:
  /// **'Remove bookmark'**
  String get quran_remove_bookmark;

  /// No description provided for @quran_add_bookmark.
  ///
  /// In en, this message translates to:
  /// **'Add bookmark'**
  String get quran_add_bookmark;

  /// No description provided for @quran_play_ayah.
  ///
  /// In en, this message translates to:
  /// **'Play Ayah'**
  String get quran_play_ayah;

  /// No description provided for @quran_ayah_tafsir.
  ///
  /// In en, this message translates to:
  /// **'Ayah Tafsir'**
  String get quran_ayah_tafsir;

  /// No description provided for @quran_ayah_qari_label.
  ///
  /// In en, this message translates to:
  /// **'Ayah {ayahNumber} - {qariName}'**
  String quran_ayah_qari_label(int ayahNumber, String qariName);

  /// No description provided for @quran_disable_auto_scroll.
  ///
  /// In en, this message translates to:
  /// **'Disable auto-scroll'**
  String get quran_disable_auto_scroll;

  /// No description provided for @quran_enable_auto_scroll.
  ///
  /// In en, this message translates to:
  /// **'Enable auto-scroll'**
  String get quran_enable_auto_scroll;

  /// No description provided for @quran_auto_scroll_disabled.
  ///
  /// In en, this message translates to:
  /// **'Auto-scroll for verses disabled'**
  String get quran_auto_scroll_disabled;

  /// No description provided for @quran_auto_scroll_enabled.
  ///
  /// In en, this message translates to:
  /// **'Auto-scroll for verses enabled'**
  String get quran_auto_scroll_enabled;

  /// No description provided for @quran_failed_get_ayah_url.
  ///
  /// In en, this message translates to:
  /// **'Failed to get the Ayah audio link'**
  String get quran_failed_get_ayah_url;

  /// No description provided for @quran_playback_no_connection.
  ///
  /// In en, this message translates to:
  /// **'Unable to play. No connection.'**
  String get quran_playback_no_connection;

  /// No description provided for @quran_not_selected.
  ///
  /// In en, this message translates to:
  /// **'Not selected'**
  String get quran_not_selected;

  /// No description provided for @quran_ayah_by_qari.
  ///
  /// In en, this message translates to:
  /// **'Ayah {ayahNumber} - by {qariName}'**
  String quran_ayah_by_qari(int ayahNumber, String qariName);
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['ar', 'bn', 'de', 'en'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ar':
      return AppLocalizationsAr();
    case 'bn':
      return AppLocalizationsBn();
    case 'de':
      return AppLocalizationsDe();
    case 'en':
      return AppLocalizationsEn();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
