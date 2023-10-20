//  Generic SysBadge protocol
//
//  Constants.swift
//
//
//  Created by Finn Behrens on 20.10.23.
//

/// SysBadge  containing a name and a member count
public protocol SysBadge {
    /// Name of the System.
    var name: String { get async throws }
    /// Member count of the System.
    var memberCount: UInt16 { get async throws }
}

/// Member containing a name and pronouns.
public protocol SysBadgeMember {
    /// Name of the member.
    var name: String { get async throws }
    /// Pronouns of the member.
    var pronouns: String { get async throws }
}
