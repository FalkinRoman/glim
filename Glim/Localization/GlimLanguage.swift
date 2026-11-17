//
//  GlimLanguage.swift
//  Glim
//
//  App UI language — independent of macOS system locale. Default is Russian.
//

import Foundation

enum GlimLanguage: String, CaseIterable, Identifiable, Codable {
    case ru
    case en
    case de

    var id: String { rawValue }

    var displayName: String {
        switch self {
        case .ru: return "Русский"
        case .en: return "English"
        case .de: return "Deutsch"
        }
    }

    var localeIdentifier: String {
        switch self {
        case .ru: return "ru"
        case .en: return "en"
        case .de: return "de"
        }
    }
}
