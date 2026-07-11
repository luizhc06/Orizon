// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for French (`fr`).
class AppLocalizationsFr extends AppLocalizations {
  AppLocalizationsFr([String locale = 'fr']) : super(locale);

  @override
  String get appTitle => 'Orizon';

  @override
  String get onboardingWelcome => 'Bienvenue sur Orizon';

  @override
  String get onboardingBody1 =>
      'Orizon est un client de boorus qui recherche dans les sources que vous ajoutez vous-même. L\'option de contenu adulte est désactivée par défaut — ce qui s\'affiche dépend uniquement de votre propre configuration et de vos choix. La responsabilité de ce choix vous appartient.';

  @override
  String get onboardingBody2 =>
      'Une exception fixe qui s\'applique toujours, quel que soit le réglage : Orizon ne montre jamais de contenu sexualisant des mineurs, sans exception.';

  @override
  String get onboardingBody3 =>
      'Vous pouvez gérer les sources et la liste de blocage à tout moment dans les paramètres.';

  @override
  String get onboardingStart => 'Commencer';

  @override
  String onboardingStartWithTimer(int seconds) {
    return 'Commencer (${seconds}s)';
  }

  @override
  String get navHome => 'Accueil';

  @override
  String get navNews => 'Actualités';

  @override
  String get navFavorites => 'Favoris';

  @override
  String get navSettings => 'Réglages';

  @override
  String get newsTitle => 'Actualités';

  @override
  String get newsChangelogTab => 'Journal des modifications';

  @override
  String get newsStatusTab => 'État des sites';

  @override
  String get siteStatusChecking => 'Vérification...';

  @override
  String get siteStatusOffline => 'Hors ligne';

  @override
  String siteStatusLatency(int ms) {
    return '$ms ms';
  }

  @override
  String get settingsTitle => 'Réglages';

  @override
  String get settingsSources => 'Sources';

  @override
  String get settingsBlacklist => 'Liste noire de tags';

  @override
  String get settingsHideAi => 'Masquer les images IA';

  @override
  String get settingsHideAiSubtitle =>
      'Masque les publications marquées comme générées par IA (Stable Diffusion, NovelAI, Midjourney, etc.).';

  @override
  String get settingsDownloadHistory => 'Historique des téléchargements';

  @override
  String get settingsShowAdult => 'Afficher le contenu adulte';

  @override
  String get settingsShowAdultSubtitle =>
      'Désactivé par défaut. Orizon ne fait pas la promotion de contenu adulte. Si vous activez cette option, des images sexuellement explicites ou suggestives peuvent apparaître, selon les sources que vous ajoutez vous-même. Cette décision relève de votre propre responsabilité.';

  @override
  String get settingsMultiBooru => 'Recherche multi-booru';

  @override
  String get settingsMultiBooruSubtitle =>
      'Rechercher dans plusieurs sources à la fois au lieu d\'une seule. Peut être plus lent à charger.';

  @override
  String get settingsTheme => 'Thème';

  @override
  String get settingsGridColumns => 'Colonnes de la grille';

  @override
  String get settingsGridStyle => 'Style de grille';

  @override
  String get settingsGridStyleSubtitle =>
      'Organique adapte chaque aperçu au ratio de l\'image ; uniforme utilise des cellules de taille égale.';

  @override
  String get settingsGridOrganic => 'Organique';

  @override
  String get settingsGridUniform => 'Uniforme';

  @override
  String get settingsLanguage => 'Langue';

  @override
  String get settingsDiscord => 'Discord';

  @override
  String get settingsDiscordSubtitle => 'Communauté brésilienne d\'Orizon 🇧🇷';

  @override
  String get settingsSupport => 'Soutenir le projet (Buy Me a Coffee)';

  @override
  String get settingsAbout => 'À propos';

  @override
  String get settingsBackupTitle => 'Sauvegarde';

  @override
  String get settingsBackupExport => 'Exporter la sauvegarde';

  @override
  String get settingsBackupImport => 'Restaurer la sauvegarde';

  @override
  String get settingsBackupImportSuccess => 'Sauvegarde restaurée';

  @override
  String settingsBackupImportError(String error) {
    return 'Erreur lors de la restauration : $error';
  }

  @override
  String get settingsCacheTitle => 'Cache';

  @override
  String get settingsCacheClearNow => 'Vider le cache maintenant';

  @override
  String get settingsCacheCleared => 'Cache vidé';

  @override
  String get settingsCacheAutoClear =>
      'Vider le cache automatiquement à la fermeture';

  @override
  String get settingsCacheAutoClearSubtitle =>
      'Désactivé par défaut. Si activé, le cache d\'images est vidé à chaque fermeture de l\'application.';

  @override
  String get themeWhiteRed => 'Blanc + rouge';

  @override
  String get themeWhitePurple => 'Blanc + violet';

