//
//  NetworkManager.swift
//  Rick and Mortey
//
//  Created by Сапронов Игорь on 02.06.2022.
//

import Foundation

class NetworkManager {

    private let baseUrlString = "https://rickandmortyapi.com/api/"
    
    private let session = URLSession.shared
    
    private let decoder = JSONDecoder()
    
    func getDataWithComplition <T: Codable> (with method: String,
                                             expectedType: T.Type,
                                             complition: @escaping (Result<T,Error>) ->()) {
        
        guard let url = URL(string: baseUrlString + method) else {
            complition(.failure(NetworkError.urlError))
            return
        }
        
        session.dataTask(with: url) { [weak self] data, response, error in
            if let response = response as? HTTPURLResponse {
                print(response.statusCode)
            }
            if let error = error {
                complition(.failure(error))
                return
            }
            if let parceData = data {
                guard let decoded = try? self?.decoder.decode(T.self, from: parceData) else {
                    complition(.failure(NetworkError.decodeError))
                    return
                }
                complition(.success(decoded))
            }
        }.resume()
    }
}
