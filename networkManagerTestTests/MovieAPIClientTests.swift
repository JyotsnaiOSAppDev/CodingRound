//
//  MovieAPIClientTests.swift
//  networkManagerTestTests
//
//  Created by Jyotsna Jayanteyee Pandey on 12/01/25.
//

import XCTest
@testable import networkManagerTest


final class MovieAPIClientTests: XCTestCase {

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
    var apiClient: MovieAPIClient!
        override func setUp() {
            super.setUp()
            // Use the mock networking service during testing
            let mockNetworkingService = MockNetworkingService()
            apiClient = MovieAPIClient(networkingService: mockNetworkingService)
        }
        override func tearDown() {
            apiClient = nil
            super.tearDown()
        }
        func testFetchMovieData() {
            let expectation = self.expectation(description: "Fetch movie data")
            apiClient.fetchMovieData { result in
                switch result {
                case .success(let movie):
                    // Assert the properties of the movie object you expect to receive
                    XCTAssertEqual(movie.title, "Sample Movie")
                    XCTAssertEqual(movie.genre, "Drama")
                case .failure(let error):
                    XCTFail("Error: \(error.localizedDescription)")
                }
                expectation.fulfill()
            }
            wait(for: [expectation], timeout: 5.0)
        }

}
