//
//  networkManagerTestTests.swift
//  networkManagerTestTests
//
//  Created by Jyotsna Jayanteyee Pandey on 12/01/25.
//

import XCTest
@testable import networkManagerTest

import Foundation
final class networkManagerTestTests: XCTestCase {
    lazy var session: URLSession = {
            let configuration = URLSessionConfiguration.ephemeral
            configuration.protocolClasses = [MockURLProtocol.self]
            return URLSession(configuration: configuration)
        }()

        lazy var api: UserAPI = {
            UserAPI(session: session)
        }()
    override func tearDown() {
            MockURLProtocol.requestHandler = nil
            super.tearDown()
        }
    func testFetchUser() async throws{
            let mockData = """
            {
                "firstName": "Vincent",
                "lastName": "Pradeilles"
            }
            """.data(using: .utf8)!

            MockURLProtocol.requestHandler = { request in
                XCTAssertEqual(request.url?.absoluteString, "https://my-api.com/user/me")
                
                let response = HTTPURLResponse(
                    url: request.url!,
                    statusCode: 200,
                    httpVersion: nil,
                    headerFields: nil
                )!
                
                return (response, mockData)
            }

            let result = try await api.fetchUser()
            
            XCTAssertEqual(result.firstName, "Vincent")
            XCTAssertEqual(result.lastName, "Pradeilles")
        }

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
