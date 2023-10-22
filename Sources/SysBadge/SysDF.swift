//
//  SysDF.swift
//
//
//  Created by Finn Behrens on 21.10.23.
//

import CryptoKit
import Foundation

public struct SystemFile {
    public var name: String
    public var flags: Flags
    public var payload: Data
    public var json: System?
    public var rest: Data

    public struct Flags: OptionSet, Codable, Equatable {
        public let rawValue: UInt32

        static let shaChecksum = Flags(rawValue: 1 << 0)
        static let jsonBlob = Flags(rawValue: 1 << 3)

        public init(rawValue: UInt32) {
            self.rawValue = rawValue
        }
    }
}

extension SystemFile {
    static let headerSize = 212
    static let magicNumber = Data([0x53, 0x59, 0x42, 0x44])

    public init(contentsOf: URL, verify: Bool = true, options: Data.ReadingOptions = []) throws {
        let data = try Data(contentsOf: contentsOf, options: options)
        try self.init(data: data, verify: verify)
    }

    public init(data: Data, verify: Bool = true) throws {
        let headerData = data[..<Self.headerSize]
        guard headerData.starts(with: Self.magicNumber),
              headerData.loadU32(offset: 4) == 1
        else {
            throw FileReadError.invalidDataError
        }
        flags = Flags(rawValue: headerData.loadU32(offset: 8))
        let bin_len = headerData.loadU32(offset: 12)
        let json_len = headerData.loadU32(offset: 16)

        guard data.count >= UInt32(Self.headerSize) + bin_len + json_len else {
            throw FileReadError.notEnoughData
        }

        let json_end = Self.headerSize + Int(bin_len + json_len)
        if flags.contains(.shaChecksum), verify {
            var hasher = SHA256()
            hasher.update(data: data[Self.headerSize ..< Int(bin_len + json_len) + Self.headerSize])
            let hash = hasher.finalize()

            if !data[json_end ..< json_end + 32].starts(with: hash) {
                throw FileReadError.hashMissmatch
            }
        }

        payload = data.subdata(in: Self.headerSize ..< Int(bin_len) + Self.headerSize)
        rest = data.subdata(in: json_end ..< data.count)

        if flags.contains(.jsonBlob) {
            json = try JSONDecoder().decode(System.self, from: data[json_end - Int(json_len) ..< json_end])
        }

        let strEnd = (headerData[20...].firstIndex(of: 0) ?? Self.headerSize - 20) + 20
        name = String(data: headerData[20 ..< strEnd], encoding: .utf8) ?? ""
    }
}

extension Data {
    func loadU32(offset: Int = 0) -> UInt32 {
        withUnsafeBytes { rawBuffer in
            rawBuffer.load(fromByteOffset: offset, as: UInt32.self)
        }
    }
}

public enum FileReadError: Error {
    case invalidDataError
    case notEnoughData
    case hashMissmatch
}

extension FileReadError: LocalizedError {}
