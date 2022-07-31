//
//  NetworkClient.swift
//  HamiltonAssessmentTask
//
//  Created by Ramin Akhmad on 31.07.2022.
//

import Foundation

protocol NetworkProtocol {
    func request<T: Decodable>(type: T.Type, urlString: String, completion: @escaping (Result<T?, Error>) -> Void)
}


class NetworkClient: NetworkProtocol {
    private let session: URLSession = {
        URLSession(configuration: .default)
    }()
    
    func request<T: Decodable>(type: T.Type, urlString: String, completion: @escaping (Result<T?, Error>) -> Void) {
        guard let url = URL(string: urlString) else {
            completion(.failure(Err.badUrl(urlString)))
            return
        }
        
        session.dataTask(with: url) { data, response, error in
            guard let data = data else {
                completion(.failure(Err.noData))
                return
            }
            
            guard let decoded: T = self.decode(data: data) else {
                completion(.failure(Err.decodeFailed))
                return
            }
            
            completion(.success(decoded))
        }
        .resume()
    }
    
    private func decode<T: Decodable>(data: Data) -> T? {
        do {
            return try JSONDecoder().decode(T.self, from: data)
        }
        catch {
            
        }
        
        return nil
    }
    
    enum Err: Error {
        case badUrl(_: String)
        case noData
        case decodeFailed
    }
}