  @override
  String get themeBlackRed => 'Noir + rouge';

  @override
  String get themePurpleBlack => 'Violet + noir';

  @override
  String get aboutTitle => 'À propos';

  @override
  String get aboutSubtitle => 'Visionneuse de boorus';

  @override
  String get aboutPrivacyPolicy => 'Politique de confidentialité';

  @override
  String get aboutLicenses => 'Licences open source';

  @override
  String get sourcesTitle => 'Sources';

  @override
  String get sourcesEmpty => 'Aucune source ajoutée';

  @override
  String sourcesLoadError(String error) {
    return 'Erreur de chargement des sources : $error';
  }

  @override
  String get sourcesAddTooltip => 'Ajouter une source personnalisée';

  @override
  String get sourcesRemoveTooltip => 'Supprimer la source';

  @override
  String get sourceFormNew => 'Nouvelle source';

  @override
  String get sourceFormEdit => 'Modifier la source';

  @override
  String get sourceFormSuggestions => 'Suggestions';

  @override
  String get sourceFormName => 'Nom';

  @override
  String get sourceFormBaseUrl => 'URL de base';

  @override
  String get sourceFormApiType => 'Type d\'API';

  @override
  String get sourceFormUsername => 'Nom d\'utilisateur (optionnel)';

  @override
  String get sourceFormApiKey => 'Clé API (optionnelle)';

  @override
  String get sourceFormRequired => 'Obligatoire';

  @override
  String get sourceFormInvalidUrl => 'URL invalide';

  @override
  String get apiTypeDanbooru => 'Danbooru (et dérivés)';

  @override
  String get apiTypeGelbooru => 'Gelbooru 0.2 (Gelbooru/Safebooru/Rule34)';

  @override
  String get apiTypeMoebooru => 'Moebooru (yande.re/konachan)';

  @override
  String get blacklistTitle => 'Liste noire de tags';

  @override
  String get blacklistFixed => 'Toujours bloqués (fixe, non modifiable)';

  @override
  String get blacklistUser => 'Vos tags bloqués';

  @override
  String get blacklistAddHint => 'ajouter un tag...';

  @override
  String errorGeneric(String error) {
    return 'Erreur : $error';
  }

  @override
  String get favoritesTitle => 'Favoris';

  @override
  String get favoritesEmpty => 'Aucun favori pour l\'instant';

  @override
  String get downloadHistoryTitle => 'Historique des téléchargements';

  @override
  String get downloadHistoryEmpty => 'Aucun téléchargement pour l\'instant';

  @override
  String get searchRefreshTooltip => 'Rechercher à nouveau';

  @override
  String get searchTagHint => 'Ajouter un tag...';

  @override
  String get searchNoSourceEnabled => 'Aucune source activée';

  @override
  String get searchNoSourceSelected => 'Aucune source sélectionnée';

  @override
  String get searchLoading => 'Recherche en cours...';

  @override
  String get searchEmptyState => 'Ajoutez un tag pour commencer';

  @override
  String get searchMultiWarning =>
      'Plusieurs sources sélectionnées — la recherche peut être plus longue à charger.';

  @override
  String searchError(String error) {
    return 'Erreur de recherche : $error';
  }

  @override
  String get shameWarningMessage =>
      'Vous ne devriez pas chercher ça. Ce type de contenu n\'est jamais autorisé ici, sans exception. Vous devriez avoir honte.';

  @override
  String get shameWarningButton => 'J\'ai compris';

  @override
  String get viewerOpenBrowser => 'Ouvrir dans le navigateur';

  @override
  String get viewerPermissionDenied =>
      'Permission d\'accès à la galerie refusée';

  @override
  String get viewerSaved => 'Enregistré dans la galerie';

  @override
  String viewerDownloadError(String error) {
    return 'Erreur de téléchargement : $error';
  }

  @override
  String get viewerTagSearchTooltip => 'Rechercher uniquement ce tag';

  @override
  String get viewerTagAddTooltip => 'Ajouter à la recherche actuelle';

  @override
  String viewerTagAdded(String tag) {
    return '« $tag » ajouté à la recherche actuelle';
  }

  @override
  String get savedSearchesTitle => 'Recherches enregistrées';

  @override
  String get savedSearchesEmpty =>
      'Aucune recherche enregistrée pour l\'instant';

  @override
  String get savedSearchesSaveButton => 'Enregistrer l\'actuelle';

  @override
  String get savedSearchesDialogTitle => 'Enregistrer la recherche';

  @override
  String get savedSearchesDialogHint => 'Nom de la recherche';

  @override
  String get savedSearchesDialogSave => 'Enregistrer';

  @override
  String get savedSearchesDialogCancel => 'Annuler';

  @override
  String get savedSearchesSaved => 'Recherche enregistrée';

  @override
  String get savedSearchesDeleteTooltip => 'Supprimer';
}
