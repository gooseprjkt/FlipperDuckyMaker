import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_ducky_app/l10n/l10n.dart';
import 'package:flutter_ducky_app/l10n/app_localizations.dart';
import 'package:file_saver/file_saver.dart';
import 'package:flutter_ducky_app/screens/save_file_screen.dart';

class MainScreen extends StatefulWidget {
  final Future<void> Function(Locale) updateLocaleCallback;

  const MainScreen({super.key, required this.updateLocaleCallback});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final TextEditingController _outputController = TextEditingController();
  final TextEditingController _remarkController = TextEditingController();
  final TextEditingController _stringController = TextEditingController();
  final TextEditingController _delayController = TextEditingController(text: '1000');
  final TextEditingController _defaultDelayController = TextEditingController(text: '1000');
  final TextEditingController _charController = TextEditingController();
  final TextEditingController _vidController = TextEditingController();
  final TextEditingController _pidController = TextEditingController();
  final TextEditingController _vendorController = TextEditingController();
  final TextEditingController _productController = TextEditingController();
  final TextEditingController _sysrqController = TextEditingController();
  final TextEditingController _altcodeController = TextEditingController();
  final TextEditingController _stringlnController = TextEditingController();
  final TextEditingController _holdReleaseController = TextEditingController();

  Locale _selectedLocale = const Locale('en');

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    _outputController.dispose();
    _remarkController.dispose();
    _stringController.dispose();
    _delayController.dispose();
    _defaultDelayController.dispose();
    _charController.dispose();
    _vidController.dispose();
    _pidController.dispose();
    _vendorController.dispose();
    _productController.dispose();
    _sysrqController.dispose();
    _altcodeController.dispose();
    _stringlnController.dispose();
    _holdReleaseController.dispose();
    super.dispose();
  }

  void _insertToOutput(String command) {
    setState(() {
      _outputController.text += '$command\n';
    });
  }

  void _insertRemark() {
    final text = _remarkController.text.trim();
    if (text.isNotEmpty) {
      final lines = text.split('\n');
      final result = lines.where((line) => line.isNotEmpty).map((line) => 'REM $line').join('\n');
      _insertToOutput(result);
      _remarkController.clear();
    }
  }

  void _insertString() {
    final text = _stringController.text.trim();
    if (text.isNotEmpty) {
      final lines = text.split('\n');
      final result = lines.where((line) => line.isNotEmpty).map((line) => 'STRING $line').join('\n');
      _insertToOutput(result);
      _stringController.clear();
    }
  }

  void _insertAltcode() {
    final text = _altcodeController.text.trim();
    if (text.isNotEmpty) {
      final lines = text.split('\n');
      final result = lines.where((line) => line.isNotEmpty).map((line) => 'ALTCODE $line').join('\n');
      _insertToOutput(result);
      _altcodeController.clear();
    }
  }

  void _insertStringln() {
    final text = _stringlnController.text.trim();
    if (text.isNotEmpty) {
      final lines = text.split('\n');
      final result = lines.where((line) => line.isNotEmpty).map((line) => 'STRINGLN $line').join('\n');
      _insertToOutput(result);
      _stringlnController.clear();
    }
  }

  void _insertSysrq() {
    final text = _sysrqController.text.trim();
    if (text.isNotEmpty) {
      _insertToOutput('SYSRQ $text');
      _sysrqController.clear();
    } else {
      _insertToOutput('SYSRQ');
    }
  }

  void _insertHoldRelease() {
    final text = _holdReleaseController.text.trim();
    if (text.isNotEmpty) {
      _insertToOutput('HOLD $text');
      _holdReleaseController.clear();
    }
  }

  void _insertUSBID() {
    final vid = _vidController.text.trim();
    final pid = _pidController.text.trim();
    final vendor = _vendorController.text.trim();
    final product = _productController.text.trim();

    if (vid.isNotEmpty && pid.isNotEmpty) {
      String command = 'ID $vid:$pid';
      if (vendor.isNotEmpty || product.isNotEmpty) {
        command += ' $vendor:$product';
      }
      _insertToOutput(command);
      _vidController.clear();
      _pidController.clear();
      _vendorController.clear();
      _productController.clear();
    }
  }

  Future<void> _saveOutput() async {
    final content = _outputController.text.trim();
    if (content.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(AppLocalizations.of(context)!.noContentToSave),
          duration: const Duration(seconds: 2),
        ),
      );
      return;
    }

    // Navigate to the save file screen
    await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => SaveFileScreen(
          content: content,
          onSaveSuccess: () {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(AppLocalizations.of(context)!.fileSavedSuccessfully),
                duration: const Duration(seconds: 3),
              ),
            );
          },
          onSaveCancel: () {
            // User cancelled, show a message if needed
          },
        ),
      ),
    );
  }

  Future<void> _copyToClipboard() async {
    final content = _outputController.text.trim();
    if (content.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('No content to copy'),
          duration: const Duration(seconds: 2),
        ),
      );
      return;
    }

    await Clipboard.setData(ClipboardData(text: content));

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('DuckyScript copied to clipboard'),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.appName),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              _showSettingsDialog(context, l10n);
            },
          ),
        ],
        bottom: TabBar(
          controller: _tabController,
          tabs: [
            Tab(text: 'DuckyScript'),
            Tab(text: 'Output'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          LayoutBuilder(
            builder: (context, constraints) {
              if (constraints.maxWidth > 800) {
                return _buildWideLayout(l10n);
              } else {
                return _buildNarrowLayout(l10n);
              }
            },
          ),
          Container(
            padding: const EdgeInsets.all(16),
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          l10n.output,
                          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Text(
                      l10n.outputDescription,
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    const SizedBox(height: 8),
                    Expanded(
                      child: TextField(
                        controller: _outputController,
                        maxLines: null,
                        expands: true,
                        decoration: InputDecoration(
                          hintText: l10n.payloadPlaceholder,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        Expanded(
                          child: ElevatedButton(
                            onPressed: _copyToClipboard,
                            child: Text(l10n.copy),
                          ),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: ElevatedButton(
                            onPressed: _saveOutput,
                            child: Text(l10n.saveAs),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _showSettingsDialog(BuildContext context, AppLocalizations l10n) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(l10n.settingsTitle ?? 'Settings'),
          content: StatefulBuilder(
            builder: (BuildContext context, StateSetter setState) {
              return Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  DropdownButton<Locale>(
                    value: _selectedLocale,
                    onChanged: (Locale? newValue) {
                      setState(() {
                        _selectedLocale = newValue!;
                      });
                      WidgetsBinding.instance.addPostFrameCallback((_) {
                        _switchLocale(newValue!);
                      });
                    },
                    items: L10n.all.map<DropdownMenuItem<Locale>>((Locale locale) {
                      return DropdownMenuItem<Locale>(
                        value: locale,
                        child: Text(
                          locale == const Locale('en') ? 'English' : 'Русский',
                        ),
                      );
                    }).toList(),
                  ),
                  const SizedBox(height: 16),
                  TextButton(
                    onPressed: () {
                      showLicensePage(
                        context: context,
                        applicationName: 'Flipper DuckyMaker',
                        applicationVersion: '1.0.0',
                        applicationLegalese: '© 2026 gooseprjkt',
                      );
                    },
                    child: Text(l10n.openSourceLicenses ?? 'OSS'),
                  ),
                  const Spacer(),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Text(
                      'with ❤️ by gooseprjkt',
                      style: TextStyle(
                        fontSize: 12,
                        color: Theme.of(context).colorScheme.onSurface.withOpacity(0.6),
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text(l10n.close ?? 'Close'),
            ),
          ],
        );
      },
    );
  }

  void _switchLocale(Locale locale) {
    widget.updateLocaleCallback(locale);
  }

  Widget _buildWideLayout(AppLocalizations l10n) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 16),
          _buildUSBIDSection(l10n),
          const SizedBox(height: 16),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: _buildRemarkSection(l10n),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: _buildStringSection(l10n),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: _buildDelaysSection(l10n),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: _buildMiscCommandsSection(l10n),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: _buildModifierKeysSection(l10n),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: _buildComboKeysSection(l10n),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: _buildArrowKeysSection(l10n),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: _buildMainControlKeysSection(l10n),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: _buildOthersControlKeysSection(l10n),
              ),
            ],
          ),
          const SizedBox(height: 16),
          _buildFunctionKeysSection(l10n),
        ],
      ),
    );
  }

  Widget _buildNarrowLayout(AppLocalizations l10n) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 16),
          _buildUSBIDSection(l10n),
          const SizedBox(height: 16),
          _buildRemarkSection(l10n),
          const SizedBox(height: 16),
          _buildStringSection(l10n),
          const SizedBox(height: 16),
          _buildDelaysSection(l10n),
          const SizedBox(height: 16),
          _buildMiscCommandsSection(l10n),
          const SizedBox(height: 16),
          _buildModifierKeysSection(l10n),
          const SizedBox(height: 16),
          _buildComboKeysSection(l10n),
          const SizedBox(height: 16),
          _buildArrowKeysSection(l10n),
          const SizedBox(height: 16),
          _buildMainControlKeysSection(l10n),
          const SizedBox(height: 16),
          _buildOthersControlKeysSection(l10n),
          const SizedBox(height: 16),
          _buildFunctionKeysSection(l10n),
        ],
      ),
    );
  }

  Widget _buildUSBIDSection(AppLocalizations l10n) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              l10n.usbIdChanger,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              l10n.usbIdChangerDescription,
              style: Theme.of(context).textTheme.bodySmall,
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _vidController,
                    decoration: InputDecoration(
                      labelText: l10n.vendorId,
                      border: const OutlineInputBorder(),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                const Text(':'),
                const SizedBox(width: 8),
                Expanded(
                  child: TextField(
                    controller: _pidController,
                    decoration: InputDecoration(
                      labelText: l10n.productId,
                      border: const OutlineInputBorder(),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            TextField(
              controller: _vendorController,
              decoration: InputDecoration(
                labelText: l10n.vendor,
                border: const OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 8),
            TextField(
              controller: _productController,
              decoration: InputDecoration(
                labelText: l10n.product,
                border: const OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _insertUSBID,
                child: Text(l10n.changeId),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRemarkSection(AppLocalizations l10n) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              l10n.remark,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              l10n.remarkDescription,
              style: Theme.of(context).textTheme.bodySmall,
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _remarkController,
              maxLines: 4,
              decoration: InputDecoration(
                hintText: l10n.typeYourTextHere,
                border: const OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 8),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _insertRemark,
                child: Text(l10n.writeRemark),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStringSection(AppLocalizations l10n) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              l10n.string,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              l10n.stringDescription,
              style: Theme.of(context).textTheme.bodySmall,
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _stringController,
              maxLines: 4,
              decoration: InputDecoration(
                hintText: l10n.typeYourTextHere,
                border: const OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: _insertString,
                    child: Text(l10n.writeString),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: ElevatedButton(
                    onPressed: _insertAltcode,
                    child: Text(l10n.writeAltcode),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              l10n.altNumpadString,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            TextField(
              controller: _altcodeController,
              maxLines: 2,
              decoration: InputDecoration(
                hintText: l10n.typeYourTextHere,
                border: const OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              l10n.stringWithNewline,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            TextField(
              controller: _stringlnController,
              maxLines: 2,
              decoration: InputDecoration(
                hintText: l10n.typeYourTextHere,
                border: const OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: _insertStringln,
                    child: Text(l10n.writeStringLn),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: ElevatedButton(
                    onPressed: _insertAltcode,
                    child: Text(l10n.writeAltcode),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDelaysSection(AppLocalizations l10n) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              l10n.delays,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              l10n.delaysDescription,
              style: Theme.of(context).textTheme.bodySmall,
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _delayController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: l10n.delay,
                      border: const OutlineInputBorder(),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                ElevatedButton(
                  onPressed: () {
                    _insertToOutput('DELAY ${_delayController.text}');
                  },
                  child: Text(l10n.delay),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _defaultDelayController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: l10n.defaultDelay,
                      border: const OutlineInputBorder(),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                ElevatedButton(
                  onPressed: () {
                    _insertToOutput('DEFAULT_DELAY ${_defaultDelayController.text}');
                  },
                  child: Text(l10n.defaultDelay),
                ),
              ],
            ),
            const SizedBox(height: 8),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  _insertToOutput('WAIT_FOR_BUTTON_PRESS');
                },
                child: Text(l10n.buttonPress),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMiscCommandsSection(AppLocalizations l10n) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              l10n.miscCommands,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              l10n.miscCommandsDescription,
              style: Theme.of(context).textTheme.bodySmall,
            ),
            const SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  _insertToOutput('REPEAT');
                },
                child: Text(l10n.repeat),
              ),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _charController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: l10n.altchar,
                      hintText: l10n.codePlaceholder,
                      border: const OutlineInputBorder(),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                ElevatedButton(
                  onPressed: () {
                    if (_charController.text.isNotEmpty) {
                      _insertToOutput('ALTCHAR ${_charController.text}');
                      _charController.clear();
                    }
                  },
                  child: Text(l10n.altchar),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              l10n.systemRequest,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            TextField(
              controller: _sysrqController,
              decoration: InputDecoration(
                hintText: l10n.sysrqPlaceholder,
                border: const OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 8),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _insertSysrq,
                child: Text(l10n.sysrq),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              l10n.holdReleaseKey,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            TextField(
              controller: _holdReleaseController,
              decoration: InputDecoration(
                hintText: l10n.holdReleasePlaceholder,
                border: const OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 8),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _insertHoldRelease,
                child: Text(l10n.holdRelease),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildModifierKeysSection(AppLocalizations l10n) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              l10n.modifierKeys,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              l10n.modifierKeysDescription,
              style: Theme.of(context).textTheme.bodySmall,
            ),
            const SizedBox(height: 16),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                ElevatedButton(
                  onPressed: () => _insertToOutput('GUI'),
                  child: Text(l10n.gui),
                ),
                ElevatedButton(
                  onPressed: () => _insertToOutput('WINDOWS'),
                  child: Text(l10n.windows),
                ),
                ElevatedButton(
                  onPressed: () => _insertToOutput('SHIFT'),
                  child: Text(l10n.shift),
                ),
                ElevatedButton(
                  onPressed: () => _insertToOutput('CTRL'),
                  child: Text(l10n.ctrl),
                ),
                ElevatedButton(
                  onPressed: () => _insertToOutput('ALT'),
                  child: Text(l10n.alt),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildComboKeysSection(AppLocalizations l10n) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              l10n.comboKeys,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              l10n.comboKeysDescription,
              style: Theme.of(context).textTheme.bodySmall,
            ),
            const SizedBox(height: 16),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                ElevatedButton(
                  onPressed: () => _insertToOutput('CTRL-ALT'),
                  child: Text(l10n.ctrlAlt),
                ),
                ElevatedButton(
                  onPressed: () => _insertToOutput('CTRL-SHIFT'),
                  child: Text(l10n.ctrlShift),
                ),
                ElevatedButton(
                  onPressed: () => _insertToOutput('ALT-SHIFT'),
                  child: Text(l10n.altShift),
                ),
                ElevatedButton(
                  onPressed: () => _insertToOutput('ALT-GUI'),
                  child: Text(l10n.altGui),
                ),
                ElevatedButton(
                  onPressed: () => _insertToOutput('GUI-SHIFT'),
                  child: Text(l10n.guiShift),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildArrowKeysSection(AppLocalizations l10n) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              l10n.arrowKeys,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              l10n.arrowKeysDescription,
              style: Theme.of(context).textTheme.bodySmall,
            ),
            const SizedBox(height: 16),
            Center(
              child: Column(
                children: [
                  ElevatedButton(
                    onPressed: () => _insertToOutput('UPARROW'),
                    child: Text(l10n.upArrow),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: () => _insertToOutput('LEFTARROW'),
                        child: Text(l10n.leftArrow),
                      ),
                      const SizedBox(width: 8),
                      ElevatedButton(
                        onPressed: () => _insertToOutput('DOWNARROW'),
                        child: Text(l10n.downArrow),
                      ),
                      const SizedBox(width: 8),
                      ElevatedButton(
                        onPressed: () => _insertToOutput('RIGHTARROW'),
                        child: Text(l10n.rightArrow),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMainControlKeysSection(AppLocalizations l10n) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              l10n.mainControlKeys,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                ElevatedButton(
                  onPressed: () => _insertToOutput('ENTER'),
                  child: Text(l10n.enter),
                ),
                ElevatedButton(
                  onPressed: () => _insertToOutput('SPACE'),
                  child: Text(l10n.space),
                ),
                ElevatedButton(
                  onPressed: () => _insertToOutput('BACKSPACE'),
                  child: Text(l10n.backspace),
                ),
                ElevatedButton(
                  onPressed: () => _insertToOutput('TAB'),
                  child: Text(l10n.tab),
                ),
                ElevatedButton(
                  onPressed: () => _insertToOutput('CAPSLOCK'),
                  child: Text(l10n.capsLock),
                ),
                ElevatedButton(
                  onPressed: () => _insertToOutput('DELETE'),
                  child: Text(l10n.delete),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildOthersControlKeysSection(AppLocalizations l10n) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              l10n.othersControlKeys,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              l10n.othersControlKeysDescription,
              style: Theme.of(context).textTheme.bodySmall,
            ),
            const SizedBox(height: 16),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                ElevatedButton(
                  onPressed: () => _insertToOutput('SYSRQ'),
                  child: Text(l10n.sysrq),
                ),
                ElevatedButton(
                  onPressed: () => _insertToOutput('PRINTSCREEN'),
                  child: Text(l10n.printscreen),
                ),
                ElevatedButton(
                  onPressed: () => _insertToOutput('ESC'),
                  child: Text(l10n.esc),
                ),
                ElevatedButton(
                  onPressed: () => _insertToOutput('PAGEUP'),
                  child: Text(l10n.pageUp),
                ),
                ElevatedButton(
                  onPressed: () => _insertToOutput('PAGEDOWN'),
                  child: Text(l10n.pageDown),
                ),
                ElevatedButton(
                  onPressed: () => _insertToOutput('NUMLOCK'),
                  child: Text(l10n.numLock),
                ),
                ElevatedButton(
                  onPressed: () => _insertToOutput('SCROLLOCK'),
                  child: Text(l10n.scrollLock),
                ),
                ElevatedButton(
                  onPressed: () => _insertToOutput('HOME'),
                  child: Text(l10n.home),
                ),
                ElevatedButton(
                  onPressed: () => _insertToOutput('END'),
                  child: Text(l10n.end),
                ),
                ElevatedButton(
                  onPressed: () => _insertToOutput('INSERT'),
                  child: Text(l10n.insert),
                ),
                ElevatedButton(
                  onPressed: () => _insertToOutput('APP'),
                  child: Text(l10n.app),
                ),
                ElevatedButton(
                  onPressed: () => _insertToOutput('BREAK'),
                  child: Text(l10n.breakKey),
                ),
                ElevatedButton(
                  onPressed: () => _insertToOutput('PAUSE'),
                  child: Text(l10n.pause),
                ),
                ElevatedButton(
                  onPressed: () => _insertToOutput('MENU'),
                  child: Text(l10n.menu),
                ),
                ElevatedButton(
                  onPressed: () => _insertToOutput('ESCAPE'),
                  child: Text(l10n.escape),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFunctionKeysSection(AppLocalizations l10n) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              l10n.functionKeys,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                ElevatedButton(
                  onPressed: () => _insertToOutput('F1'),
                  child: Text(l10n.f1),
                ),
                ElevatedButton(
                  onPressed: () => _insertToOutput('F2'),
                  child: Text(l10n.f2),
                ),
                ElevatedButton(
                  onPressed: () => _insertToOutput('F3'),
                  child: Text(l10n.f3),
                ),
                ElevatedButton(
                  onPressed: () => _insertToOutput('F4'),
                  child: Text(l10n.f4),
                ),
                ElevatedButton(
                  onPressed: () => _insertToOutput('F5'),
                  child: Text(l10n.f5),
                ),
                ElevatedButton(
                  onPressed: () => _insertToOutput('F6'),
                  child: Text(l10n.f6),
                ),
                ElevatedButton(
                  onPressed: () => _insertToOutput('F7'),
                  child: Text(l10n.f7),
                ),
                ElevatedButton(
                  onPressed: () => _insertToOutput('F8'),
                  child: Text(l10n.f8),
                ),
                ElevatedButton(
                  onPressed: () => _insertToOutput('F9'),
                  child: Text(l10n.f9),
                ),
                ElevatedButton(
                  onPressed: () => _insertToOutput('F10'),
                  child: Text(l10n.f10),
                ),
                ElevatedButton(
                  onPressed: () => _insertToOutput('F11'),
                  child: Text(l10n.f11),
                ),
                ElevatedButton(
                  onPressed: () => _insertToOutput('F12'),
                  child: Text(l10n.f12),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
