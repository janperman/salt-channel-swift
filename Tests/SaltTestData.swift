//  SaltTestData.swift
//  SaltChannel-Tests
//
//  Created by Kenneth Pernyer on 2017-10-05.

import XCTest
import CocoaLumberjack

@testable import SaltChannel

typealias Byte = UInt8

public class SaltTestData {
    private let testdata: [Item: [Byte]]
    
    init(name: String) {
        self.testdata = TestData.dataSets[name] ?? TestData.basic_test_data
    }
    
    public func get(_ item: Item) -> Data {
        let bytes = self.testdata[item] ?? []
        return Data(bytes: bytes)
    }
}

public enum Item {
    case client_sk_sec
    case client_sk_pub
    case client_ek_sec
    case client_ek_pub
    case host_sk_sec
    case host_sk_pub
    case host_ek_sec
    case host_ek_pub
    case a1, a2
    case m1, m2, m3, m4
    case msg1, msg2, msg3, msg4
    case plain1, plain2, plain3, plain4
}

public enum TestData {

    static let dataSets: [String: [Item: [Byte]]] = [
        "Empty" : empty_test_data,
        "Basic" : basic_test_data,
        "S1"    : session_1_test_data,
        "S2"    : session_2_test_data,
        "S3"    : session_3_test_data
    ]
    
    static let empty_test_data: [Item: [Byte]] = [:]
    
