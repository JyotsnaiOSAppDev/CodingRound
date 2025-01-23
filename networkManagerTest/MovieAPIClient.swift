//
//  MovieAPIClient.swift
//  networkManagerTest
//
//  Created by Jyotsna Jayanteyee Pandey on 12/01/25.
//
import Foundation
class MovieAPIClient {
    private let networkingService: NetworkingService
  
  init(networkingService: NetworkingService) {
        self.networkingService = networkingService
    }
    func fetchMovieData(completion: @escaping (Result<Movie, Error>) -> Void) {
        guard let url = URL(string: "https://api.example.com/movies") else {
            return
        }
        networkingService.fetchData(url: url) { data, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            // Parse the data into your Movie model or any other model you are using
            // For simplicity, let's assume we have a Movie struct:
            let decoder = JSONDecoder()
            do {
                let movie = try decoder.decode(Movie.self, from: data!)
                completion(.success(movie))
            } catch {
                completion(.failure(error))
            }
        }
    }
}
