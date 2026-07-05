# Orizon

Orizon is a mobile booru client built with Flutter. It searches whatever
image board sources you add yourself — nothing is bundled or promoted by
default beyond a single safe preset (Safebooru).

## Content policy

- Adult content is **off by default**. You can turn it on in Settings, but
  what you see after that depends entirely on the setting and the sources
  you choose to add. Orizon does not promote or endorse adult content.
- One rule is fixed and cannot be changed from the UI: Orizon will never
  show content that sexualizes minors, under any configuration. Trying to
  search for it triggers a hard warning instead of a result.

## Features

- Tag search with live autocomplete and chip-based input
- Multi-booru mode: search several sources at once
- Source manager with quick suggestions (Danbooru, Gelbooru, e621, Konachan)
  plus support for any custom booru (Danbooru / Gelbooru 0.2 / Moebooru APIs)
- Full-screen viewer with pinch-to-zoom and video playback
- Favorites and download history, saving straight to your gallery
- Tag blacklist (yours, on top of the fixed base rule above) and an
  optional AI-generated image filter
- 4 color themes, custom typography, light/dark variants
- 10 languages: English, Portuguese, Spanish, French, German, Italian,
  Japanese, Korean, Chinese, Russian
- A News tab with the changelog and a live status/ping check for your
  configured sources, run from your own device

## Tech stack

Flutter, Riverpod, Drift (SQLite), Dio, go_router.

## Getting started

```bash
flutter pub get
flutter gen-l10n
flutter run
```

## Community

- Discord (Brazilian community): https://discord.gg/FMsS8QnAtT
- Support the project: https://buymeacoffee.com/rizuwu

## License

GPL-3.0. See [LICENSE](LICENSE).