    static let basic_test_data: [Item: [Byte]] = [
    .client_sk_sec : [
    0x55, 0xf4, 0xd1, 0xd1, 0x98, 0x09, 0x3c, 0x84,
    0xde, 0x9e, 0xe9, 0xa6, 0x29, 0x9e, 0x0f, 0x68,
    0x91, 0xc2, 0xe1, 0xd0, 0xb3, 0x69, 0xef, 0xb5,
    0x92, 0xa9, 0xe3, 0xf1, 0x69, 0xfb, 0x0f, 0x79,
    0x55, 0x29, 0xce, 0x8c, 0xcf, 0x68, 0xc0, 0xb8,
    0xac, 0x19, 0xd4, 0x37, 0xab, 0x0f, 0x5b, 0x32,
    0x72, 0x37, 0x82, 0x60, 0x8e, 0x93, 0xc6, 0x26,
    0x4f, 0x18, 0x4b, 0xa1, 0x52, 0xc2, 0x35, 0x7b
    ],
    .client_sk_pub : [
    0x55, 0x29, 0xce, 0x8c, 0xcf, 0x68, 0xc0, 0xb8,
    0xac, 0x19, 0xd4, 0x37, 0xab, 0x0f, 0x5b, 0x32,
    0x72, 0x37, 0x82, 0x60, 0x8e, 0x93, 0xc6, 0x26,
    0x4f, 0x18, 0x4b, 0xa1, 0x52, 0xc2, 0x35, 0x7b
    ],
    .client_ek_sec : [
    0x77, 0x07, 0x6d, 0x0a, 0x73, 0x18, 0xa5, 0x7d,
    0x3c, 0x16, 0xc1, 0x72, 0x51, 0xb2, 0x66, 0x45,
    0xdf, 0x4c, 0x2f, 0x87, 0xeb, 0xc0, 0x99, 0x2a,
    0xb1, 0x77, 0xfb, 0xa5, 0x1d, 0xb9, 0x2c, 0x2a
    ],
    .client_ek_pub : [
    0x85, 0x20, 0xf0, 0x09, 0x89, 0x30, 0xa7, 0x54,
    0x74, 0x8b, 0x7d, 0xdc, 0xb4, 0x3e, 0xf7, 0x5a,
    0x0d, 0xbf, 0x3a, 0x0d, 0x26, 0x38, 0x1a, 0xf4,
    0xeb, 0xa4, 0xa9, 0x8e, 0xaa, 0x9b, 0x4e, 0x6a
    ],
    .host_sk_sec : [
    0x7a, 0x77, 0x2f, 0xa9, 0x01, 0x4b, 0x42, 0x33,
    0x00, 0x07, 0x6a, 0x2f, 0xf6, 0x46, 0x46, 0x39,
    0x52, 0xf1, 0x41, 0xe2, 0xaa, 0x8d, 0x98, 0x26,
    0x3c, 0x69, 0x0c, 0x0d, 0x72, 0xee, 0xd5, 0x2d,
    0x07, 0xe2, 0x8d, 0x4e, 0xe3, 0x2b, 0xfd, 0xc4,
    0xb0, 0x7d, 0x41, 0xc9, 0x21, 0x93, 0xc0, 0xc2,
    0x5e, 0xe6, 0xb3, 0x09, 0x4c, 0x62, 0x96, 0xf3,
    0x73, 0x41, 0x3b, 0x37, 0x3d, 0x36, 0x16, 0x8b
    ],
    .host_sk_pub : [
    0x07, 0xe2, 0x8d, 0x4e, 0xe3, 0x2b, 0xfd, 0xc4,
    0xb0, 0x7d, 0x41, 0xc9, 0x21, 0x93, 0xc0, 0xc2,
    0x5e, 0xe6, 0xb3, 0x09, 0x4c, 0x62, 0x96, 0xf3,
    0x73, 0x41, 0x3b, 0x37, 0x3d, 0x36, 0x16, 0x8b
    ],
    .host_ek_sec : [
    0x5d, 0xab, 0x08, 0x7e, 0x62, 0x4a, 0x8a, 0x4b,
    0x79, 0xe1, 0x7f, 0x8b, 0x83, 0x80, 0x0e, 0xe6,
    0x6f, 0x3b, 0xb1, 0x29, 0x26, 0x18, 0xb6, 0xfd,
    0x1c, 0x2f, 0x8b, 0x27, 0xff, 0x88, 0xe0, 0xeb
    ],
    .host_ek_pub : [
    0xde, 0x9e, 0xdb, 0x7d, 0x7b, 0x7d, 0xc1, 0xb4,
    0xd3, 0x5b, 0x61, 0xc2, 0xec, 0xe4, 0x35, 0x37,
    0x3f, 0x83, 0x43, 0xc8, 0x5b, 0x78, 0x67, 0x4d,
    0xad, 0xfc, 0x7e, 0x14, 0x6f, 0x88, 0x2b, 0x4f
    ],
    .m1 : [
    0x53, 0x43, 0x76, 0x32, 0x01, 0x00, 0x00, 0x00,
    0x00, 0x00, 0x85, 0x20, 0xf0, 0x09, 0x89, 0x30,
    0xa7, 0x54, 0x74, 0x8b, 0x7d, 0xdc, 0xb4, 0x3e,
    0xf7, 0x5a, 0x0d, 0xbf, 0x3a, 0x0d, 0x26, 0x38,
    0x1a, 0xf4, 0xeb, 0xa4, 0xa9, 0x8e, 0xaa, 0x9b,
    0x4e, 0x6a
    ],
    .m2 : [
    0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0xde, 0x9e,
    0xdb, 0x7d, 0x7b, 0x7d, 0xc1, 0xb4, 0xd3, 0x5b,
    0x61, 0xc2, 0xec, 0xe4, 0x35, 0x37, 0x3f, 0x83,
    0x43, 0xc8, 0x5b, 0x78, 0x67, 0x4d, 0xad, 0xfc,
    0x7e, 0x14, 0x6f, 0x88, 0x2b, 0x4f
    ],
    .m3 : [
    0x06, 0x00, 0xe4, 0x7d, 0x66, 0xe9, 0x07, 0x02,
    0xaa, 0x81, 0xa7, 0xb4, 0x57, 0x10, 0x27, 0x8d,
    0x02, 0xa8, 0xc6, 0xcd, 0xdb, 0x69, 0xb8, 0x6e,
    0x29, 0x9a, 0x47, 0xa9, 0xb1, 0xf1, 0xc1, 0x86,
    0x66, 0xe5, 0xcf, 0x8b, 0x00, 0x07, 0x42, 0xba,
    0xd6, 0x09, 0xbf, 0xd9, 0xbf, 0x2e, 0xf2, 0x79,
    0x87, 0x43, 0xee, 0x09, 0x2b, 0x07, 0xeb, 0x32,
    0xa4, 0x5f, 0x27, 0xcd, 0xa2, 0x2c, 0xbb, 0xd0,
    0xf0, 0xbb, 0x7a, 0xd2, 0x64, 0xbe, 0x1c, 0x8f,
    0x6e, 0x08, 0x0d, 0x05, 0x3b, 0xe0, 0x16, 0xd5,
    0xb0, 0x4a, 0x4a, 0xeb, 0xff, 0xc1, 0x9b, 0x6f,
    0x81, 0x6f, 0x9a, 0x02, 0xe7, 0x1b, 0x49, 0x6f,
    0x46, 0x28, 0xae, 0x47, 0x1c, 0x8e, 0x40, 0xf9,
    0xaf, 0xc0, 0xde, 0x42, 0xc9, 0x02, 0x3c, 0xfc,
    0xd1, 0xb0, 0x78, 0x07, 0xf4, 0x3b, 0x4e, 0x25
    ],
    .m4 : [
    0x06, 0x00, 0xb4, 0xc3, 0xe5, 0xc6, 0xe4, 0xa4,
    0x05, 0xe9, 0x1e, 0x69, 0xa1, 0x13, 0xb3, 0x96,
    0xb9, 0x41, 0xb3, 0x2f, 0xfd, 0x05, 0x3d, 0x58,
    0xa5, 0x4b, 0xdc, 0xc8, 0xee, 0xf6, 0x0a, 0x47,
    0xd0, 0xbf, 0x53, 0x05, 0x74, 0x18, 0xb6, 0x05,
    0x4e, 0xb2, 0x60, 0xcc, 0xa4, 0xd8, 0x27, 0xc0,
    0x68, 0xed, 0xff, 0x9e, 0xfb, 0x48, 0xf0, 0xeb,
    0x84, 0x54, 0xee, 0x0b, 0x12, 0x15, 0xdf, 0xa0,
    0x8b, 0x3e, 0xbb, 0x3e, 0xcd, 0x29, 0x77, 0xd9,
    0xb6, 0xbd, 0xe0, 0x3d, 0x47, 0x26, 0x41, 0x10,
    0x82, 0xc9, 0xb7, 0x35, 0xe4, 0xba, 0x74, 0xe4,
    0xa2, 0x25, 0x78, 0xfa, 0xf6, 0xcf, 0x36, 0x97,
    0x36, 0x4e, 0xfe, 0x2b, 0xe6, 0x63, 0x5c, 0x4c,
    0x61, 0x7a, 0xd1, 0x2e, 0x6d, 0x18, 0xf7, 0x7a,
    0x23, 0xeb, 0x06, 0x9f, 0x8c, 0xb3, 0x81, 0x73
    ],
    .msg1 : [
    0x06, 0x00, 0x50, 0x89, 0x76, 0x9d, 0xa0, 0xde,
    0xf9, 0xf3, 0x72, 0x89, 0xf9, 0xe5, 0xff, 0x6e,
    0x78, 0x71, 0x0b, 0x97, 0x47, 0xd8, 0xa0, 0x97,
    0x15, 0x91, 0xab, 0xf2, 0xe4, 0xfb
    ],
    .msg2 : [
    0x06, 0x00, 0x82, 0xeb, 0x9d, 0x36, 0x60, 0xb8,
    0x29, 0x84, 0xf3, 0xc1, 0xc1, 0x05, 0x1f, 0x87,
    0x51, 0xab, 0x55, 0x85, 0xb7, 0xd0, 0xad, 0x35,
    0x4d, 0x9b, 0x5c, 0x56, 0xf7, 0x55
    ],
    .plain1 : [
    0x01, 0x05, 0x05, 0x05, 0x05, 0x05
    ],
    .plain2 : [
    0x01, 0x05, 0x05, 0x05, 0x05, 0x05
    ]
    ]

