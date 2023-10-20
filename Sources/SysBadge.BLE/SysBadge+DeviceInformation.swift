//
//  File.swift
//  
//
//  Created by Finn Behrens on 20.10.23.
//

import Foundation

import AsyncBluetooth

extension BLESysBadge {
    public var modelNumber: String {
        get async throws {
            try await self.peripheral.readValue(forDISCharacteristic: .modelNumber)!
        }
    }
    
    public var serialNumber: String {
        get async throws {
            try await self.peripheral.readValue(forDISCharacteristic: .serialNumber)!
        }
    }
    
    public var firmwareRevision: String {
        get async throws {
            try await self.peripheral.readValue(forDISCharacteristic: .firmwareRevision)!
        }
    }
    
    public var hardwareRevision: String {
        get async throws {
            try await self.peripheral.readValue(forDISCharacteristic: .hardwareRevision)!
        }
    }
    
    public var softwareRevision: String {
        get async throws {
            try await self.peripheral.readValue(forDISCharacteristic: .softwareRevision)!
        }
    }
    
    public var manufacturerName: String {
        get async throws {
            try await self.peripheral.readValue(forDISCharacteristic: .manufacturerName)!
        }
    }
    
    public struct DeviceInformation {
        let modelNumber: String
        let serialNumber: String
        let hardwareRevision: String
        let firmwareRevision: String
        let softwareRevision: String
        let manufacturerName: String
    }
    
    /// Get the Device Infromation Table from the SysBadge.
    public func deviceInformation() async throws -> DeviceInformation {
        DeviceInformation(
            modelNumber: try await self.modelNumber,
            serialNumber: try await self.serialNumber,
            hardwareRevision: try await self.hardwareRevision,
            firmwareRevision: try await self.firmwareRevision,
            softwareRevision: try await self.softwareRevision,
            manufacturerName: try await self.manufacturerName
        )
    }
}

