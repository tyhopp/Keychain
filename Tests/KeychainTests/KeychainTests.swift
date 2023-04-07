import XCTest
@testable import Keychain

// MARK: User-defined enumerations
public enum KeychainKey {
    static let aAccount = "aAccount"
    static let aService = "aService"
    
    static let bAccount = "bAccount"
    static let bService = "bService"
}

public enum KeychainItem {
    @Keychain(service: KeychainKey.aService, account: KeychainKey.aAccount)
    static public var a: String?

    @Keychain(service: KeychainKey.bService, account: KeychainKey.bAccount)
    static public var b: String?
}

// MARK: Tests
final class KeychainTests: XCTestCase {
    let mockValueA = "mock-value-a"
    let mockValueB = "mock-value-b"
    
    override func setUp() {
        KeychainItem.a = nil
        KeychainItem.b = nil
    }

    func testSingleKeychainItem() {
        XCTAssertNil(KeychainItem.a)

        KeychainItem.a = mockValueA
        
        if let valueA = KeychainItem.a {
            XCTAssertEqual(valueA, mockValueA)
        }
    }
    
    func testMultipleKeychainItem() {
        XCTAssertNil(KeychainItem.a)
        XCTAssertNil(KeychainItem.b)

        KeychainItem.a = mockValueA
        KeychainItem.b = mockValueB

        if let valueA = KeychainItem.a {
            XCTAssertEqual(valueA, mockValueA)
        }

        if let valueB = KeychainItem.b {
            XCTAssertEqual(valueB, mockValueB)
        }
    }

    func testReassignment() {
        XCTAssertNil(KeychainItem.a)

        KeychainItem.a = mockValueA
        KeychainItem.a = mockValueB

        if let valueA = KeychainItem.a {
            XCTAssertEqual(valueA, mockValueB)
        }
    }
    
    func testDeletion() {
        XCTAssertNil(KeychainItem.a)

        KeychainItem.a = mockValueA
        KeychainItem.a = nil

        XCTAssertNil(KeychainItem.a)
    }

    func testNoAccount() {
        @Keychain(service: "a") var a: String?

        XCTAssertNil(a)

        a = mockValueA

        if let valueA = a {
            XCTAssertEqual(valueA, mockValueA)
        }

        a = nil

        XCTAssertNil(a)
    }
}