    static let session_1_test_data: [Item: [Byte]] = [
    .client_sk_sec : [
    0x55, 0xf4, 0xd1, 0xd1, 0x98, 0x09, 0x3c, 0x84,
    0xde, 0x9e, 0xe9, 0xa6, 0x29, 0x9e, 0x0f, 0x68,
    0x91, 0xc2, 0xe1, 0xd0, 0xb3, 0x69, 0xef, 0xb5,
    0x92, 0xa9, 0xe3, 0xf1, 0x69, 0xfb, 0x0f, 0x79,
    0x55, 0x29, 0xce, 0x8c, 0xcf, 0x68, 0xc0, 0xb8,
    0xac, 0x19, 0xd4, 0x37, 0xab, 0x0f, 0x5b, 0x32,
    0x72, 0x37, 0x82, 0x60, 0x8e, 0x93, 0xc6, 0x26,
    0x4f, 0x18, 0x4b, 0xa1, 0x52, 0xc2, 0x35, 0x7b
    ],
    .client_ek_sec : [
    0x77, 0x07, 0x6d, 0x0a, 0x73, 0x18, 0xa5, 0x7d,
    0x3c, 0x16, 0xc1, 0x72, 0x51, 0xb2, 0x66, 0x45,
    0xdf, 0x4c, 0x2f, 0x87, 0xeb, 0xc0, 0x99, 0x2a,
    0xb1, 0x77, 0xfb, 0xa5, 0x1d, 0xb9, 0x2c, 0x2a
    ],
    .client_ek_pub : [
    0x85, 0x20, 0xf0, 0x09, 0x89, 0x30, 0xa7, 0x54,
    0x74, 0x8b, 0x7d, 0xdc, 0xb4, 0x3e, 0xf7, 0x5a,
    0x0d, 0xbf, 0x3a, 0x0d, 0x26, 0x38, 0x1a, 0xf4,
    0xeb, 0xa4, 0xa9, 0x8e, 0xaa, 0x9b, 0x4e, 0x6a
    ],
    .host_sk_sec : [
    0x7a, 0x77, 0x2f, 0xa9, 0x01, 0x4b, 0x42, 0x33,
    0x00, 0x07, 0x6a, 0x2f, 0xf6, 0x46, 0x46, 0x39,
    0x52, 0xf1, 0x41, 0xe2, 0xaa, 0x8d, 0x98, 0x26,
    0x3c, 0x69, 0x0c, 0x0d, 0x72, 0xee, 0xd5, 0x2d,
    0x07, 0xe2, 0x8d, 0x4e, 0xe3, 0x2b, 0xfd, 0xc4,
    0xb0, 0x7d, 0x41, 0xc9, 0x21, 0x93, 0xc0, 0xc2,
    0x5e, 0xe6, 0xb3, 0x09, 0x4c, 0x62, 0x96, 0xf3,
    0x73, 0x41, 0x3b, 0x37, 0x3d, 0x36, 0x16, 0x8b
    ],
    .host_ek_sec : [
    0x5d, 0xab, 0x08, 0x7e, 0x62, 0x4a, 0x8a, 0x4b,
    0x79, 0xe1, 0x7f, 0x8b, 0x83, 0x80, 0x0e, 0xe6,
    0x6f, 0x3b, 0xb1, 0x29, 0x26, 0x18, 0xb6, 0xfd,
    0x1c, 0x2f, 0x8b, 0x27, 0xff, 0x88, 0xe0, 0xeb
    ],
    .host_ek_pub : [
    0xde, 0x9e, 0xdb, 0x7d, 0x7b, 0x7d, 0xc1, 0xb4,
    0xd3, 0x5b, 0x61, 0xc2, 0xec, 0xe4, 0x35, 0x37,
    0x3f, 0x83, 0x43, 0xc8, 0x5b, 0x78, 0x67, 0x4d,
    0xad, 0xfc, 0x7e, 0x14, 0x6f, 0x88, 0x2b, 0x4f
    ],
    .m1 : [
    0x53, 0x43, 0x76, 0x32, 0x01, 0x00, 0x00, 0x00,
    0x00, 0x00, 0x85, 0x20, 0xf0, 0x09, 0x89, 0x30,
    0xa7, 0x54, 0x74, 0x8b, 0x7d, 0xdc, 0xb4, 0x3e,
    0xf7, 0x5a, 0x0d, 0xbf, 0x3a, 0x0d, 0x26, 0x38,
    0x1a, 0xf4, 0xeb, 0xa4, 0xa9, 0x8e, 0xaa, 0x9b,
    0x4e, 0x6a
    ],
    .m2 : [
    0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0xde, 0x9e,
    0xdb, 0x7d, 0x7b, 0x7d, 0xc1, 0xb4, 0xd3, 0x5b,
    0x61, 0xc2, 0xec, 0xe4, 0x35, 0x37, 0x3f, 0x83,
    0x43, 0xc8, 0x5b, 0x78, 0x67, 0x4d, 0xad, 0xfc,
    0x7e, 0x14, 0x6f, 0x88, 0x2b, 0x4f
    ],
    .m3 : [
    0x06, 0x00, 0xe4, 0x7d, 0x66, 0xe9, 0x07, 0x02,
    0xaa, 0x81, 0xa7, 0xb4, 0x57, 0x10, 0x27, 0x8d,
    0x02, 0xa8, 0xc6, 0xcd, 0xdb, 0x69, 0xb8, 0x6e,
    0x29, 0x9a, 0x47, 0xa9, 0xb1, 0xf1, 0xc1, 0x86,
    0x66, 0xe5, 0xcf, 0x8b, 0x00, 0x07, 0x42, 0xba,
    0xd6, 0x09, 0xbf, 0xd9, 0xbf, 0x2e, 0xf2, 0x79,
    0x87, 0x43, 0xee, 0x09, 0x2b, 0x07, 0xeb, 0x32,
    0xa4, 0x5f, 0x27, 0xcd, 0xa2, 0x2c, 0xbb, 0xd0,
    0xf0, 0xbb, 0x7a, 0xd2, 0x64, 0xbe, 0x1c, 0x8f,
    0x6e, 0x08, 0x0d, 0x05, 0x3b, 0xe0, 0x16, 0xd5,
    0xb0, 0x4a, 0x4a, 0xeb, 0xff, 0xc1, 0x9b, 0x6f,
    0x81, 0x6f, 0x9a, 0x02, 0xe7, 0x1b, 0x49, 0x6f,
    0x46, 0x28, 0xae, 0x47, 0x1c, 0x8e, 0x40, 0xf9,
    0xaf, 0xc0, 0xde, 0x42, 0xc9, 0x02, 0x3c, 0xfc,
    0xd1, 0xb0, 0x78, 0x07, 0xf4, 0x3b, 0x4e, 0x25
    ],
    .m4 : [
    0x06, 0x00, 0xb4, 0xc3, 0xe5, 0xc6, 0xe4, 0xa4,
    0x05, 0xe9, 0x1e, 0x69, 0xa1, 0x13, 0xb3, 0x96,
    0xb9, 0x41, 0xb3, 0x2f, 0xfd, 0x05, 0x3d, 0x58,
    0xa5, 0x4b, 0xdc, 0xc8, 0xee, 0xf6, 0x0a, 0x47,
    0xd0, 0xbf, 0x53, 0x05, 0x74, 0x18, 0xb6, 0x05,
    0x4e, 0xb2, 0x60, 0xcc, 0xa4, 0xd8, 0x27, 0xc0,
    0x68, 0xed, 0xff, 0x9e, 0xfb, 0x48, 0xf0, 0xeb,
    0x84, 0x54, 0xee, 0x0b, 0x12, 0x15, 0xdf, 0xa0,
    0x8b, 0x3e, 0xbb, 0x3e, 0xcd, 0x29, 0x77, 0xd9,
    0xb6, 0xbd, 0xe0, 0x3d, 0x47, 0x26, 0x41, 0x10,
    0x82, 0xc9, 0xb7, 0x35, 0xe4, 0xba, 0x74, 0xe4,
    0xa2, 0x25, 0x78, 0xfa, 0xf6, 0xcf, 0x36, 0x97,
    0x36, 0x4e, 0xfe, 0x2b, 0xe6, 0x63, 0x5c, 0x4c,
    0x61, 0x7a, 0xd1, 0x2e, 0x6d, 0x18, 0xf7, 0x7a,
    0x23, 0xeb, 0x06, 0x9f, 0x8c, 0xb3, 0x81, 0x73
    ],
    .msg1 : [
    0x06, 0x00, 0x50, 0x89, 0x76, 0x9d, 0xa0, 0xde,
    0xf9, 0xf3, 0x72, 0x89, 0xf9, 0xe5, 0xff, 0x6e,
    0x78, 0x71, 0x0b, 0x97, 0x47, 0xd8, 0xa0, 0x97,
    0x15, 0x91, 0xab, 0xf2, 0xe4, 0xfb
    ],
    .msg2 : [
    0x06, 0x00, 0x82, 0xeb, 0x9d, 0x36, 0x60, 0xb8,
    0x29, 0x84, 0xf3, 0xc1, 0xc1, 0x05, 0x1f, 0x87,
    0x51, 0xab, 0x55, 0x85, 0xb7, 0xd0, 0xad, 0x35,
    0x4d, 0x9b, 0x5c, 0x56, 0xf7, 0x55
    ],
    .plain1 : [
        0x01, 0x05, 0x05, 0x05, 0x05, 0x05
    ],
    .plain2 : [
        0x01, 0x05, 0x05, 0x05, 0x05, 0x05
    ]
    ]

