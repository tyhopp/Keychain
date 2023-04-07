/*
    Adopted from Automattic's SimpleNote iOS project:
        https://github.com/Automattic/simplenote-ios/blob/3c404525449672d08e93380b4ef4a30054de1847/Simplenote/Classes/KeychainManager.swift
 
    Original license:
        https://github.com/Automattic/simplenote-ios/blob/3c404525449672d08e93380b4ef4a30054de1847/LICENSE.md
 
    Copied license without modification in this project's repo:
        https://github.com/tyhopp/Keychain/blob/main/LICENSE-KeychainItemWrapper.md
*/

import Foundation

@propertyWrapper
public struct KeychainItemWrapper {

    let item: KeychainPasswordItem

    init(service: String, account: String) {
        item = KeychainPasswordItem(service: service, account: account)
    }

    public var wrappedValue: String? {
        mutating get {
            do {
                return try item.readPassword()

            } catch KeychainError.noPassword {
                return nil

            } catch {
                NSLog("Error Reading Keychain Item \(item.service).\(item.account): \(error)")
                return nil
            }
        }
        set {
            do {
                if let value = newValue {
                    try item.savePassword(value)
                } else {
                    try item.deleteItem()
                }
            } catch {
                NSLog("Error Setting Keychain Item \(item.service).\(item.account)")
            }
        }
    }
}
