import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';

import '../../core/providers.dart';
import '../../data/booru/models/source_config.dart';
import '../../data/db/database.dart';
import '../../data/db/mappers.dart';
import '../../l10n/app_localizations.dart';

/// Formulário de fonte customizada. Fica a critério do usuário adicionar
/// qualquer booru aqui — o app não sugere nenhuma fonte adulta, mas também
/// não impede o cadastro manual. O filtro de rating/blacklist (ver
/// [BooruRepository]) se aplica igual, não importa a fonte.
class SourceFormScreen extends ConsumerStatefulWidget {
  final Source? existing;

  const SourceFormScreen({super.key, this.existing});

  @override
  ConsumerState<SourceFormScreen> createState() => _SourceFormScreenState();
}

class _SourceFormScreenState extends ConsumerState<SourceFormScreen> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _nameController;
  late final TextEditingController _baseUrlController;
  late final TextEditingController _usernameController;
  late final TextEditingController _apiKeyController;
  late BooruApiType _apiType;

  @override
  void initState() {
    super.initState();
    final existing = widget.existing;
    _nameController = TextEditingController(text: existing?.name ?? '');
    _baseUrlController = TextEditingController(text: existing?.baseUrl ?? '');
    _usernameController = TextEditingController(text: existing?.username ?? '');
    _apiKeyController = TextEditingController(text: existing?.apiKey ?? '');
    _apiType = existing != null
        ? BooruApiType.values.byName(existing.apiType)
        : BooruApiType.danbooru;
  }

  @override
  void dispose() {
    _nameController.dispose();
    _baseUrlController.dispose();
    _usernameController.dispose();
    _apiKeyController.dispose();
    super.dispose();
  }

  void _applySuggestion(SuggestedSource suggestion) {
    setState(() {
      _nameController.text = suggestion.name;
      _baseUrlController.text = suggestion.baseUrl;
      _apiType = suggestion.apiType;
    });
  }

  Future<void> _save() async {
    if (!_formKey.currentState!.validate()) return;

    final config = SourceConfig(
      id: widget.existing?.id ?? const Uuid().v4(),
      name: _nameController.text.trim(),
      baseUrl: _baseUrlController.text.trim(),
      apiType: _apiType,
      username: _usernameController.text.trim().isEmpty
          ? null
          : _usernameController.text.trim(),
      apiKey: _apiKeyController.text.trim().isEmpty
          ? null
          : _apiKeyController.text.trim(),
    );

    await ref.read(appDatabaseProvider).upsertSource(config.toCompanion());
    if (mounted) Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.existing == null ? l10n.sourceFormNew : l10n.sourceFormEdit,
        ),
        actions: [
          IconButton(icon: const Icon(Icons.check), onPressed: _save),
        ],
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            if (widget.existing == null) ...[
              Text(
                l10n.sourceFormSuggestions,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: suggestedSources
                    .map(
                      (s) => ActionChip(
                        label: Text(s.name),
                        onPressed: () => _applySuggestion(s),
                      ),
                    )
                    .toList(),
              ),
              const SizedBox(height: 16),
            ],
            TextFormField(
              controller: _nameController,
              decoration: InputDecoration(labelText: l10n.sourceFormName),
              validator: (v) =>
                  (v == null || v.trim().isEmpty)
                  ? l10n.sourceFormRequired
                  : null,
            ),
            const SizedBox(height: 12),
            TextFormField(
              controller: _baseUrlController,
              decoration: InputDecoration(
                labelText: l10n.sourceFormBaseUrl,
                hintText: 'https://exemplo.com',
              ),
              keyboardType: TextInputType.url,
              validator: (v) {
                if (v == null || v.trim().isEmpty) {
                  return l10n.sourceFormRequired;
                }
                final uri = Uri.tryParse(v.trim());
                if (uri == null ||
                    !uri.isScheme('HTTPS') && !uri.isScheme('HTTP')) {
                  return l10n.sourceFormInvalidUrl;
                }
                return null;
              },
            ),
            const SizedBox(height: 12),
            DropdownButtonFormField<BooruApiType>(
              initialValue: _apiType,
              decoration: InputDecoration(labelText: l10n.sourceFormApiType),
              items: BooruApiType.values
                  .map(
                    (type) => DropdownMenuItem(
                      value: type,
                      child: Text(_apiTypeLabel(l10n, type)),
                    ),
                  )
                  .toList(),
              onChanged: (value) {
                if (value != null) setState(() => _apiType = value);
              },
            ),
            const SizedBox(height: 12),
            TextFormField(
              controller: _usernameController,
              decoration: InputDecoration(labelText: l10n.sourceFormUsername),
            ),
            const SizedBox(height: 12),
            TextFormField(
              controller: _apiKeyController,
              decoration: InputDecoration(labelText: l10n.sourceFormApiKey),
              obscureText: true,
            ),
          ],
        ),
      ),
    );
  }

  String _apiTypeLabel(AppLocalizations l10n, BooruApiType type) {
    switch (type) {
      case BooruApiType.danbooru:
        return l10n.apiTypeDanbooru;
      case BooruApiType.gelbooru:
        return l10n.apiTypeGelbooru;
      case BooruApiType.moebooru:
        return l10n.apiTypeMoebooru;
    }
  }
}
