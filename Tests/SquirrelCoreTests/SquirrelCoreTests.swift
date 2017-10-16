import XCTest

@testable import SquirrelCore

class SquirrelCoreTests: XCTestCase {
    func testPresentable() {
        struct TestStruct: SquirrelPresentable {
            func present() throws -> Data {
                let content = "This is content"
                guard let data = content.data(using: .utf8) else {
                    throw DataError(kind: .dataDecodingError(string: content))
                }
                return data
            }

            var representAs: Representation = .text
        }

        let s1 = TestStruct()
        XCTAssertNoThrow(try s1.present())

        guard let res = try? s1.present() else {
            XCTFail()
            return
        }
        XCTAssertEqual("This is content".data(using: .utf8)!, res)
    }

    func testDataError() {
        let error11 = DataError(kind: .dataDecodingError(string: "A1"))
        XCTAssertEqual("Error while decoding data.\nString: 'A1'", error11.description)

        let error12 = DataError(kind: .dataDecodingError(string: "A2"))
        XCTAssertEqual("Error while decoding data.\nString: 'A2'", error12.description)

        let error21 = DataError(kind: .dataEncodingError)
        XCTAssertEqual("Error while encoding data.", error21.description)

        let error31 = DataError(kind: .dataDecodingError(string: "B1"), description: "B1 decoding error")
        XCTAssertEqual("B1 decoding error\nString: 'B1'", error31.description)

        let error32 = DataError(kind: .dataDecodingError(string: "B2"), description: "B2 decoding error")
        XCTAssertEqual("B2 decoding error\nString: 'B2'", error32.description)

        let error33 = DataError(kind: .dataDecodingError(string: "B3"), description: "decoding error")
        XCTAssertEqual("decoding error\nString: 'B3'", error33.description)

        let error41 = DataError(kind: .dataEncodingError, description: "C1 encoding error")
        XCTAssertEqual("C1 encoding error", error41.description)

        let error42 = DataError(kind: .dataEncodingError, description: "C2 endocing error")
        XCTAssertEqual("C2 endocing error", error42.description)
    }

    static var allTests = [
        ("testPresentable", testPresentable),
        ("testDataError", testDataError)
    ]
}
