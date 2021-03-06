//  Sodium+Extend.swift
//  SaltChannel
//
//  Created by Håkan Olsson on 2017-06-09.

import Foundation
import Clibsodium
import Sodium

extension GenericHash {
    /**
     Computes a fixed-length sha512 fingerprint for an arbitrary long message.
     - Parameter message: The message from which to compute the fingerprint.
     - Returns: The computed fingerprint.
     */
    public func hashSha512(data: Data) -> Bytes {
        let state = UnsafeMutablePointer<crypto_hash_sha512_state>.allocate(capacity: 1)
        let initReturn = crypto_hash_sha512_init(state)
        assert(initReturn == 0)
        let updateReturn = crypto_hash_sha512_update(state, data.bytes, UInt64(data.count))
        assert(updateReturn == 0)
        var output = [UInt8](repeating: 0, count: 64)
    
        let finalReturn = crypto_hash_sha512_final(state, &output)
        assert(finalReturn == 0)
        return output
    }
}

extension Box {
    /**
     Encrypts a message with the shared secret key generated from a recipient's
     public key and a sender's secret key using `beforenm()`.
     - Parameter message: The message to encrypt.
     - Parameter beforenm: The shared secret key.
     - Parameter nonce: The encryption nonce.
     - Returns: The authenticated ciphertext
     */
    public func seal(message: Bytes, beforenm: Beforenm, nonce: Nonce) -> Bytes? {
        guard beforenm.count == BeforenmBytes else { return nil }
        var authenticatedCipherText = Bytes(repeating: 0, count: message.count + MacBytes)

        guard crypto_box_easy_afternm(
            &authenticatedCipherText,
            message,
            UInt64(message.count),
            nonce,
            beforenm) == 0 else {
            return nil
        }

        return authenticatedCipherText
    }
}
