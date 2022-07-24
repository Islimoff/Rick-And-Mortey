//
//  NetworkManager.swift
//  Rick and Mortey
//
//  Created by Сапронов Игорь on 02.06.2022.
//

import Foundation

class NetworkManager {
    
    let baseUrlString = "https://rickandmortyapi.com/api/"
    
    let session = URLSession.shared
    
    let decoder = JSONDecoder()
    
    func getDataWithComplition <T: Codable> (with method: String,
                                             expectedType: T.Type,
                                             complition: @escaping (Result<T, Error>) ->()) {
        
        guard let url = URL(string: baseUrlString + method) else {return}
        
        session.dataTask(with: url) { [weak self] data, response, error in
            if let response = response as? HTTPURLResponse {
                print(response.statusCode)
            }
            if let error = error {
                complition(.failure(error))
                return
            }
            if let parceData = data {
                guard let decoded = try? self?.decoder.decode(T.self, from: parceData) else {return}
                complition(.success(decoded))
            }
        }.resume()
    }
}
