//  Protocol.swift
//  SaltChannel
//
//  Created by Kenneth Pernyer on 2017-10-06.

import Foundation

enum Constants {
    static let protocolId   = Data("SCv2".utf8)
    static let serverprefix = Data("SC-SIG01".utf8)
    static let clientprefix = Data("SC-SIG02".utf8)
}

typealias Protocol = Client & Host

protocol Peer {
    func writeApp(time: TimeInterval, message: Data) throws -> Data
    func writeMultiApp(message: Data) throws -> (time: TimeInterval, message: Data)
    
    func readApp(data: Data) throws -> (time: TimeInterval, message: Data)
    func readMultiApp(data: Data) throws -> [String]
}

protocol Client: Peer {
    func packA1(pubKey: Data?) throws -> Data
    func unpackA2(data: Data) throws -> [(first: String, second: String)]
    
    func packM1(time: TimeInterval, myEncPub: Data, serverSignPub: Data?) throws -> (hash: Data, data: Data)
    func unpackM2(data: Data) throws -> (time: TimeInterval, remoteEncPub: Data, hash: Data)
    func unpackM3(data: Data, m1Hash: Data, m2Hash: Data) throws -> (time: TimeInterval, remoteSignPub: Data)
    func packM4(time: TimeInterval, clientSignSec: Data, clientSignPub: Data,
                m1Hash: Data, m2Hash: Data) throws -> Data
}

protocol Host: Peer {
    func unpackA1(data: Data) throws -> (time: TimeInterval, message: Data)
    func packA2(time: TimeInterval, message: Data) throws -> Data
    
    func unpackM1(data: Data) throws -> (time: TimeInterval, remoteEncPub: Data, hash: Data)
    func packM2(time: TimeInterval, myEncPub: Data) throws -> Data
    func packM3(time: TimeInterval, myEncPub: Data) throws -> Data
    func unpackM4(data: Data) throws -> (time: TimeInterval, message: Data)
}
