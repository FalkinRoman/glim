# Glim

Разблокировка Mac по лицу — меню-бар приложение для macOS 15+.

> **Важно:** Glim — не Face ID / Touch ID. На Mac нет depth-камеры iPhone; пароль вводится через Accessibility. Это удобство, не апгрейд безопасности.

## Сборка (macOS + Xcode)

1. Открой `Glim/Glim.xcodeproj` в Xcode 16+.
2. Убедись, что в бандле есть `Glim/Models/ArcFace.mlpackage` (см. `tools/convert_arcface.py` и `docs` в Project store).
3. Signing: выбери свою Team; bundle id — `app.glim.macos`.
4. Run (`⌘R`).

### Первый запуск

1. Выдай доступ к **камере**.
2. Пройди онбординг (круговой захват лица — как Face ID).
3. Сохрани пароль Mac за Touch ID.
4. Включи Face Unlock в настройках (тёмный UI, язык по умолчанию — русский).

Без ArcFace разблокировка **заблокирована** (Vision fallback только для Face Lab / отладки).

## Assets

- Menu bar: `Glim/Assets.xcassets/MenuBarIcon.imageset/` — template SVG. Перегенерация: `python3 tools/assets/generate_menu_bar_icon.py`
- App icon: `Glim/glimicon.icon` + `appicon.imageset`. Placeholder: `python3 tools/assets/generate_app_icon_placeholder.py`

## Структура

```
Glim/
  Glim/                 # исходники приложения
  Glim.xcodeproj/
  tools/                # ArcFace convert + asset generators
```

## English (short)

Face unlock for Mac. Keep Face ID–familiar enrollment/unlock. Dark settings, Russian default. ArcFace required for production unlock. MIT-derived from Glance; see `THIRD_PARTY_NOTICE_Glance_MIT.txt`.
