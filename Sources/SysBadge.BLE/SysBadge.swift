//
//  SysBadge.swift
//
//
//  Created by Finn Behrens on 20.10.23.
//

import Foundation

import AsyncBluetooth

import SysBadge

public actor BLESysBadge {
    public let peripheral: Peripheral

    public init(preripheral: Peripheral) async throws {
        peripheral = preripheral
    }
}

extension BLESysBadge: SysBadge {
    public var name: String {
        get async throws {
            try await peripheral.readValue(forSysBadgeCharacteristic: .name)!
        }
    }

    public var memberCount: UInt16 {
        get async throws {
            fatalError("todo")
        }
    }
}
