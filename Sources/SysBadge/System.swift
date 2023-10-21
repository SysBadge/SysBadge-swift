//  System json definition files
//
//  System.swift
//
//
//  Created by Finn Behrens on 21.10.23.
//

import Foundation

public struct System: Codable, Equatable {
    public var name: String
    public var source_id: Source
    public var members: [Member]

    public enum Source: Codable, Equatable {
        case None
        case PluralKit(id: String)
        case PronounsCC(id: String)
    }

    public struct Member: Codable, Equatable {
        public var name: String
        public var pronouns: String
    }
}

extension System: SysBadge {
    public var memberCount: UInt16 {
        UInt16(members.count)
    }
}

extension System.Member: SysBadgeMember {}