    static let session_2_test_data: [Item: [Byte]] = [
    .client_sk_sec : [
    0x55, 0xf4, 0xd1, 0xd1, 0x98, 0x09, 0x3c, 0x84,
    0xde, 0x9e, 0xe9, 0xa6, 0x29, 0x9e, 0x0f, 0x68,
    0x91, 0xc2, 0xe1, 0xd0, 0xb3, 0x69, 0xef, 0xb5,
    0x92, 0xa9, 0xe3, 0xf1, 0x69, 0xfb, 0x0f, 0x79,
    0x55, 0x29, 0xce, 0x8c, 0xcf, 0x68, 0xc0, 0xb8,
    0xac, 0x19, 0xd4, 0x37, 0xab, 0x0f, 0x5b, 0x32,
    0x72, 0x37, 0x82, 0x60, 0x8e, 0x93, 0xc6, 0x26,
    0x4f, 0x18, 0x4b, 0xa1, 0x52, 0xc2, 0x35, 0x7b
    ],
    .client_ek_sec : [
    0x77, 0x07, 0x6d, 0x0a, 0x73, 0x18, 0xa5, 0x7d,
    0x3c, 0x16, 0xc1, 0x72, 0x51, 0xb2, 0x66, 0x45,
    0xdf, 0x4c, 0x2f, 0x87, 0xeb, 0xc0, 0x99, 0x2a,
    0xb1, 0x77, 0xfb, 0xa5, 0x1d, 0xb9, 0x2c, 0x2a
    ],
    .client_ek_pub : [
    0x85, 0x20, 0xf0, 0x09, 0x89, 0x30, 0xa7, 0x54,
    0x74, 0x8b, 0x7d, 0xdc, 0xb4, 0x3e, 0xf7, 0x5a,
    0x0d, 0xbf, 0x3a, 0x0d, 0x26, 0x38, 0x1a, 0xf4,
    0xeb, 0xa4, 0xa9, 0x8e, 0xaa, 0x9b, 0x4e, 0x6a
    ],
    .host_sk_sec : [
    0x7a, 0x77, 0x2f, 0xa9, 0x01, 0x4b, 0x42, 0x33,
    0x00, 0x07, 0x6a, 0x2f, 0xf6, 0x46, 0x46, 0x39,
    0x52, 0xf1, 0x41, 0xe2, 0xaa, 0x8d, 0x98, 0x26,
    0x3c, 0x69, 0x0c, 0x0d, 0x72, 0xee, 0xd5, 0x2d,
    0x07, 0xe2, 0x8d, 0x4e, 0xe3, 0x2b, 0xfd, 0xc4,
    0xb0, 0x7d, 0x41, 0xc9, 0x21, 0x93, 0xc0, 0xc2,
    0x5e, 0xe6, 0xb3, 0x09, 0x4c, 0x62, 0x96, 0xf3,
    0x73, 0x41, 0x3b, 0x37, 0x3d, 0x36, 0x16, 0x8b
    ],
    .host_ek_sec : [
    0x5d, 0xab, 0x08, 0x7e, 0x62, 0x4a, 0x8a, 0x4b,
    0x79, 0xe1, 0x7f, 0x8b, 0x83, 0x80, 0x0e, 0xe6,
    0x6f, 0x3b, 0xb1, 0x29, 0x26, 0x18, 0xb6, 0xfd,
    0x1c, 0x2f, 0x8b, 0x27, 0xff, 0x88, 0xe0, 0xeb
    ],
    .host_ek_pub : [
    0xde, 0x9e, 0xdb, 0x7d, 0x7b, 0x7d, 0xc1, 0xb4,
    0xd3, 0x5b, 0x61, 0xc2, 0xec, 0xe4, 0x35, 0x37,
    0x3f, 0x83, 0x43, 0xc8, 0x5b, 0x78, 0x67, 0x4d,
    0xad, 0xfc, 0x7e, 0x14, 0x6f, 0x88, 0x2b, 0x4f
    ],
    .a1 : [
    0x02, 0x00, 0x00, 0x00, // 2
    0x08, 0x00
    ],
    .a2 : [ /* 0x0980015343322d2d2d2d2d2d2d4543484f2d2d2d2d2d2d */
    0x17, 0x00, 0x00, 0x00, // 23
    0x09, 0x80, 0x01, 0x53, 0x43, 0x32, 0x2d, 0x2d,
    0x2d, 0x2d, 0x2d, 0x2d, 0x2d, 0x45, 0x43, 0x48,
    0x4f, 0x2d, 0x2d, 0x2d, 0x2d, 0x2d, 0x2d
    ]
    ]

