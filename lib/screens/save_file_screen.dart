import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:file_saver/file_saver.dart';
import 'package:flutter_ducky_app/l10n/app_localizations.dart';

class SaveFileScreen extends StatefulWidget {
  final String content;
  final VoidCallback onSaveSuccess;
  final VoidCallback onSaveCancel;

  const SaveFileScreen({
    Key? key,
    required this.content,
    required this.onSaveSuccess,
    required this.onSaveCancel,
  }) : super(key: key);

  @override
  State<SaveFileScreen> createState() => _SaveFileScreenState();
}

class _SaveFileScreenState extends State<SaveFileScreen> {
  final TextEditingController _filenameController = TextEditingController();
  String _selectedExtension = '.txt';

  @override
  void initState() {
    super.initState();
    _filenameController.text = 'duckyscript_payload_${DateTime.now().millisecondsSinceEpoch ~/ 1000}';
  }

  @override
  void dispose() {
    _filenameController.dispose();
    super.dispose();
  }

  Future<void> _saveFile() async {
    if (widget.content.isEmpty) {
      _showError(context, AppLocalizations.of(context)!.noContentToSave);
      return;
    }

    try {
      String filename = _filenameController.text.trim();
      if (!filename.toLowerCase().endsWith(_selectedExtension)) {
        filename += _selectedExtension;
      }

      await FileSaver.instance.saveFile(
        name: filename,
        bytes: utf8.encode(widget.content),
        ext: _selectedExtension.substring(1),
      );

      widget.onSaveSuccess();
      if (mounted) {
        Navigator.of(context).pop();
      }
    } catch (e) {
      _showError(context, 'Error saving file: $e');
    }
  }

  void _showError(BuildContext context, String message) {
    final l10n = AppLocalizations.of(context)!;
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(l10n.error ?? 'Error'),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text(l10n.ok ?? 'OK'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.saveAs ?? 'Save As'),
        actions: [
          TextButton(
            onPressed: _saveFile,
            child: Text(
              l10n.save ?? 'Save',
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      l10n.fileName ?? 'File Name',
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    TextField(
                      controller: _filenameController,
                      decoration: InputDecoration(
                        hintText: l10n.fileNamePlaceholder ?? 'Enter filename',
                        border: const OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(height: 16),
                    DropdownButtonFormField<String>(
                      value: _selectedExtension,
                      decoration: const InputDecoration(
                        labelText: 'File Extension',
                        border: OutlineInputBorder(),
                      ),
                      items: [
                        DropdownMenuItem(
                          value: '.txt',
                          child: Text('Text File (.txt)'),
                        ),
                        DropdownMenuItem(
                          value: '.ducky',
                          child: Text('DuckyScript File (.ducky)'),
                        ),
                      ],
                      onChanged: (value) {
                        if (value != null) {
                          setState(() {
                            _selectedExtension = value;
                          });
                        }
                      },
                    ),
                    const SizedBox(height: 16),
                    Text(
                      '${l10n.directoryPath}: ${l10n.downloadFolder ?? 'Download folder'}',
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        l10n.preview ?? 'Preview',
                        style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.all(8.0),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Theme.of(context).dividerColor,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: Scrollbar(
                            child: SingleChildScrollView(
                              child: Text(
                                widget.content,
                                style: const TextStyle(fontFamily: 'monospace', fontSize: 12),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}