//
//  L10n.swift
//  Glim
//
//  Lightweight string table. Reads a nonisolated mirror of
//  `GlimSettings.preferredLanguage` (updated on the main actor).
//  Falls back to Russian, then English, then the key itself.
//

import Foundation

enum L10n {
    /// Mirrored from `GlimSettings` so background unlock paths can localize without hopping actors.
    nonisolated(unsafe) static var currentLanguage: GlimLanguage = .ru

    nonisolated static func t(_ key: String) -> String {
        string(key, language: currentLanguage)
    }

    @MainActor
    static func string(_ key: String) -> String {
        string(key, language: GlimSettings.shared.preferredLanguage)
    }

    nonisolated static func string(_ key: String, language: GlimLanguage) -> String {
        if let value = table[language]?[key] { return value }
        if let value = table[.ru]?[key] { return value }
        if let value = table[.en]?[key] { return value }
        return key
    }

    static let cameraUsageRU =
        "Glim использует камеру на устройстве, чтобы распознать ваше лицо и разблокировать Mac. Кадры обрабатываются локально и не сохраняются."
    static let cameraUsageEN =
        "Glim uses the on-device camera to recognize your face and unlock your Mac. Frames are processed locally and are never stored."

    private static let table: [GlimLanguage: [String: String]] = [
        .ru: [
            "app.name": "Glim",
            "menu.settings": "Настройки",
            "menu.quit": "Выйти",
            "menu.sessionUnlocked": "Сессия разблокирована",
            "menu.sessionLocked": "Сессия заблокирована",
            "settings.windowTitle": "Настройки Glim",
            "settings.sessionUnlocked": "Сессия разблокирована",
            "settings.sessionLocked": "Сессия заблокирована",
            "general.launchAtLogin": "Запуск при входе",
            "general.showInMenuBar": "Показывать в строке меню",
            "general.enableFaceUnlock": "Включить Face Unlock",
            "general.triggers": "Триггеры (можно несколько)",
            "general.trigger.onWake": "При пробуждении",
            "general.trigger.onLock": "При блокировке",
            "general.trigger.onSpace": "По пробелу",
            "general.displayOn": "Показывать на",
            "general.mainDisplay": "Основном дисплее",
            "general.behaviour": "Поведение",
            "general.retryOnHover": "Повтор при наведении на вырез",
            "general.autoRetry": "Автоповтор один раз после ошибки",
            "general.haptics": "Тактильный отклик",
            "general.faceDetectionDuration": "Длительность поиска лица",
            "general.language": "Язык",
            "general.sessionLocked": "Сессия заблокирована",
            "general.unlockSession": "Разблокировать сессию",
            "general.authenticating": "Аутентификация…",
            "unlock.fallbackBlocked": "ArcFace недоступен — разблокировка отключена. Добавьте ArcFace.mlpackage (см. docs).",
            "unlock.looking": "Ищем ваше лицо…",
            "unlock.recognized": "Узнали — разблокируем…",
            "unlock.notRecognized": "Лицо не распознано.",
            "unlock.noFace": "Лицо не найдено.",
            "unlock.spoof": "Не удалось подтвердить живое лицо.",
            "about.title": "О программе",
            "tab.general": "Основные",
            "tab.face": "Лицо",
            "tab.password": "Пароль",
            "tab.camera": "Камера",
            "tab.recognition": "Распознавание",
            "tab.about": "О программе",
            "security.warning.title": "Glim — не Face ID и не Touch ID",
            "security.warning.body": "На Mac нет датчиков глубины iPhone. Glim удобство, а не усиление безопасности: пароль вводится через Accessibility.",
        ],
        .en: [
            "app.name": "Glim",
            "menu.settings": "Settings",
            "menu.quit": "Quit",
            "menu.sessionUnlocked": "Session Unlocked",
            "menu.sessionLocked": "Session Locked",
            "settings.windowTitle": "Glim Settings",
            "settings.sessionUnlocked": "Session unlocked",
            "settings.sessionLocked": "Session locked",
            "general.launchAtLogin": "Launch at login",
            "general.showInMenuBar": "Show in menu bar",
            "general.enableFaceUnlock": "Enable Face Unlock",
            "general.triggers": "Triggers (select multiple)",
            "general.trigger.onWake": "On wake",
            "general.trigger.onLock": "On lock",
            "general.trigger.onSpace": "On space",
            "general.displayOn": "Display on",
            "general.mainDisplay": "Main display",
            "general.behaviour": "Behaviour",
            "general.retryOnHover": "Retry on notch hover",
            "general.autoRetry": "Auto retry once after failure",
            "general.haptics": "Haptic feedback",
            "general.faceDetectionDuration": "Face detection duration",
            "general.language": "Language",
            "general.sessionLocked": "Session locked",
            "general.unlockSession": "Unlock session",
            "general.authenticating": "Authenticating…",
            "unlock.fallbackBlocked": "ArcFace unavailable — unlock disabled. Add ArcFace.mlpackage (see docs).",
            "unlock.looking": "Looking for your face…",
            "unlock.recognized": "Recognized — unlocking…",
            "unlock.notRecognized": "Face not recognized.",
            "unlock.noFace": "No face detected.",
            "unlock.spoof": "Couldn't confirm a live face.",
            "about.title": "About",
            "tab.general": "General",
            "tab.face": "Your Face",
            "tab.password": "Password",
            "tab.camera": "Camera",
            "tab.recognition": "Recognition",
            "tab.about": "About",
            "security.warning.title": "Glim is not Face ID or Touch ID",
            "security.warning.body": "Macs lack iPhone depth sensors. Glim is convenience, not a security upgrade: it types your password via Accessibility.",
        ],
        .de: [
            "app.name": "Glim",
            "menu.settings": "Einstellungen",
            "menu.quit": "Beenden",
            "menu.sessionUnlocked": "Sitzung entsperrt",
            "menu.sessionLocked": "Sitzung gesperrt",
            "settings.windowTitle": "Glim Einstellungen",
            "settings.sessionUnlocked": "Sitzung entsperrt",
            "settings.sessionLocked": "Sitzung gesperrt",
            "general.launchAtLogin": "Beim Login starten",
            "general.showInMenuBar": "In der Menüleiste anzeigen",
            "general.enableFaceUnlock": "Face Unlock aktivieren",
            "general.triggers": "Auslöser (Mehrfachauswahl)",
            "general.trigger.onWake": "Beim Aufwachen",
            "general.trigger.onLock": "Beim Sperren",
            "general.trigger.onSpace": "Mit Leertaste",
            "general.displayOn": "Anzeigen auf",
            "general.mainDisplay": "Hauptanzeige",
            "general.behaviour": "Verhalten",
            "general.retryOnHover": "Erneut bei Notch-Hover",
            "general.autoRetry": "Einmaliger Auto-Retry nach Fehler",
            "general.haptics": "Haptisches Feedback",
            "general.faceDetectionDuration": "Gesichtserkennungsdauer",
            "general.language": "Sprache",
            "general.sessionLocked": "Sitzung gesperrt",
            "general.unlockSession": "Sitzung entsperren",
            "general.authenticating": "Authentifizierung…",
            "unlock.fallbackBlocked": "ArcFace fehlt — Entsperren deaktiviert. ArcFace.mlpackage hinzufügen (siehe Docs).",
            "unlock.looking": "Suche nach Ihrem Gesicht…",
            "unlock.recognized": "Erkannt — entsperre…",
            "unlock.notRecognized": "Gesicht nicht erkannt.",
            "unlock.noFace": "Kein Gesicht erkannt.",
            "unlock.spoof": "Lebendes Gesicht nicht bestätigt.",
            "about.title": "Über",
            "tab.general": "Allgemein",
            "tab.face": "Ihr Gesicht",
            "tab.password": "Passwort",
            "tab.camera": "Kamera",
            "tab.recognition": "Erkennung",
            "tab.about": "Über",
            "security.warning.title": "Glim ist nicht Face ID oder Touch ID",
            "security.warning.body": "Macs haben keine iPhone-Tiefensensoren. Glim ist Komfort, kein Sicherheits-Upgrade: das Passwort wird per Accessibility getippt.",
        ],
    ]
}
