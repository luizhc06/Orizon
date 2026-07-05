# Play Store listing — draft copy

Reference text for the Play Console store listing form. Edit freely before
submitting; nothing here is final.

## App name

Orizon

## Short description (max 80 characters)

A booru client to search, favorite and download images — safe by default

## Full description

```
Orizon is a fast, clean client for booru-style image boards. Add the
sources you want, search by tag, and browse with a smooth grid you can
customize.

FEATURES
• Tag search with live autocomplete and a chip-based search bar
• Multi-booru mode — search several sources at once
• Add any custom source (Danbooru, Gelbooru, Moebooru-compatible APIs),
  plus quick suggestions for popular ones
• Full-screen viewer with pinch-to-zoom and video playback
• Favorites and download history, saved straight to your gallery
• Tag blacklist, plus an optional filter for AI-generated images
• 4 color themes and a distinct, comfy typography
• 10 languages supported
• A News tab with the changelog and a live status check for your
  sources, run from your own device

CONTENT AND SAFETY
Adult content is off by default. You decide if and when to turn it on in
Settings, and what you see after that depends entirely on your own
configuration and the sources you choose to add — Orizon does not
promote or suggest adult sources. One rule never changes, no matter your
settings: Orizon will never display content that sexualizes minors.

Join the community on Discord, and consider supporting development on
Buy Me a Coffee — both links are in Settings.
```

## Content rating questionnaire (IARC) — guidance, not a final answer

Fill this out yourself in Play Console, honestly, based on the app as
submitted. Relevant points:

- The app supports an adult-content toggle (off by default) whose actual
  content depends on user-added third-party sources. Answer the
  "sexual content" / "user-generated content" questions accordingly —
  expect this to land on a **Mature 17+** (or similar) rating rather
  than an all-ages one. That's normal for this app category and is not
  itself a rejection reason.
- There is no violence, gambling, or controlled-substance content
  built into the app itself.
- Reminder from earlier in this project: policy enforcement for this
  app category has been historically inconsistent (see LoliSnatcher's
  own history). Answering honestly is still the right call, and this
  app's design (off by default, no adult presets, fixed blacklist that
  can't be disabled) is the strongest mitigation available.

## Data safety section — guidance

Orizon collects no personal data and has no analytics/ads SDKs. For each
Play Console data-safety category, the honest answer is **"No data
collected"** — see [PRIVACY.md](PRIVACY.md) for the full explanation
(local-only storage, direct device-to-source network requests).

## Privacy policy URL

https://github.com/luizhc06/Orizon/blob/main/PRIVACY.md

## Assets checklist

- [ ] Hi-res icon, 512×512 PNG (store listing icon, separate from the
      launcher icon already generated)
- [ ] Feature graphic, 1024×500 PNG/JPG
- [ ] Phone screenshots, at least 2 (see `screenshots/` once captured)
- [ ] `app-release.aab` from `flutter build appbundle --release`
