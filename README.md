# Keychain

Swift module for interacting with [Keychain](https://developer.apple.com/documentation/security/keychain_services) via property wrapper.

## Usage

```swift
// Define
@Keychain(service: "my-app") var token: String?

// Set
token = "my-token"

// Get
if let token = token {
    print(token) // my-token
}

// Delete
token = nil
```

## Licenses

The source code is adopted from these sources with a few small adjustments:

- [`KeychainPasswordItem`](https://developer.apple.com/library/archive/samplecode/GenericKeychain/Listings/GenericKeychain_KeychainPasswordItem_swift.html) from Apple
- [`KeychainItemWrapper`](https://github.com/Automattic/simplenote-ios/blob/3c404525449672d08e93380b4ef4a30054de1847/Simplenote/Classes/KeychainManager.swift) from Automattic

The licenses are linked in the source files and available in the repo without modification:

- [KeychainPasswordItem](./LICENSE-KeychainPasswordItem.md)
- [KeychainItemWrapper](./LICENSE-KeychainItemWrapper.md)
