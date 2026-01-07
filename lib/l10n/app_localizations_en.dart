// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appName => 'Flipper DuckyMaker';

  @override
  String get usbIdChanger => 'USB ID Changer';

  @override
  String get systemRequest => 'System Request (SYSRQ)';

  @override
  String get altNumpadString => 'Alt+Numpad String (ALTCODE)';

  @override
  String get stringWithNewline => 'String with Newline (STRINGLN)';

  @override
  String get holdReleaseKey => 'Hold/Release Key (HOLD/RELEASE)';

  @override
  String get changeId => 'Change ID (VID/PID)';

  @override
  String get vendorId => 'Vendor ID';

  @override
  String get productId => 'Product ID';

  @override
  String get vendorProduct => 'VENDOR:PRODUCT';

  @override
  String get vendor => 'Vendor';

  @override
  String get product => 'Product';

  @override
  String get remark => 'Remark (REM)';

  @override
  String get string => 'String (STRING)';

  @override
  String get delays => 'Delays';

  @override
  String get miscCommands => 'Misc. Commands';

  @override
  String get modifierKeys => 'Modifier Keys';

  @override
  String get comboKeys => 'Combo Keys';

  @override
  String get arrowKeys => 'Arrow Keys / Cursor';

  @override
  String get mainControlKeys => 'Main Control Keys';

  @override
  String get othersControlKeys => 'Others Control Keys';

  @override
  String get functionKeys => 'Function Keys';

  @override
  String get output => 'Output';

  @override
  String get outputDescription => 'Your badUSB payload will be here. At the end of the process, click \"Save\", and the download will automatically start. You can also edit manually the script before download.';

  @override
  String get saveAs => 'Save As...';

  @override
  String get payloadPlaceholder => 'Here your Payload...';

  @override
  String get payloadSaved => 'Payload saved successfully!';

  @override
  String get copy => 'Copy';

  @override
  String get writeRemark => 'Write Remark';

  @override
  String get writeString => 'Write String';

  @override
  String get writeAltcode => 'Write Altcode';

  @override
  String get writeStringLn => 'Write StringLN';

  @override
  String get delay => 'DELAY';

  @override
  String get defaultDelay => 'DEFAULT DELAY';

  @override
  String get buttonPress => 'BUTTON_PRESS';

  @override
  String get repeat => 'REPEAT';

  @override
  String get altchar => 'ALTCHAR';

  @override
  String get codePlaceholder => 'Code';

  @override
  String get sysrq => 'SysRq (Linux ONLY)';

  @override
  String get holdRelease => 'HOLD/RELEASE';

  @override
  String get printscreen => 'PRINT SCREEN';

  @override
  String get esc => 'ESC';

  @override
  String get pageUp => 'PAGE UP';

  @override
  String get pageDown => 'PAGE DOWN';

  @override
  String get numLock => 'NUM LOCK';

  @override
  String get scrollLock => 'SCROLL LOCK';

  @override
  String get home => 'HOME';

  @override
  String get end => 'END';

  @override
  String get insert => 'INSERT';

  @override
  String get app => 'APP';

  @override
  String get breakKey => 'BREAK';

  @override
  String get pause => 'PAUSE';

  @override
  String get menu => 'MENU';

  @override
  String get escape => 'ESCAPE';

  @override
  String get enter => 'ENTER';

  @override
  String get space => 'SPACE';

  @override
  String get backspace => 'BACK SPACE';

  @override
  String get tab => 'TAB';

  @override
  String get capsLock => 'CAPS LOCK';

  @override
  String get delete => 'DELETE';

  @override
  String get upArrow => 'UP';

  @override
  String get leftArrow => 'LEFT';

  @override
  String get downArrow => 'DOWN';

  @override
  String get rightArrow => 'RIGHT';

  @override
  String get f1 => 'F1';

  @override
  String get f2 => 'F2';

  @override
  String get f3 => 'F3';

  @override
  String get f4 => 'F4';

  @override
  String get f5 => 'F5';

  @override
  String get f6 => 'F6';

  @override
  String get f7 => 'F7';

  @override
  String get f8 => 'F8';

  @override
  String get f9 => 'F9';

  @override
  String get f10 => 'F10';

  @override
  String get f11 => 'F11';

  @override
  String get f12 => 'F12';

  @override
  String get gui => 'GUI';

  @override
  String get windows => 'WINDOWS';

  @override
  String get shift => 'SHIFT';

  @override
  String get ctrl => 'CTRL';

  @override
  String get alt => 'ALT';

  @override
  String get ctrlAlt => 'CTRL-ALT';

  @override
  String get ctrlShift => 'CTRL-SHIFT';

  @override
  String get altShift => 'ALT-SHIFT';

  @override
  String get altGui => 'ALT-GUI';

  @override
  String get guiShift => 'GUI-SHIFT';

  @override
  String get typeYourTextHere => 'Type your text here.';

  @override
  String get usbIdChangerDescription => 'VendorID an ProductID are codes used to identify your keyboard. ONLY if you are targeting a macOS, remember to insert the ID command, to change VID / PID, at the top of your code.';

  @override
  String get remarkDescription => 'REM is short for Remark and adds a comment to the payload, like a title, the target OS, the functioning of a command or the author\'s name.';

  @override
  String get stringDescription => 'STRING injects keystrokes, or \"types\", the given characters (a-z, 0-9, punctuation & specials).';

  @override
  String get delaysDescription => 'DELAY is expressed in milliseconds (1 sec. = 1000 ms.). The minimum is 100 (0.1 sec.). It increases/decreases by 100 milliseconds each click. DEFAULT_DELAY / DEFAULTDELAY add delay before every next command.';

  @override
  String get miscCommandsDescription => 'REPEAT is used to repeat the previous command. It expects the number of additional repeats as parameter. ALTCHAR is to display single ALT+Numpad Keys (on Windows), or ALT(ALT+SHIFT) Keys (on macOS).';

  @override
  String get modifierKeysDescription => 'GUI is used for both: the WINDOWS(⊔) key on Windows, and the CMD(⌘) key on macOS. (Targeting Windows, you can use WINDOWS key or GUI key to get the same result). CONTROL and CTRL as well. If you need to use more than one \"modifier key\" at once, use the preloaded \"Keys Combos\", which you\'ll find just below these Modifier keys.';

  @override
  String get comboKeysDescription => 'ONLY on Windows: CTRL-ALT is the same as to type ALTgr (ALT Graphic) and you can use both ALT-WINDOWS or ALT-GUI, and WINDOWS-SHIFT or GUI-SHIFT to get the exact same result.';

  @override
  String get arrowKeysDescription => 'UP is the same as UPARROW. DOWN is the same ad DOWNARROW. LEFT is the same as LEFTARROW. RIGHT is the same as RIGHTARROW.';

  @override
  String get othersControlKeysDescription => 'The magic SysRq key is a key combination understood by the Linux kernel, which allows the user to perform various low-level commands regardless of the system\'s state. It is often used to recover from freezes, or to reboot a computer without corrupting the filesystem.';

  @override
  String get sysrqPlaceholder => 'SysRq command';

  @override
  String get holdReleasePlaceholder => 'Key to hold/release';

  @override
  String get settingsTitle => 'Settings';

  @override
  String get openSourceLicenses => 'Open Source Licenses';

  @override
  String get close => 'Close';

  @override
  String get fileName => 'File Name';

  @override
  String get fileNamePlaceholder => 'Enter filename';

  @override
  String get fileType => 'File Type';

  @override
  String get useCustomDirectory => 'Use custom directory';

  @override
  String get directoryPath => 'Directory path';

  @override
  String get preview => 'Preview';

  @override
  String get save => 'Save';

  @override
  String get error => 'Error';

  @override
  String get ok => 'OK';

  @override
  String get noContentToSave => 'No content to save';

  @override
  String get fileSavedSuccessfully => 'File saved successfully';

  @override
  String get downloadFolder => 'Download folder';
}
