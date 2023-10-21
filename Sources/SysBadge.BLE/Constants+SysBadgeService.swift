//  SysBadge Service UUIDs
//
//  Constants+SysBadgeService.swift
//
//
//  Created by Finn Behrens on 20.10.23.
//

import CoreBluetooth
import Foundation

public extension Services {
    enum SysBadgeService: CaseIterable {
        case name
    }
}

extension Services.SysBadgeService: RawRepresentable {
    public typealias RawValue = CBUUID

    public init?(rawValue _: CBUUID) {
        nil
    }

    public var rawValue: CBUUID {
        switch self {
        case .name:
            CBUUID(string: "foo1")
        }
    }
}

extension Services.SysBadgeService: CustomStringConvertible {
    public var description: String {
        switch self {
        case .name:
            "Name"
        }
    }
}
