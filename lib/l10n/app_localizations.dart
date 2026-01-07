import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_ru.dart';

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
  AppLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

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
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('ru')
  ];

  /// App name
  ///
  /// In en, this message translates to:
  /// **'Flipper DuckyMaker'**
  String get appName;

  /// USB ID Changer section title
  ///
  /// In en, this message translates to:
  /// **'USB ID Changer'**
  String get usbIdChanger;

  /// System Request section title
  ///
  /// In en, this message translates to:
  /// **'System Request (SYSRQ)'**
  String get systemRequest;

  /// Alt+Numpad String section title
  ///
  /// In en, this message translates to:
  /// **'Alt+Numpad String (ALTCODE)'**
  String get altNumpadString;

  /// String with Newline section title
  ///
  /// In en, this message translates to:
  /// **'String with Newline (STRINGLN)'**
  String get stringWithNewline;

  /// Hold/Release Key section title
  ///
  /// In en, this message translates to:
  /// **'Hold/Release Key (HOLD/RELEASE)'**
  String get holdReleaseKey;

  /// Change ID section title
  ///
  /// In en, this message translates to:
  /// **'Change ID (VID/PID)'**
  String get changeId;

  /// Vendor ID label
  ///
  /// In en, this message translates to:
  /// **'Vendor ID'**
  String get vendorId;

  /// Product ID label
  ///
  /// In en, this message translates to:
  /// **'Product ID'**
  String get productId;

  /// Vendor:Product format
  ///
  /// In en, this message translates to:
  /// **'VENDOR:PRODUCT'**
  String get vendorProduct;

  /// Vendor label
  ///
  /// In en, this message translates to:
  /// **'Vendor'**
  String get vendor;

  /// Product label
  ///
  /// In en, this message translates to:
  /// **'Product'**
  String get product;

  /// Remark section title
  ///
  /// In en, this message translates to:
  /// **'Remark (REM)'**
  String get remark;

  /// String section title
  ///
  /// In en, this message translates to:
  /// **'String (STRING)'**
  String get string;

  /// Delays section title
  ///
  /// In en, this message translates to:
  /// **'Delays'**
  String get delays;

  /// Misc Commands section title
  ///
  /// In en, this message translates to:
  /// **'Misc. Commands'**
  String get miscCommands;

  /// Modifier Keys section title
  ///
  /// In en, this message translates to:
  /// **'Modifier Keys'**
  String get modifierKeys;

  /// Combo Keys section title
  ///
  /// In en, this message translates to:
  /// **'Combo Keys'**
  String get comboKeys;

  /// Arrow Keys section title
  ///
  /// In en, this message translates to:
  /// **'Arrow Keys / Cursor'**
  String get arrowKeys;

  /// Main Control Keys section title
  ///
  /// In en, this message translates to:
  /// **'Main Control Keys'**
  String get mainControlKeys;

  /// Others Control Keys section title
  ///
  /// In en, this message translates to:
  /// **'Others Control Keys'**
  String get othersControlKeys;

  /// Function Keys section title
  ///
  /// In en, this message translates to:
  /// **'Function Keys'**
  String get functionKeys;

  /// Output section title
  ///
  /// In en, this message translates to:
  /// **'Output'**
  String get output;

  /// Output section description
  ///
  /// In en, this message translates to:
  /// **'Your badUSB payload will be here. At the end of the process, click \"Save\", and the download will automatically start. You can also edit manually the script before download.'**
  String get outputDescription;

  /// Save As button text
  ///
  /// In en, this message translates to:
  /// **'Save As...'**
  String get saveAs;

  /// Payload textarea placeholder
  ///
  /// In en, this message translates to:
  /// **'Here your Payload...'**
  String get payloadPlaceholder;

  /// Payload saved message
  ///
  /// In en, this message translates to:
  /// **'Payload saved successfully!'**
  String get payloadSaved;

  /// Copy button text
  ///
  /// In en, this message translates to:
  /// **'Copy'**
  String get copy;

  /// Write Remark button text
  ///
  /// In en, this message translates to:
  /// **'Write Remark'**
  String get writeRemark;

  /// Write String button text
  ///
  /// In en, this message translates to:
  /// **'Write String'**
  String get writeString;

  /// Write Altcode button text
  ///
  /// In en, this message translates to:
  /// **'Write Altcode'**
  String get writeAltcode;

  /// Write StringLN button text
  ///
  /// In en, this message translates to:
  /// **'Write StringLN'**
  String get writeStringLn;

  /// Delay button text
  ///
  /// In en, this message translates to:
  /// **'DELAY'**
  String get delay;

  /// Default Delay button text
  ///
  /// In en, this message translates to:
  /// **'DEFAULT DELAY'**
  String get defaultDelay;

  /// Button Press button text
  ///
  /// In en, this message translates to:
  /// **'BUTTON_PRESS'**
  String get buttonPress;

  /// Repeat button text
  ///
  /// In en, this message translates to:
  /// **'REPEAT'**
  String get repeat;

  /// Altchar button text
  ///
  /// In en, this message translates to:
  /// **'ALTCHAR'**
  String get altchar;

  /// Code input placeholder
  ///
  /// In en, this message translates to:
  /// **'Code'**
  String get codePlaceholder;

  /// SysRq button text
  ///
  /// In en, this message translates to:
  /// **'SysRq (Linux ONLY)'**
  String get sysrq;

  /// Hold/Release button text
  ///
  /// In en, this message translates to:
  /// **'HOLD/RELEASE'**
  String get holdRelease;

  /// Print Screen button text
  ///
  /// In en, this message translates to:
  /// **'PRINT SCREEN'**
  String get printscreen;

  /// ESC button text
  ///
  /// In en, this message translates to:
  /// **'ESC'**
  String get esc;

  /// Page Up button text
  ///
  /// In en, this message translates to:
  /// **'PAGE UP'**
  String get pageUp;

  /// Page Down button text
  ///
  /// In en, this message translates to:
  /// **'PAGE DOWN'**
  String get pageDown;

  /// Num Lock button text
  ///
  /// In en, this message translates to:
  /// **'NUM LOCK'**
  String get numLock;

  /// Scroll Lock button text
  ///
  /// In en, this message translates to:
  /// **'SCROLL LOCK'**
  String get scrollLock;

  /// Home button text
  ///
  /// In en, this message translates to:
  /// **'HOME'**
  String get home;

  /// End button text
  ///
  /// In en, this message translates to:
  /// **'END'**
  String get end;

  /// Insert button text
  ///
  /// In en, this message translates to:
  /// **'INSERT'**
  String get insert;

  /// App button text
  ///
  /// In en, this message translates to:
  /// **'APP'**
  String get app;

  /// Break button text
  ///
  /// In en, this message translates to:
  /// **'BREAK'**
  String get breakKey;

  /// Pause button text
  ///
  /// In en, this message translates to:
  /// **'PAUSE'**
  String get pause;

  /// Menu button text
  ///
  /// In en, this message translates to:
  /// **'MENU'**
  String get menu;

  /// Escape button text
  ///
  /// In en, this message translates to:
  /// **'ESCAPE'**
  String get escape;

  /// Enter button text
  ///
  /// In en, this message translates to:
  /// **'ENTER'**
  String get enter;

  /// Space button text
  ///
  /// In en, this message translates to:
  /// **'SPACE'**
  String get space;

  /// Back Space button text
  ///
  /// In en, this message translates to:
  /// **'BACK SPACE'**
  String get backspace;

  /// Tab button text
  ///
  /// In en, this message translates to:
  /// **'TAB'**
  String get tab;

  /// Caps Lock button text
  ///
  /// In en, this message translates to:
  /// **'CAPS LOCK'**
  String get capsLock;

  /// Delete button text
  ///
  /// In en, this message translates to:
  /// **'DELETE'**
  String get delete;

  /// Up Arrow button text
  ///
  /// In en, this message translates to:
  /// **'UP'**
  String get upArrow;

  /// Left Arrow button text
  ///
  /// In en, this message translates to:
  /// **'LEFT'**
  String get leftArrow;

  /// Down Arrow button text
  ///
  /// In en, this message translates to:
  /// **'DOWN'**
  String get downArrow;

  /// Right Arrow button text
  ///
  /// In en, this message translates to:
  /// **'RIGHT'**
  String get rightArrow;

  /// F1 button text
  ///
  /// In en, this message translates to:
  /// **'F1'**
  String get f1;

  /// F2 button text
  ///
  /// In en, this message translates to:
  /// **'F2'**
  String get f2;

  /// F3 button text
  ///
  /// In en, this message translates to:
  /// **'F3'**
  String get f3;

  /// F4 button text
  ///
  /// In en, this message translates to:
  /// **'F4'**
  String get f4;

  /// F5 button text
  ///
  /// In en, this message translates to:
  /// **'F5'**
  String get f5;

  /// F6 button text
  ///
  /// In en, this message translates to:
  /// **'F6'**
  String get f6;

  /// F7 button text
  ///
  /// In en, this message translates to:
  /// **'F7'**
  String get f7;

  /// F8 button text
  ///
  /// In en, this message translates to:
  /// **'F8'**
  String get f8;

  /// F9 button text
  ///
  /// In en, this message translates to:
  /// **'F9'**
  String get f9;

  /// F10 button text
  ///
  /// In en, this message translates to:
  /// **'F10'**
  String get f10;

  /// F11 button text
  ///
  /// In en, this message translates to:
  /// **'F11'**
  String get f11;

  /// F12 button text
  ///
  /// In en, this message translates to:
  /// **'F12'**
  String get f12;

  /// GUI button text
  ///
  /// In en, this message translates to:
  /// **'GUI'**
  String get gui;

  /// Windows button text
  ///
  /// In en, this message translates to:
  /// **'WINDOWS'**
  String get windows;

  /// Shift button text
  ///
  /// In en, this message translates to:
  /// **'SHIFT'**
  String get shift;

  /// Ctrl button text
  ///
  /// In en, this message translates to:
  /// **'CTRL'**
  String get ctrl;

  /// Alt button text
  ///
  /// In en, this message translates to:
  /// **'ALT'**
  String get alt;

  /// Ctrl-Alt button text
  ///
  /// In en, this message translates to:
  /// **'CTRL-ALT'**
  String get ctrlAlt;

  /// Ctrl-Shift button text
  ///
  /// In en, this message translates to:
  /// **'CTRL-SHIFT'**
  String get ctrlShift;

  /// Alt-Shift button text
  ///
  /// In en, this message translates to:
  /// **'ALT-SHIFT'**
  String get altShift;

  /// Alt-Gui button text
  ///
  /// In en, this message translates to:
  /// **'ALT-GUI'**
  String get altGui;

  /// Gui-Shift button text
  ///
  /// In en, this message translates to:
  /// **'GUI-SHIFT'**
  String get guiShift;

  /// Placeholder text for text inputs
  ///
  /// In en, this message translates to:
  /// **'Type your text here.'**
  String get typeYourTextHere;

  /// USB ID changer description
  ///
  /// In en, this message translates to:
  /// **'VendorID an ProductID are codes used to identify your keyboard. ONLY if you are targeting a macOS, remember to insert the ID command, to change VID / PID, at the top of your code.'**
  String get usbIdChangerDescription;

  /// Remark section description
  ///
  /// In en, this message translates to:
  /// **'REM is short for Remark and adds a comment to the payload, like a title, the target OS, the functioning of a command or the author\'s name.'**
  String get remarkDescription;

  /// String section description
  ///
  /// In en, this message translates to:
  /// **'STRING injects keystrokes, or \"types\", the given characters (a-z, 0-9, punctuation & specials).'**
  String get stringDescription;

  /// Delays section description
  ///
  /// In en, this message translates to:
  /// **'DELAY is expressed in milliseconds (1 sec. = 1000 ms.). The minimum is 100 (0.1 sec.). It increases/decreases by 100 milliseconds each click. DEFAULT_DELAY / DEFAULTDELAY add delay before every next command.'**
  String get delaysDescription;

  /// Misc Commands section description
  ///
  /// In en, this message translates to:
  /// **'REPEAT is used to repeat the previous command. It expects the number of additional repeats as parameter. ALTCHAR is to display single ALT+Numpad Keys (on Windows), or ALT(ALT+SHIFT) Keys (on macOS).'**
  String get miscCommandsDescription;

  /// Modifier Keys section description
  ///
  /// In en, this message translates to:
  /// **'GUI is used for both: the WINDOWS(⊔) key on Windows, and the CMD(⌘) key on macOS. (Targeting Windows, you can use WINDOWS key or GUI key to get the same result). CONTROL and CTRL as well. If you need to use more than one \"modifier key\" at once, use the preloaded \"Keys Combos\", which you\'ll find just below these Modifier keys.'**
  String get modifierKeysDescription;

  /// Combo Keys section description
  ///
  /// In en, this message translates to:
  /// **'ONLY on Windows: CTRL-ALT is the same as to type ALTgr (ALT Graphic) and you can use both ALT-WINDOWS or ALT-GUI, and WINDOWS-SHIFT or GUI-SHIFT to get the exact same result.'**
  String get comboKeysDescription;

  /// Arrow Keys section description
  ///
  /// In en, this message translates to:
  /// **'UP is the same as UPARROW. DOWN is the same ad DOWNARROW. LEFT is the same as LEFTARROW. RIGHT is the same as RIGHTARROW.'**
  String get arrowKeysDescription;

  /// Others Control Keys section description
  ///
  /// In en, this message translates to:
  /// **'The magic SysRq key is a key combination understood by the Linux kernel, which allows the user to perform various low-level commands regardless of the system\'s state. It is often used to recover from freezes, or to reboot a computer without corrupting the filesystem.'**
  String get othersControlKeysDescription;

  /// SysRq input placeholder
  ///
  /// In en, this message translates to:
  /// **'SysRq command'**
  String get sysrqPlaceholder;

  /// Hold/Release input placeholder
  ///
  /// In en, this message translates to:
  /// **'Key to hold/release'**
  String get holdReleasePlaceholder;

  /// Settings dialog title
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settingsTitle;

  /// Open source licenses button text
  ///
  /// In en, this message translates to:
  /// **'Open Source Licenses'**
  String get openSourceLicenses;

  /// Close button text
  ///
  /// In en, this message translates to:
  /// **'Close'**
  String get close;

  /// File Name label
  ///
  /// In en, this message translates to:
  /// **'File Name'**
  String get fileName;

  /// File Name placeholder
  ///
  /// In en, this message translates to:
  /// **'Enter filename'**
  String get fileNamePlaceholder;

  /// File Type label
  ///
  /// In en, this message translates to:
  /// **'File Type'**
  String get fileType;

  /// Use Custom Directory label
  ///
  /// In en, this message translates to:
  /// **'Use custom directory'**
  String get useCustomDirectory;

  /// Directory Path label
  ///
  /// In en, this message translates to:
  /// **'Directory path'**
  String get directoryPath;

  /// Preview label
  ///
  /// In en, this message translates to:
  /// **'Preview'**
  String get preview;

  /// Save button text
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get save;

  /// Error dialog title
  ///
  /// In en, this message translates to:
  /// **'Error'**
  String get error;

  /// OK button text
  ///
  /// In en, this message translates to:
  /// **'OK'**
  String get ok;

  /// No content to save message
  ///
  /// In en, this message translates to:
  /// **'No content to save'**
  String get noContentToSave;

  /// File saved successfully message
  ///
  /// In en, this message translates to:
  /// **'File saved successfully'**
  String get fileSavedSuccessfully;

  /// Download folder message
  ///
  /// In en, this message translates to:
  /// **'Download folder'**
  String get downloadFolder;
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['en', 'ru'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en': return AppLocalizationsEn();
    case 'ru': return AppLocalizationsRu();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
