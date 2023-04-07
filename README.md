# Keychain

A Swift module for interacting with Apple's [Keychain](https://developer.apple.com/documentation/security/keychain_services) based on code from Apple and Automattic.

Sources:

- [`KeychainPasswordItem`](https://developer.apple.com/library/archive/samplecode/GenericKeychain/Listings/GenericKeychain_KeychainPasswordItem_swift.html) from Apple, which wraps lower level Keychain APIs
- [`KeychainItemWrapper`](https://github.com/Automattic/simplenote-ios/blob/3c404525449672d08e93380b4ef4a30054de1847/Simplenote/Classes/KeychainManager.swift) from Automattic, which creates a [property wrapper](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/properties/#Property-Wrappers) you apply to each Keychain item

## Usage

```swift
// Define your Keychain items
public enum Keychain {
    @KeychainItemWrapper(service: "my-service", account: "my-account")
    static public var myKey: String?
}

// Get and set items
Keychain.myKey = "my-value"

print("Value is: \(Keychain.myKey)") // Value is: my-value
```

## Licenses

Both files have links to license information at the top of each source code file.

In addition, both licenses are copied without modification in this project's repo:

- [KeychainPasswordItem](./LICENSE-KeychainPasswordItem.md)
- [KeychainItemWrapper](./LICENSE-KeychainItemWrapper.md)
