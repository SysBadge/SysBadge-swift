//
//  File.swift
//  
//
//  Created by Finn Behrens on 20.10.23.
//

import Foundation

public struct DeviceInformation {
    public let modelNumber: String
    public let serialNumber: String
    public let hardwareRevision: String
    public let firmwareRevision: String
    public let softwareRevision: String
    public let manufacturerName: String

    public init(modelNumber: String, serialNumber: String, hardwareRevision: String, firmwareRevision: String, softwareRevision: String, manufacturerName: String) {
        self.modelNumber = modelNumber
        self.serialNumber = serialNumber
        self.hardwareRevision = hardwareRevision
        self.firmwareRevision = firmwareRevision
        self.softwareRevision = softwareRevision
        self.manufacturerName = manufacturerName
    }
}
