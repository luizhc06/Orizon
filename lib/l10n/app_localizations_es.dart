// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Spanish Castilian (`es`).
class AppLocalizationsEs extends AppLocalizations {
  AppLocalizationsEs([String locale = 'es']) : super(locale);

  @override
  String get appTitle => 'Orizon';

  @override
  String get onboardingWelcome => 'Bienvenido a Orizon';

  @override
  String get onboardingBody1 =>
      'Orizon es un cliente de boorus que busca en las fuentes que tú mismo agregues. El interruptor de contenido adulto está desactivado por defecto — lo que aparece depende solo de tu propia configuración y elecciones. La responsabilidad de esa elección es tuya.';

  @override
  String get onboardingBody2 =>
      'Una excepción fija que siempre aplica, sin importar la configuración: Orizon nunca muestra contenido que sexualice a menores, sin excepciones.';

  @override
  String get onboardingBody3 =>
      'Puedes gestionar las fuentes y la lista de bloqueo cuando quieras, en los ajustes.';

  @override
  String get onboardingStart => 'Comenzar';

  @override
  String onboardingStartWithTimer(int seconds) {
    return 'Comenzar (${seconds}s)';
  }

  @override
  String get navHome => 'Inicio';

  @override
  String get navNews => 'Novedades';

  @override
  String get navFavorites => 'Favoritos';

  @override
  String get navSettings => 'Ajustes';

  @override
  String get newsTitle => 'Novedades';

  @override
  String get newsChangelogTab => 'Registro de cambios';

  @override
  String get newsStatusTab => 'Estado de los sitios';

  @override
  String get siteStatusChecking => 'Comprobando...';

  @override
  String get siteStatusOffline => 'Fuera de línea';

  @override
  String siteStatusLatency(int ms) {
    return '$ms ms';
  }

  @override
  String get settingsTitle => 'Ajustes';

  @override
  String get settingsSources => 'Fuentes';

  @override
  String get settingsBlacklist => 'Lista negra de etiquetas';

  @override
  String get settingsHideAi => 'Ocultar imágenes de IA';

  @override
  String get settingsHideAiSubtitle =>
      'Oculta publicaciones marcadas con etiquetas de generación por IA (Stable Diffusion, NovelAI, Midjourney, etc.).';

  @override
  String get settingsDownloadHistory => 'Historial de descargas';

  @override
  String get settingsShowAdult => 'Mostrar contenido adulto';

  @override
  String get settingsShowAdultSubtitle =>
      'Desactivado por defecto. Orizon no promueve contenido adulto. Si activas esta opción, pueden aparecer imágenes sexualmente explícitas o sugerentes, según las fuentes que tú mismo agregues. La responsabilidad de esa elección es tuya.';

  @override
  String get settingsMultiBooru => 'Búsqueda multi-booru';

  @override
  String get settingsMultiBooruSubtitle =>
      'Buscar en varias fuentes a la vez en lugar de solo una. Puede tardar más en cargar.';

  @override
  String get settingsTheme => 'Tema';

  @override
  String get settingsGridColumns => 'Columnas de la cuadrícula';

  @override
  String get settingsGridStyle => 'Estilo de la cuadrícula';

  @override
  String get settingsGridStyleSubtitle =>
      'Orgánico ajusta cada vista previa según la proporción de la imagen; uniforme usa celdas del mismo tamaño.';

  @override
  String get settingsGridOrganic => 'Orgánico';

  @override
  String get settingsGridUniform => 'Uniforme';

  @override
  String get settingsLanguage => 'Idioma';

  @override
  String get settingsDiscord => 'Discord';

  @override
  String get settingsDiscordSubtitle => 'Comunidad brasileña de Orizon 🇧🇷';

  @override
  String get settingsSupport => 'Apoya el proyecto (Buy Me a Coffee)';

  @override
  String get settingsAbout => 'Acerca de';

  @override
  String get settingsBackupTitle => 'Copia de seguridad';

  @override
  String get settingsBackupExport => 'Exportar copia de seguridad';

  @override
  String get settingsBackupImport => 'Restaurar copia de seguridad';

  @override
  String get settingsBackupImportSuccess => 'Copia de seguridad restaurada';

  @override
  String settingsBackupImportError(String error) {
    return 'Error al restaurar: $error';
  }

  @override
  String get settingsCacheTitle => 'Caché';

