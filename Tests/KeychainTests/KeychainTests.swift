import XCTest
@testable import Keychain

// MARK: User-defined enumerations
public enum KeychainKey {
    static let aAccount = "aAccount"
    static let aService = "aService"
    
    static let bAccount = "bAccount"
    static let bService = "bService"
}

public enum KeychainManager {
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
        KeychainManager.a = nil
        KeychainManager.b = nil
    }

    func testSingleKeychainItem() {
        XCTAssertNil(KeychainManager.a)

        KeychainManager.a = mockValueA
        
        if let valueA = KeychainManager.a {
            XCTAssertEqual(valueA, mockValueA)
        }
    }
    
    func testMultipleKeychainItem() {
        XCTAssertNil(KeychainManager.a)
        XCTAssertNil(KeychainManager.b)

        KeychainManager.a = mockValueA
        KeychainManager.b = mockValueB

        if let valueA = KeychainManager.a {
            XCTAssertEqual(valueA, mockValueA)
        }

        if let valueB = KeychainManager.b {
            XCTAssertEqual(valueB, mockValueB)
        }
    }

    func testReassignment() {
        XCTAssertNil(KeychainManager.a)

        KeychainManager.a = mockValueA
        KeychainManager.a = mockValueB

        if let valueA = KeychainManager.a {
            XCTAssertEqual(valueA, mockValueB)
        }
    }
    
    func testDeletion() {
        XCTAssertNil(KeychainManager.a)

        KeychainManager.a = mockValueA
        KeychainManager.a = nil

        XCTAssertNil(KeychainManager.a)
    }
}
