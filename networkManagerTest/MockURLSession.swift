//
//  MockURLSession.swift
//  networkManagerTest
//
//  Created by Jyotsna Jayanteyee Pandey on 11/01/25.
//


import Foundation
protocol NetworkingService {
func fetchData(url: URL, completion: @escaping (Data?, Error?) -> Void)
}
class MockNetworkingService: NetworkingService {
    func fetchData(url: URL, completion: @escaping (Data?, Error?) -> Void) {
        // Mock the data and response here (e.g., create a sample JSON response)
        let jsonString = """
            {
                "title": "Sample Movie",
                "genre": "Drama"
            }
        """
        if let data = jsonString.data(using: .utf8) {
            completion(data, nil)
        } else {
            let error = NSError(domain: "MockNetworkingServiceErrorDomain", code: -1, userInfo: nil)
            completion(nil, error)
        }
    }
}


