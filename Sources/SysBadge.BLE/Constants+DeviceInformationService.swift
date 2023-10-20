//  Device Infromation Services UUIDs
//
//  Constants+DeviceINformationService.swift
//
//
//  Created by Finn Behrens on 20.10.23.
//

import Foundation
import CoreBluetooth

extension Services {
    public enum DeviceInformationService: CaseIterable {
        case modelNumber
        case serialNumber
        case firmwareRevision
        case hardwareRevision
        case softwareRevision
        case manufacturerName
    }
}

extension Services.DeviceInformationService: RawRepresentable {
    public typealias RawValue = CBUUID
    
    public init?(rawValue: CBUUID) {
        nil
    }
    
    public var rawValue: CBUUID {
        switch self {
            case .modelNumber:
                CBUUID(string: "2A24")
            case .serialNumber:
                CBUUID(string: "2A25")
            case .firmwareRevision:
                CBUUID(string: "2A26")
            case .hardwareRevision:
                CBUUID(string: "2A27")
            case .softwareRevision:
                CBUUID(string: "2A28")
            case .manufacturerName:
                CBUUID(string: "2A29")
        }
    }
}

/*
extension Services.DeviceInformationService: CustomStringConvertible {
    public var description: String {
        switch self {
            case .modelNumber:
                "Model Number"
        }
    }
}
*/
