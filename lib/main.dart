import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'core/providers.dart';
import 'core/router.dart';
import 'core/theme.dart';
import 'features/onboarding/onboarding_screen.dart';
import 'features/settings/settings_providers.dart';
import 'features/sources/sources_providers.dart';
import 'l10n/app_localizations.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();

  runApp(
    ProviderScope(
      overrides: [sharedPreferencesProvider.overrideWithValue(prefs)],
      child: const OrizonApp(),
    ),
  );
}

class OrizonApp extends ConsumerStatefulWidget {
  const OrizonApp({super.key});

  @override
  ConsumerState<OrizonApp> createState() => _OrizonAppState();
}

class _OrizonAppState extends ConsumerState<OrizonApp>
    with WidgetsBindingObserver {
  bool _seeding = true;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    _seed();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.paused ||
        state == AppLifecycleState.detached) {
      if (ref.read(autoClearCacheProvider)) {
        DefaultCacheManager().emptyCache();
      }
    }
  }

  Future<void> _seed() async {
    await ensurePresetSourcesSeeded(ref.read(appDatabaseProvider));
    if (mounted) setState(() => _seeding = false);
  }

  @override
  Widget build(BuildContext context) {
    if (_seeding) {
      return const MaterialApp(
        home: Scaffold(body: Center(child: CircularProgressIndicator())),
      );
    }

    final themePreset = ref.watch(themePresetProvider);
    final locale = ref.watch(appLocaleProvider);
    final prefs = ref.watch(sharedPreferencesProvider);
    final onboardingDone = isOnboardingDone(prefs);

    return MaterialApp.router(
      title: 'Orizon',
      debugShowCheckedModeBanner: false,
      theme: themeForPreset(themePreset),
      locale: locale,
      supportedLocales: supportedAppLocales,
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      routerConfig: appRouter,
      builder: (context, child) {
        if (!onboardingDone) {
          return OnboardingScreen(
            onDone: () async {
              await markOnboardingDone(prefs);
              setState(() {});
            },
          );
        }
        return child!;
      },
    );
  }
}
