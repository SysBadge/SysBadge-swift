//
//  Peripheral+Extension.swift
//  
//
//  Created by Finn Behrens on 20.10.23.
//

import Foundation

import AsyncBluetooth

public extension Peripheral {
    func readValue<Value>(forDISCharacteristic: Services.DeviceInformationService) async throws -> Value? where Value: PeripheralDataConvertible {
        try await self.readValue(forCharacteristicWithCBUUID: forDISCharacteristic.rawValue, ofServiceWithCBUUID: Services.deviceInformationService.rawValue)
    }
    
    func readValue<Value>(forSysBadgeCharacteristic: Services.SysBadgeService) async throws -> Value? where Value: PeripheralDataConvertible {
        try await self.readValue(forCharacteristicWithCBUUID: forSysBadgeCharacteristic.rawValue, ofServiceWithCBUUID: Services.sysBadgeService.rawValue)
    }
}