  @override
  String get settingsCacheClearNow => 'Limpiar caché ahora';

  @override
  String get settingsCacheCleared => 'Caché limpiada';

  @override
  String get settingsCacheAutoClear =>
      'Limpiar caché automáticamente al cerrar';

  @override
  String get settingsCacheAutoClearSubtitle =>
      'Desactivado por defecto. Si se activa, la caché de imágenes se limpia cada vez que cierras la app.';

  @override
  String get themeWhiteRed => 'Blanco + rojo';

  @override
  String get themeWhitePurple => 'Blanco + morado';

  @override
  String get themeBlackRed => 'Negro + rojo';

  @override
  String get themePurpleBlack => 'Morado + negro';

  @override
  String get aboutTitle => 'Acerca de';

  @override
  String get aboutSubtitle => 'Visor de boorus';

  @override
  String get aboutPrivacyPolicy => 'Política de privacidad';

  @override
  String get aboutLicenses => 'Licencias de código abierto';

  @override
  String get sourcesTitle => 'Fuentes';

  @override
  String get sourcesEmpty => 'No hay fuentes agregadas';

  @override
  String sourcesLoadError(String error) {
    return 'Error al cargar fuentes: $error';
  }

  @override
  String get sourcesAddTooltip => 'Agregar fuente personalizada';

  @override
  String get sourcesRemoveTooltip => 'Eliminar fuente';

  @override
  String get sourceFormNew => 'Nueva fuente';

  @override
  String get sourceFormEdit => 'Editar fuente';

  @override
  String get sourceFormSuggestions => 'Sugerencias';

  @override
  String get sourceFormName => 'Nombre';

  @override
  String get sourceFormBaseUrl => 'URL base';

  @override
  String get sourceFormApiType => 'Tipo de API';

  @override
  String get sourceFormUsername => 'Usuario (opcional)';

  @override
  String get sourceFormApiKey => 'Clave API (opcional)';

  @override
  String get sourceFormRequired => 'Obligatorio';

  @override
  String get sourceFormInvalidUrl => 'URL inválida';

  @override
  String get apiTypeDanbooru => 'Danbooru (y derivados)';

  @override
  String get apiTypeGelbooru => 'Gelbooru 0.2 (Gelbooru/Safebooru/Rule34)';

  @override
  String get apiTypeMoebooru => 'Moebooru (yande.re/konachan)';

  @override
  String get blacklistTitle => 'Lista negra de etiquetas';

  @override
  String get blacklistFixed => 'Siempre bloqueadas (fijo, no editable)';

  @override
  String get blacklistUser => 'Tus etiquetas bloqueadas';

  @override
  String get blacklistAddHint => 'agregar etiqueta...';

  @override
  String errorGeneric(String error) {
    return 'Error: $error';
  }

  @override
  String get favoritesTitle => 'Favoritos';

  @override
  String get favoritesEmpty => 'Aún no hay favoritos';

  @override
  String get downloadHistoryTitle => 'Historial de descargas';

  @override
  String get downloadHistoryEmpty => 'Aún no hay descargas';

  @override
  String get searchRefreshTooltip => 'Buscar de nuevo';

  @override
  String get searchTagHint => 'Agregar etiqueta...';

  @override
  String get searchNoSourceEnabled => 'Ninguna fuente habilitada';

  @override
  String get searchNoSourceSelected => 'Ninguna fuente seleccionada';

  @override
  String get searchLoading => 'Buscando...';

  @override
  String get searchEmptyState => 'Agrega una etiqueta para empezar';

  @override
  String get searchMultiWarning =>
      'Varias fuentes seleccionadas — la búsqueda puede tardar más en cargar.';

  @override
  String searchError(String error) {
    return 'Error en la búsqueda: $error';
  }

  @override
  String get shameWarningMessage =>
      'No deberías estar buscando esto. Este tipo de contenido nunca está permitido aquí, sin excepciones. Deberías avergonzarte.';

  @override
  String get shameWarningButton => 'Entendido';

  @override
  String get viewerOpenBrowser => 'Abrir en el navegador';

  @override
  String get viewerPermissionDenied => 'Permiso de galería denegado';

  @override
  String get viewerSaved => 'Guardado en la galería';

  @override
  String viewerDownloadError(String error) {
    return 'Error al descargar: $error';
  }
}