    static let session_3_test_data: [Item: [Byte]] = [
    .client_sk_sec : [
    0x55, 0xf4, 0xd1, 0xd1, 0x98, 0x09, 0x3c, 0x84,
    0xde, 0x9e, 0xe9, 0xa6, 0x29, 0x9e, 0x0f, 0x68,
    0x91, 0xc2, 0xe1, 0xd0, 0xb3, 0x69, 0xef, 0xb5,
    0x92, 0xa9, 0xe3, 0xf1, 0x69, 0xfb, 0x0f, 0x79,
    0x55, 0x29, 0xce, 0x8c, 0xcf, 0x68, 0xc0, 0xb8,
    0xac, 0x19, 0xd4, 0x37, 0xab, 0x0f, 0x5b, 0x32,
    0x72, 0x37, 0x82, 0x60, 0x8e, 0x93, 0xc6, 0x26,
    0x4f, 0x18, 0x4b, 0xa1, 0x52, 0xc2, 0x35, 0x7b
    ],
    .client_ek_sec : [
    0x77, 0x07, 0x6d, 0x0a, 0x73, 0x18, 0xa5, 0x7d,
    0x3c, 0x16, 0xc1, 0x72, 0x51, 0xb2, 0x66, 0x45,
    0xdf, 0x4c, 0x2f, 0x87, 0xeb, 0xc0, 0x99, 0x2a,
    0xb1, 0x77, 0xfb, 0xa5, 0x1d, 0xb9, 0x2c, 0x2a
    ],
    .client_ek_pub : [
    0x85, 0x20, 0xf0, 0x09, 0x89, 0x30, 0xa7, 0x54,
    0x74, 0x8b, 0x7d, 0xdc, 0xb4, 0x3e, 0xf7, 0x5a,
    0x0d, 0xbf, 0x3a, 0x0d, 0x26, 0x38, 0x1a, 0xf4,
    0xeb, 0xa4, 0xa9, 0x8e, 0xaa, 0x9b, 0x4e, 0x6a
    ],
    .host_sk_sec : [
    0x7a, 0x77, 0x2f, 0xa9, 0x01, 0x4b, 0x42, 0x33,
    0x00, 0x07, 0x6a, 0x2f, 0xf6, 0x46, 0x46, 0x39,
    0x52, 0xf1, 0x41, 0xe2, 0xaa, 0x8d, 0x98, 0x26,
    0x3c, 0x69, 0x0c, 0x0d, 0x72, 0xee, 0xd5, 0x2d,
    0x07, 0xe2, 0x8d, 0x4e, 0xe3, 0x2b, 0xfd, 0xc4,
    0xb0, 0x7d, 0x41, 0xc9, 0x21, 0x93, 0xc0, 0xc2,
    0x5e, 0xe6, 0xb3, 0x09, 0x4c, 0x62, 0x96, 0xf3,
    0x73, 0x41, 0x3b, 0x37, 0x3d, 0x36, 0x16, 0x8b
    ], 
    .host_ek_sec : [
    0x5d, 0xab, 0x08, 0x7e, 0x62, 0x4a, 0x8a, 0x4b,
    0x79, 0xe1, 0x7f, 0x8b, 0x83, 0x80, 0x0e, 0xe6,
    0x6f, 0x3b, 0xb1, 0x29, 0x26, 0x18, 0xb6, 0xfd,
    0x1c, 0x2f, 0x8b, 0x27, 0xff, 0x88, 0xe0, 0xeb
    ],
    .host_ek_pub : [
    0xde, 0x9e, 0xdb, 0x7d, 0x7b, 0x7d, 0xc1, 0xb4,
    0xd3, 0x5b, 0x61, 0xc2, 0xec, 0xe4, 0x35, 0x37,
    0x3f, 0x83, 0x43, 0xc8, 0x5b, 0x78, 0x67, 0x4d,
    0xad, 0xfc, 0x7e, 0x14, 0x6f, 0x88, 0x2b, 0x4f
    ],
    .m1 : [ /* 0x534376320100010000008520f0098930a754748b7ddcb43ef75a0dbf3a0d26381af4eba4a98eaa9b4e6a */
    0x2a, 0x00, 0x00, 00, /* Size : 42 */
    0x53, 0x43, 0x76, 0x32, 0x01, 0x00, 0x01, 0x00,
    0x00, 0x00, 0x85, 0x20, 0xf0, 0x09, 0x89, 0x30,
    0xa7, 0x54, 0x74, 0x8b, 0x7d, 0xdc, 0xb4, 0x3e,
    0xf7, 0x5a, 0x0d, 0xbf, 0x3a, 0x0d, 0x26, 0x38,
    0x1a, 0xf4, 0xeb, 0xa4, 0xa9, 0x8e, 0xaa, 0x9b,
    0x4e, 0x6a
    ],
    .m2 : [ /* 0x020001000000de9edb7d7b7dc1b4d35b61c2ece435373f8343c85b78674dadfc7e146f882b4f */
    0x26, 0x00, 0x00, 00, /* Size : 38 */
    0x02, 0x00, 0x01, 0x00, 0x00, 0x00, 0xde, 0x9e,
    0xdb, 0x7d, 0x7b, 0x7d, 0xc1, 0xb4, 0xd3, 0x5b,
    0x61, 0xc2, 0xec, 0xe4, 0x35, 0x37, 0x3f, 0x83,
    0x43, 0xc8, 0x5b, 0x78, 0x67, 0x4d, 0xad, 0xfc,
    0x7e, 0x14, 0x6f, 0x88, 0x2b, 0x4f
    ],
    .m3 : [ /* 0x0600716b3bf4e6ab0bcd479fcb8a3c9194e1c6cdda69b86e299a47a9b1f1c18666e5cf8b000742bad609bfd9bf2ef2798743ee092b07eb32f55c386d4c5f986a22a793f2886c407756e9c16f416ad6a039bec1f546c28e53e3cdd8b6a0b728e1b576dc73c0826fde10a8e8fa95dd840f27887fad9c43e523 */
    0x78, 0x00, 0x00, 00, /* Size : 120 */
    0x06, 0x00, 0x71, 0x6b, 0x3b, 0xf4, 0xe6, 0xab,
    0x0b, 0xcd, 0x47, 0x9f, 0xcb, 0x8a, 0x3c, 0x91,
    0x94, 0xe1, 0xc6, 0xcd, 0xda, 0x69, 0xb8, 0x6e,
    0x29, 0x9a, 0x47, 0xa9, 0xb1, 0xf1, 0xc1, 0x86,
    0x66, 0xe5, 0xcf, 0x8b, 0x00, 0x07, 0x42, 0xba,
    0xd6, 0x09, 0xbf, 0xd9, 0xbf, 0x2e, 0xf2, 0x79,
    0x87, 0x43, 0xee, 0x09, 0x2b, 0x07, 0xeb, 0x32,
    0xf5, 0x5c, 0x38, 0x6d, 0x4c, 0x5f, 0x98, 0x6a,
    0x22, 0xa7, 0x93, 0xf2, 0x88, 0x6c, 0x40, 0x77,
    0x56, 0xe9, 0xc1, 0x6f, 0x41, 0x6a, 0xd6, 0xa0,
    0x39, 0xbe, 0xc1, 0xf5, 0x46, 0xc2, 0x8e, 0x53,
    0xe3, 0xcd, 0xd8, 0xb6, 0xa0, 0xb7, 0x28, 0xe1,
    0xb5, 0x76, 0xdc, 0x73, 0xc0, 0x82, 0x6f, 0xde,
    0x10, 0xa8, 0xe8, 0xfa, 0x95, 0xdd, 0x84, 0x0f,
    0x27, 0x88, 0x7f, 0xad, 0x9c, 0x43, 0xe5, 0x23
    ],
    .m4 : [ /* 0x0600e22debb90198a20f390849df22422abdb32ffe053d58a54bdcc8eef60a47d0bf53057418b6054eb260cca4d827c068edff9efb48f0eb93170c3dd24c413625f3a479a4a3aeef72b78938dd6342954f6c5deaa6046a2558dc4608c8eea2e95eee1d70053428193ab4b89efd6c6d731fe89281ffe7557f */
    0x78, 0x00, 0x00, 00, /* Size : 120 */
    0x06, 0x00, 0xe2, 0x2d, 0xeb, 0xb9, 0x01, 0x98,
    0xa2, 0x0f, 0x39, 0x08, 0x49, 0xdf, 0x22, 0x42,
    0x2a, 0xbd, 0xb3, 0x2f, 0xfe, 0x05, 0x3d, 0x58,
    0xa5, 0x4b, 0xdc, 0xc8, 0xee, 0xf6, 0x0a, 0x47,
    0xd0, 0xbf, 0x53, 0x05, 0x74, 0x18, 0xb6, 0x05,
    0x4e, 0xb2, 0x60, 0xcc, 0xa4, 0xd8, 0x27, 0xc0,
    0x68, 0xed, 0xff, 0x9e, 0xfb, 0x48, 0xf0, 0xeb,
    0x93, 0x17, 0x0c, 0x3d, 0xd2, 0x4c, 0x41, 0x36,
    0x25, 0xf3, 0xa4, 0x79, 0xa4, 0xa3, 0xae, 0xef,
    0x72, 0xb7, 0x89, 0x38, 0xdd, 0x63, 0x42, 0x95,
    0x4f, 0x6c, 0x5d, 0xea, 0xa6, 0x04, 0x6a, 0x25,
    0x58, 0xdc, 0x46, 0x08, 0xc8, 0xee, 0xa2, 0xe9,
    0x5e, 0xee, 0x1d, 0x70, 0x05, 0x34, 0x28, 0x19,
    0x3a, 0xb4, 0xb8, 0x9e, 0xfd, 0x6c, 0x6d, 0x73,
    0x1f, 0xe8, 0x92, 0x81, 0xff, 0xe7, 0x55, 0x7f
    ],
    .msg1 : [ /* 0x0600fc874e03bdcfb575da8035aef06178ac0b9744d8a0971591abf2e4fb */
    0x1e, 0x00, 0x00, 00, /* Size : 30 */
    0x06, 0x00, 0xfc, 0x87, 0x4e, 0x03, 0xbd, 0xcf,
    0xb5, 0x75, 0xda, 0x80, 0x35, 0xae, 0xf0, 0x61,
    0x78, 0xac, 0x0b, 0x97, 0x44, 0xd8, 0xa0, 0x97,
    0x15, 0x91, 0xab, 0xf2, 0xe4, 0xfb
    ],
    .msg2 : [ /* 0x060081b0bdc67c9c6956a1be018f3a64912a5585b3d0ad354d9b5c56f755 */
    0x1e, 0x00, 0x00, 00, /* Size : 30 */
    0x06, 0x00, 0x81, 0xb0, 0xbd, 0xc6, 0x7c, 0x9c,
    0x69, 0x56, 0xa1, 0xbe, 0x01, 0x8f, 0x3a, 0x64,
    0x91, 0x2a, 0x55, 0x85, 0xb3, 0xd0, 0xad, 0x35,
    0x4d, 0x9b, 0x5c, 0x56, 0xf7, 0x55
    ],
    .msg3 : [ /* 0x060090e8d432c10ed6381629c3a0dbfd243ccc27e7aef94d2852fd4229970630df2c34bb76ec4c */
    0x27, 0x00, 0x00, 00, /* Size : 39 */
    0x06, 0x00, 0x90, 0xe8, 0xd4, 0x32, 0xc1, 0x0e,
    0xd6, 0x38, 0x16, 0x29, 0xc3, 0xa0, 0xdb, 0xfd,
    0x24, 0x3c, 0xcc, 0x27, 0xe7, 0xae, 0xf9, 0x4d,
    0x28, 0x52, 0xfd, 0x42, 0x29, 0x97, 0x06, 0x30,
    0xdf, 0x2c, 0x34, 0xbb, 0x76, 0xec, 0x4c
    ],
    .msg4 : [ /* 0x0680bca264e808b9d32440d35ae1fc2a333123fd535aaef131889c0a4b4b3ce8ccefcd95c2c5b9 */
    0x27, 0x00, 0x00, 00, /* Size : 39 */
    0x06, 0x80, 0xbc, 0xa2, 0x64, 0xe8, 0x08, 0xb9,
    0xd3, 0x24, 0x40, 0xd3, 0x5a, 0xe1, 0xfc, 0x2a,
    0x33, 0x31, 0x23, 0xfd, 0x53, 0x5a, 0xae, 0xf1,
    0x31, 0x88, 0x9c, 0x0a, 0x4b, 0x4b, 0x3c, 0xe8,
    0xcc, 0xef, 0xcd, 0x95, 0xc2, 0xc5, 0xb9
    ]
    ]
}
