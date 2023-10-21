@testable import SysBadge
import XCTest

final class System_swiftTests: XCTestCase {
    func testParseSourceId() throws {
        let decoder = JSONDecoder()

        var source = try decoder.decode(System.Source.self, from: Data("{\"PluralKit\": {\"id\": \"exmpl\"}}".utf8))
        XCTAssertEqual(source, System.Source.PluralKit(id: "exmpl"))

        source = try decoder.decode(System.Source.self, from: Data("{\"PronounsCC\": {\"id\": \"exmpl\"}}".utf8))
        XCTAssertEqual(source, System.Source.PronounsCC(id: "exmpl"))

        // FIXME: add None test
    }

    func testParseMember() throws {
        let json = """
            {
                "name": "Myriad Kit",
                "pronouns": "they/them"
            }
        """
        let decoder = JSONDecoder()

        let member = try decoder.decode(System.Member.self, from: Data(json.utf8))
        XCTAssertEqual(member, System.Member(name: "Myriad Kit", pronouns: "they/them"))
    }

    func testParseSystem() throws {
        let json = """
            {
              "name": "PluralKit Example System",
              "source_id": {
                "PluralKit": {
                  "id": "exmpl"
                }
              },
              "members": [
                {
                  "name": "Myriad Kit",
                  "pronouns": "they/them"
                },
                {
                  "name": "Tester T. Testington",
                  "pronouns": ""
                }
              ]
            }
        """

        let system = try JSONDecoder().decode(System.self, from: Data(json.utf8))
        XCTAssertEqual(system.name, "PluralKit Example System")
        XCTAssertEqual(system.source_id, System.Source.PluralKit(id: "exmpl"))
        XCTAssertEqual(system.members.count, 2)
    }
}
