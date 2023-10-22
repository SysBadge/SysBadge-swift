//  System json definition files
//
//  System.swift
//
//
//  Created by Finn Behrens on 21.10.23.
//

import Foundation

public struct System: Codable, Equatable, Hashable {
    public var name: String
    public var source_id: Source
    public var members: [Member]

    public enum Source: Codable, Equatable, Hashable {
        case none
        case pluralKit(id: String)
        case pronounsCC(id: String)
        
        enum CodingKeys: String, CodingKey {
            case none = "None"
            case pluralKit = "PluralKit"
            case pronounsCC = "PronounsCC"
        }
    }

    public struct Member: Codable, Equatable, Hashable {
        public var name: String
        public var pronouns: String

        public init(name: String, pronouns: String) {
            self.name = name
            self.pronouns = pronouns
        }
    }
}

extension System: SysBadge {
    public var memberCount: UInt16 {
        UInt16(members.count)
    }
}

extension System.Member: SysBadgeMember {}


extension System.Source: CustomStringConvertible {
    public var description: String {
        switch self {
            case .none:
                "No Source"
            case .pluralKit(let id):
                "PluralKit: \(id)"
            case .pronounsCC(let id):
                "PronounsCC: \(id)"
        }
    }
}

@available(iOS 16, macOS 13, *)
extension System.Source: CustomLocalizedStringResourceConvertible {
    public var localizedStringResource: LocalizedStringResource {
        LocalizedStringResource(stringLiteral: self.description)
    }
}
