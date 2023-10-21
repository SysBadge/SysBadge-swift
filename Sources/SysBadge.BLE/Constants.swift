//  Bluetooth Services UUIDs
//
//  Constants.swift
//
//
//  Created by Finn Behrens on 20.10.23.
//

import CoreBluetooth
import Foundation

import AsyncBluetooth

public enum Services: CaseIterable, UUIDIterable {
    case deviceInformationService
    case sysBadgeService
}

extension Services: RawRepresentable {
    public typealias RawValue = CBUUID

    public init?(rawValue: RawValue) {
        if rawValue == Self.deviceInformationService.rawValue {
            self = .deviceInformationService
        } else if rawValue == Self.sysBadgeService.rawValue {
            self = .sysBadgeService
        } else {
            return nil
        }
    }

    public var rawValue: RawValue {
        switch self {
        case .deviceInformationService:
            CBUUID(string: "180A")
        case .sysBadgeService:
            CBUUID(string: "")
        }
    }
}

extension Services: CustomStringConvertible {
    public var description: String {
        switch self {
        case .deviceInformationService:
            "Device Information Service"
        case .sysBadgeService:
            "SysBadge Service"
        }
    }
}

public protocol UUIDIterable {
    static var allUUIDs: [CBUUID] { get }
}

public extension UUIDIterable where Self: CaseIterable, Self: RawRepresentable<CBUUID> {
    static var allUUIDs: [CBUUID] {
        allCases.map(\.rawValue)
    }
}
