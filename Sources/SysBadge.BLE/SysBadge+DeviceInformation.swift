//
//  SysBadge+DeviceInformation.swift
//
//
//  Created by Finn Behrens on 20.10.23.
//

import Foundation

import AsyncBluetooth

import SysBadge

public extension BLESysBadge {
    var modelNumber: String {
        get async throws {
            try await peripheral.readValue(forDISCharacteristic: .modelNumber)!
        }
    }

    var serialNumber: String {
        get async throws {
            try await peripheral.readValue(forDISCharacteristic: .serialNumber)!
        }
    }

    var firmwareRevision: String {
        get async throws {
            try await peripheral.readValue(forDISCharacteristic: .firmwareRevision)!
        }
    }

    var hardwareRevision: String {
        get async throws {
            try await peripheral.readValue(forDISCharacteristic: .hardwareRevision)!
        }
    }

    var softwareRevision: String {
        get async throws {
            try await peripheral.readValue(forDISCharacteristic: .softwareRevision)!
        }
    }

    var manufacturerName: String {
        get async throws {
            try await peripheral.readValue(forDISCharacteristic: .manufacturerName)!
        }
    }

    /// Get the Device Infromation Table from the SysBadge.
    func deviceInformation() async throws -> DeviceInformation {
        try DeviceInformation(
            modelNumber: await modelNumber,
            serialNumber: await serialNumber,
            hardwareRevision: await hardwareRevision,
            firmwareRevision: await firmwareRevision,
            softwareRevision: await softwareRevision,
            manufacturerName: await manufacturerName
        )
    }
}
