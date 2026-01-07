// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Russian (`ru`).
class AppLocalizationsRu extends AppLocalizations {
  AppLocalizationsRu([String locale = 'ru']) : super(locale);

  @override
  String get appName => 'Flipper DuckyMaker';

  @override
  String get usbIdChanger => 'Изменение ID USB';

  @override
  String get systemRequest => 'Системный запрос (SYSRQ)';

  @override
  String get altNumpadString => 'Строка с Alt+цифры (ALTCODE)';

  @override
  String get stringWithNewline => 'Строка с новой строкой (STRINGLN)';

  @override
  String get holdReleaseKey => 'Удержание/Отпускание клавиши (HOLD/RELEASE)';

  @override
  String get changeId => 'Изменить ID (VID/PID)';

  @override
  String get vendorId => 'ID производителя';

  @override
  String get productId => 'ID продукта';

  @override
  String get vendorProduct => 'ПРОИЗВОДИТЕЛЬ:ПРОДУКТ';

  @override
  String get vendor => 'Производитель';

  @override
  String get product => 'Продукт';

  @override
  String get remark => 'Комментарий (REM)';

  @override
  String get string => 'Строка (STRING)';

  @override
  String get delays => 'Задержки';

  @override
  String get miscCommands => 'Прочие команды';

  @override
  String get modifierKeys => 'Клавиши-модификаторы';

  @override
  String get comboKeys => 'Комбинации клавиш';

  @override
  String get arrowKeys => 'Клавиши стрелок / Курсор';

  @override
  String get mainControlKeys => 'Основные управляющие клавиши';

  @override
  String get othersControlKeys => 'Другие управляющие клавиши';

  @override
  String get functionKeys => 'Функциональные клавиши';

  @override
  String get output => 'Вывод';

  @override
  String get outputDescription => 'Ваш пейлоад badUSB будет здесь. В конце процесса нажмите \"Сохранить\", и загрузка начнется автоматически. Вы также можете вручно отредактировать скрипт перед загрузкой.';

  @override
  String get saveAs => 'Сохранить как...';

  @override
  String get payloadPlaceholder => 'Здесь ваш пейлоад...';

  @override
  String get payloadSaved => 'Пейлоад успешно сохранен!';

  @override
  String get copy => 'Копировать';

  @override
  String get writeRemark => 'Написать комментарий';

  @override
  String get writeString => 'Написать строку';

  @override
  String get writeAltcode => 'Написать Alt-код';

  @override
  String get writeStringLn => 'Написать StringLN';

  @override
  String get delay => 'ЗАДЕРЖКА';

  @override
  String get defaultDelay => 'СТАНДАРТНАЯ ЗАДЕРЖКА';

  @override
  String get buttonPress => 'НАЖАТИЕ КНОПКИ';

  @override
  String get repeat => 'ПОВТОР';

  @override
  String get altchar => 'ALTСИМВОЛ';

  @override
  String get codePlaceholder => 'Код';

  @override
  String get sysrq => 'SysRq (только для Linux)';

  @override
  String get holdRelease => 'УДЕРЖАНИЕ/ОТПУСКАНИЕ';

  @override
  String get printscreen => 'ПЕЧАТЬ ЭКРАНА';

  @override
  String get esc => 'ESC';

  @override
  String get pageUp => 'СТР.ВВЕРХ';

  @override
  String get pageDown => 'СТР.ВНИЗ';

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
  String get space => 'ПРОБЕЛ';

  @override
  String get backspace => 'BACK SPACE';

  @override
  String get tab => 'TAB';

  @override
  String get capsLock => 'CAPS LOCK';

  @override
  String get delete => 'DELETE';

  @override
  String get upArrow => 'ВВЕРХ';

  @override
  String get leftArrow => 'ВЛЕВО';

  @override
  String get downArrow => 'ВНИЗ';

  @override
  String get rightArrow => 'ВПРАВО';

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
  String get typeYourTextHere => 'Введите текст здесь.';

  @override
  String get usbIdChangerDescription => 'VendorID и ProductID - это коды, используемые для идентификации вашей клавиатуры. ТОЛЬКО если вы нацелены на macOS, не забудьте вставить команду ID, чтобы изменить VID / PID, в начало вашего кода.';

  @override
  String get remarkDescription => 'REM - это сокращение от Remark, и добавляет комментарий к полезному грузу, например, название, целевую ОС, работу команды или имя автора.';

  @override
  String get stringDescription => 'STRING вводит нажатия клавиш или \"вводит\" заданные символы (a-z, 0-9, знаки препинания и специальные символы).';

  @override
  String get delaysDescription => 'DELAY выражается в миллисекундах (1 сек. = 1000 мс.). Минимум 100 (0,1 сек.). Увеличивается/уменьшается на 100 миллисекунд при каждом нажатии. DEFAULT_DELAY / DEFAULTDELAY добавляют задержку перед каждой следующей командой.';

  @override
  String get miscCommandsDescription => 'REPEAT используется для повторения предыдущей команды. Ожидает количество дополнительных повторов в качестве параметра. ALTCHAR используется для отображения одиночных клавиш Alt+цифры (в Windows) или клавиш ALT(ALT+SHIFT) (в macOS).';

  @override
  String get modifierKeysDescription => 'GUI используется как для клавиши WINDOWS(⊔) в Windows, так и для клавиши CMD(⌘) в macOS. (При работе с Windows вы можете использовать клавишу WINDOWS или GUI для получения того же результата). CONTROL и CTRL тоже. Если вам нужно использовать более одной \"клавиши-модификатора\" одновременно, используйте предустановленные \"Комбинации клавиш\", которые вы найдете прямо под этими клавишами-модификаторами.';

  @override
  String get comboKeysDescription => 'ТОЛЬКО в Windows: CTRL-ALT эквивалентно вводу ALTgr (ALT Graphic), и вы можете использовать как ALT-WINDOWS, так и ALT-GUI, а также WINDOWS-SHIFT или GUI-SHIFT для получения точно такого же результата.';

  @override
  String get arrowKeysDescription => 'UP эквивалентно UPARROW. DOWN эквивалентно DOWNARROW. LEFT эквивалентно LEFTARROW. RIGHT эквивалентно RIGHTARROW.';

  @override
  String get othersControlKeysDescription => 'Магическая клавиша SysRq - это комбинация клавиш, понятная ядру Linux, которая позволяет пользователю выполнять различные низкоуровневые команды независимо от состояния системы. Часто используется для восстановления после зависаний или для перезагрузки компьютера без повреждения файловой системы.';

  @override
  String get sysrqPlaceholder => 'Команда SysRq';

  @override
  String get holdReleasePlaceholder => 'Клавиша для удержания/отпускания';

  @override
  String get settingsTitle => 'Настройки';

  @override
  String get openSourceLicenses => 'Лицензии открытого ПО';

  @override
  String get close => 'Закрыть';

  @override
  String get fileName => 'Имя файла';

  @override
  String get fileNamePlaceholder => 'Введите имя файла';

  @override
  String get fileType => 'Тип файла';

  @override
  String get useCustomDirectory => 'Использовать другую директорию';

  @override
  String get directoryPath => 'Путь к директории';

  @override
  String get preview => 'Предпросмотр';

  @override
  String get save => 'Сохранить';

  @override
  String get error => 'Ошибка';

  @override
  String get ok => 'OK';

  @override
  String get noContentToSave => 'Нет содержимого для сохранения';

  @override
  String get fileSavedSuccessfully => 'Файл успешно сохранен';

  @override
  String get downloadFolder => 'Папка загрузок';
}
