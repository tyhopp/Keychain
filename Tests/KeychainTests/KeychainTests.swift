import XCTest
@testable import Keychain

// MARK: User-defined enumerations
public enum KeychainKey {
    static let aAccount = "aAccount"
    static let aService = "aService"
    
    static let bAccount = "bAccount"
    static let bService = "bService"
}

public enum Keychain {
    @KeychainItemWrapper(service: KeychainKey.aService, account: KeychainKey.aAccount)
    static public var a: String?

    @KeychainItemWrapper(service: KeychainKey.bService, account: KeychainKey.bAccount)
    static public var b: String?
}

// MARK: Tests
final class KeychainUsageTests: XCTestCase {
    let mockValueA = "mock-value-a"
    let mockValueB = "mock-value-b"
    
    override func setUp() {
        Keychain.a = nil
        Keychain.b = nil
    }

    func testSingleKeychainItem() {
        XCTAssertNil(Keychain.a)

        Keychain.a = mockValueA
        
        if let valueA = Keychain.a {
            XCTAssertEqual(valueA, mockValueA)
        }
    }
    
    func testMultipleKeychainItem() {
        XCTAssertNil(Keychain.a)
        XCTAssertNil(Keychain.b)

        Keychain.a = mockValueA
        Keychain.b = mockValueB

        if let valueA = Keychain.a {
            XCTAssertEqual(valueA, mockValueA)
        }

        if let valueB = Keychain.b {
            XCTAssertEqual(valueB, mockValueB)
        }
    }

    func testReassignment() {
        XCTAssertNil(Keychain.a)

        Keychain.a = mockValueA
        Keychain.a = mockValueB

        if let valueA = Keychain.a {
            XCTAssertEqual(valueA, mockValueB)
        }
    }
    
    func testDeletion() {
        XCTAssertNil(Keychain.a)

        Keychain.a = mockValueA
        Keychain.a = nil

        XCTAssertNil(Keychain.a)
    }
}
