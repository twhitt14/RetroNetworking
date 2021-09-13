//
//  NetworkRequestService.swift
//
//
//  Created by Trevor Whittingham on 9/13/21.
//  Copyright © 2021 Retro LLC. All rights reserved.
//

import Foundation

public struct NetworkRequestService {
    static public func makeRequestWith(url: URL, headers: [NetworkHeader], completion: @escaping (Result<Data, Error>) -> Void) {
        var request = URLRequest(url: url)
        for header in headers {
            request.setValue(header.value, forHTTPHeaderField: header.key)
        }

        let task = URLSession.shared.dataTask(with: request) { data, response, error in

            DispatchQueue.main.async {
                if let error = error {
                    completion(.failure(error))
                    return
                }

                guard let data = data
                else {
                    let error = NSError.with(description: "No data returned")
                    completion(.failure(error))
                    return
                }
                
                completion(.success(data))
            }
        }
        
        task.resume()
    }
    
    static public func makeRequestWith(baseURLString: String, headers: [NetworkHeader], parameters: [NetworkParameter], completion: @escaping (Result<Data, Error>) -> Void) {
        guard let urlWithParameters = makeURLWith(baseURLString: baseURLString, parameters: parameters) else {
            let error = NSError.with(description: "Invalid URL")
            completion(.failure(error))
            return
        }
        
        makeRequestWith(url: urlWithParameters, headers: headers, completion: completion)
    }
    
    static public func makeURLWith(baseURLString: String, parameters: [NetworkParameter]) -> URL? {
        var urlStringWithParameters = baseURLString
        if !parameters.isEmpty {
            urlStringWithParameters += "?"
            for (index, parameter) in parameters.enumerated() {
                if index > 0 {
                    urlStringWithParameters += "&"
                }
                urlStringWithParameters += "\(parameter.key)=\(parameter.value)"
            }
        }
        
        return URL(string: urlStringWithParameters)
    }
}
